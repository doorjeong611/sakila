package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {

	
	int insertActor(Actor actor);
	
	List<Actor> selectActorList(Map<String, Object> map);
	
	int selectTotalCount(Map<String, Object> map);
	
	Actor selectActorOne(int actorId);
	 
}
