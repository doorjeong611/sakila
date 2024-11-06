package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {

	
	int insertActor(Actor actor);
	
	// actorList
	List<Actor> selectActorList(Map<String, Object> map);
	
	// actorList
	int selectTotalCount(Map<String, Object> map);
	
	// actorOne
	Actor selectActorOne(int actorId);
	
	// filmOne : ACTORLIST
	List<Actor> selectActorListByFilm(int filmId);
	 
}
