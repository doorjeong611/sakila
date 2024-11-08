package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {

	int insertActorFile(ActorFile actorFile);
	 
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	// /on/removeActorFile -> 단일파일 삭제
	int deleteActorFile(int actorFileId);
	
	// /on/removeActorFile : Service
	ActorFile selectActorFileOne(int actorFileId);
	
	// on/deleteActor -> 관련 배우의 모든 파일 삭제
	int deleteActorFileByActor(int actorId);
	
	
}
