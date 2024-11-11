package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {

	// actorOne : filmactor 입력
	int insertFilmActor(FilmActor filmActor);
	
	// actorOne : film 삭제 : 필모그래피 작품 삭제
	int deleteFilmActor(FilmActor filmActor);
	
	// deleteActor : 관련 배우의 모든 작품 삭제
	int deleteFilmActorByActor(int actorId);
	
}
