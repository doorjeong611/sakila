package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {

	
	int insertActor(Actor actor);
	
	// on/actorList
	List<Actor> selectActorList(Map<String, Object> map);
	
	// actorList
	int selectTotalCount(Map<String, Object> map);
	
	// actorOne
	Actor selectActorOne(int actorId);
	
	// filmOne : ACTORLIST
	List<Actor> selectActorListByFilm(int filmId);
	 
	
	// on/modifyActor -> modifyActor : (Mapper)updateActor
	int updateActor(Actor actor);
	
	
	// on/deleteActor
	int deleteActor(int actorId); 
	
	// on/filmOne : actor 검색 -> 추가 를 위한 검색기능. 
	List<Actor> selectActorListBySearch(String searchName);
	
}
