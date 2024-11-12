package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

@Mapper
public interface FilmMapper {
	
	// on/actorOne
	/*public abstract*/List<Film> selectFilmTitleListByActor(int actorId);
	
	// on/filmOne : film join language
	Map<String, Object> selectfilmOne(int filmId);
	
	// on/addFilm
	int insertFilm(Film film);
	
	// on/actorOne : film 검색시 사용.
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// on/filmList 
	// category 없을 때(categoryId == -1) filmList
	List<Map<String , Object>> selectFilmList(Map<String , Object> paramMap);
	
	// on/filmList 
	// category 있을 때(categoryId != -1) filmList
	List<Map<String , Object>> selectFilmListByCategory(Map<String , Object> paramMap);
	
	// on/filmList 
	// category 없을 때(categoryId == -1) : totalFilmCount : lastPage구하기
	int selectFilmTotalCount(Integer categorrId);
	
	// on/filmList 
	// category 있을 때(categoryId != -1) : totalFilmCount : lastPage구하기
	int selectFilmTotalCountByCategoty(Integer categorrId);
	
	
	// on/languageList 
	List<Language> selectLanguageList();
	
	// on/addLanguage
	int insertLanguage(String name);
	
	// on/removeFilm 
	Integer deleteFilmByKey(Integer filmId);
	
	// on/modifyFilm
	Integer updateFilm(Film film);
	
}
