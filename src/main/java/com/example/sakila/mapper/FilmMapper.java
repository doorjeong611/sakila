package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	
	// on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
	
	// on/filmOne : film join language
	Map<String, Object> selectfilmOne(int filmId);
	
	// on/addFilm
	int insertFilm(Film film);
	
	// on/actorOne : film 검색시 사용.
	List<Film> selectFilmListByTitle(String searchTitle);
	
	
}
