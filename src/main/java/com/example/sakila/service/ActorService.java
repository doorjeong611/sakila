package com.example.sakila.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorService {
	
	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;
	
	public void addActor(ActorForm actorForm, String path) {
		Actor actor = new Actor();
		actor.setFirstName(actorForm.getFirstName());
		actor.setLastName(actorForm.getLastName());
		
		int row1 = actorMapper.insertActor(actor);
		// keyProperty="actorId"를 반환하므로 받을 수 있음.
		int actorId = actor.getActorId();
		
		if(row1 == 1 && actorForm.getActorFile() != null) { // actor insert 성공하고 파일이 존재한다면 
			// 파일 입력, ActorFile입력
			List<MultipartFile> list = actorForm.getActorFile();
			for(MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();
				
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(dotIdx+1);
				String originname = mf.getOriginalFilename().substring(0,dotIdx);
				
				actorFile.setActorId(actorId);
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());
				String filename = UUID.randomUUID().toString().replace("-", "");
				actorFile.setFilename(filename);
				actorFile.setExt(ext);
				actorFile.setOriginname(originname);
				
				int row2 = actorFileMapper.insertActorFile(actorFile);
			
				if(row2 == 1) {
					// 물리적 파일 저장
					
					try {
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						// 예외 발생 후 예외처리를 하지 않아야 @transactional이 작동함. 
						// IllegalException, IOException은 예외처리를 하지 않으면 코드가 실행이 안됨
						e.printStackTrace();
						
						// 그렇기 때문에 예외가 발생해도 코드가 실행되는 runtimeException을 인위적으로 발생시킴
						throw new RuntimeException();
					}
				}
				
			}
			
		}
		
		
	}
}
