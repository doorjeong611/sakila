package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class ActorFileService {
	
	@Autowired ActorFileMapper actorFileMapper;
	
	// /on/actorOne
	public List<ActorFile> getActorFileListByActor(int actorId){
		
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
	
}
