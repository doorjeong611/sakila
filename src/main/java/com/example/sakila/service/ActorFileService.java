package com.example.sakila.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class ActorFileService {

	@Autowired
	ActorFileMapper actorFileMapper;

	// /on/actorOne : fileList용
	public List<ActorFile> getActorFileListByActor(int actorId) {

		return actorFileMapper.selectActorFileListByActor(actorId);
	}

	// /on/addActorFile
	public void addActorFile(ActorForm actorForm, String path) {

		int actorId = actorForm.getActorId();
		
		if(actorForm.getActorFile() != null) {
			
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
