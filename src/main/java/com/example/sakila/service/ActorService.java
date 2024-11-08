package com.example.sakila.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.mapper.FilmActorMapper;

import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class ActorService {
	
	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;
	@Autowired FilmActorMapper filmActorMapper;
	
	// insertActorFile : 파일첨부
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
	
	// selectActorList
	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord){
		log.debug("[ActorService - getActorList]");
		log.debug("currentPage : " + currentPage);
		log.debug("rowPerPage : " + rowPerPage);
		log.debug("searchWord : " + searchWord);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage - 1)*rowPerPage;

		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);

		List<Actor> actorList = actorMapper.selectActorList(paramMap);
		
		return actorList;
	}
	
	
	// selectTotalCount
	public int getTotalCount( int rowPerPage, String searchWord) {
		log.debug("[ActorService - getTotalCount]");
				
		Map<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		map.put("rowPerPage", rowPerPage);

		
		int totalCount = actorMapper.selectTotalCount(map);
		
		int lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		log.debug("totalCount : " + totalCount);
		log.debug("lastPage : " + lastPage);
		
		return lastPage;
	}
	
	
	// /on/actorOne
	public Actor getActorOne(int actorId) {
		log.debug("[ActorService - getActorOne]");
		return actorMapper.selectActorOne(actorId);
	}
	

	// /on/filmOne
	public List<Actor> getActorListByFilm(int filmId){
		log.debug("[ActorService - getActorListByFilm]");
		
		return actorMapper.selectActorListByFilm(filmId);
	}
	
	
	// /on/modifyActor : modifyActor -> (Mapper)updateActor
	public int modifyActor(Actor actor) {
		log.debug("[ActorService - modifyActor]");
		
		return actorMapper.updateActor(actor);
		
	}
	
	// /on/deleteActor : 
	public void removeActor(int actorId, String path) {
		/*
		 * 1. film_actor 삭제
		 * 2. actor_file 삭제
		 * 3. actor 삭제
		 * 4. 물리적 파일 삭제
		 */
		
		// 1. film_actor 삭제
		filmActorMapper.deleteFilmActorByActor(actorId);
		
		// 2. actor_file 삭제
		List<ActorFile> list = actorFileMapper.selectActorFileListByActor(actorId);
		
		actorFileMapper.deleteActorFileByActor(actorId);

		
		//3. actor 삭제
		int row = actorMapper.deleteActor(actorId);
		
		
		//4. 물리적 파일 삭제
		if(row == 1 && list != null && list.size() > 0 ) {
			for(ActorFile af : list) {
				String fullName = path + af.getFilename() + af.getExt();
				
				File f = new File(fullName); // 있으면 가져오고 없으면 만들고
				f.delete();
				
			}
		}
		
		
		
		
	}
	
	
	
	
}
