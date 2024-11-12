package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class FilmService {
	
	@Autowired FilmMapper filmMapper;
	@Autowired FilmActorMapper filmActorMapper;
	@Autowired FilmCategoryMapper filmCategoryMapper;
	
	// /on/actorOne
	public List<Film> getFilmTitleListByActor(int actorId) {
		
		return filmMapper.selectFilmTitleListByActor(actorId);
	}
	
	// /on/filmOne
	public Map<String, Object> getFilmOne(int filmId){
		return filmMapper.selectfilmOne(filmId);
	}
	
	// on/addFilm
	public int addFilm(FilmForm filmForm) {
		log.debug("[FilmService]");
		Film film = new Film();
		
		// FilmForm -> Film
		film.setTitle(filmForm.getTitle());
		film.setDescription(filmForm.getDescription().equals("") ? null : filmForm.getDescription());
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		
		// specialFeatures 배열 -> ,문자열
		String specialFeatures = "";
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		}else {
			for(int i=0; i<filmForm.getSpecialFeatures().size(); i++) {
				
				
				if(i == filmForm.getSpecialFeatures().size()-1) {
					specialFeatures += filmForm.getSpecialFeatures().get(i);
				}else {
					specialFeatures += filmForm.getSpecialFeatures().get(i) + ",";
				}
			}
			
			film.setSpecialFeatures(specialFeatures);
		}
		log.debug("specialFeatures : "+ specialFeatures);
		log.debug("LanguageId : "+ filmForm.getLanguageId());
		
		return filmMapper.insertFilm(film);
	}
	
	// on/actorOne : filmList Search
	public List<Film> getFilmListByTitle(String searchTitle){
		return filmMapper.selectFilmListByTitle(searchTitle);
	}
	
	
	// /on/filmList : filmList
	public List<Map<String , Object>> getFilmList(Integer categoryId, int currentPage, int rowPerPage){
		log.debug("[FilmService - getFilmList]");
		
		Map<String, Object> paramMap = new HashMap<>();
		if(categoryId == null || categoryId == -1) { // categoryId가 없을 때
			
			paramMap.put("categoryId", null);
		}else {
			paramMap.put("categoryId", categoryId);
		}
		int beginRow = (currentPage - 1)*rowPerPage;
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);

		log.debug("categoryId : " + categoryId);
		
		if(paramMap.get("categoryId") == null) {
			return filmMapper.selectFilmList(paramMap);
			
		}else {
			return filmMapper.selectFilmListByCategory(paramMap);
		}
		
		
	}
	
	// on/filmList : filmList totalCount
	public int getFilmTotalCount(int rowPerPage, Integer categoryId ) {
		log.debug("[FilmService - getFilmTotalCount]");
		
		log.debug("categoryId : "+ categoryId);
		log.debug("rowPerPage : "+ rowPerPage);
		
		int totalCount = -1;
		
		if(categoryId == null || categoryId == -1) {
			totalCount = filmMapper.selectFilmTotalCount(categoryId);
		}else {
			totalCount = filmMapper.selectFilmTotalCountByCategoty(categoryId);
		}
		
		log.debug("totalCount : "+ totalCount);

		int lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		log.debug("lastPage : "+ lastPage);
		
		return lastPage;
	}
	
	// on/languageList 
	public List<Language> getLanguageList(){
		log.debug("[FilmService - getLanguageList]");
		
		return filmMapper.selectLanguageList();
	}
	
	// on/addLanguage
	public int addLanguage(String name) {
		log.debug("[FilmService - addLanguage]");
		
		List<Language> list = filmMapper.selectLanguageList();
		
		for(Language s : list) {
			
			if(name.equals(s.getName())) {// 등록하려는 언어의 중복 확인
				return -1;
			}
			
		}

		return filmMapper.insertLanguage(name);
	}
	
	// on/removeFilm
	public void removeFilmByKey(Integer filmId) {
		log.debug("[FilmService - removeFilmByKey]");
		
		// 필름_카테고리 삭제
		filmCategoryMapper.deleteFilmCategoryByFilm(filmId);
		// 필름_배우 삭제
		filmActorMapper.deleteFilmActorByFilm(filmId);
		// 필름 삭제
		filmMapper.deleteFilmByKey(filmId);
		
		
	}
	
	// on/modifyFilm
	public void modifyFilm(FilmForm filmForm, Integer filmId) {
		log.debug("[FilmService - modifyFilm]");
		log.debug("filmId : " + filmId);
		Film film = new Film();
		
		// FilmForm -> Film 변환
		film.setTitle(filmForm.getTitle());
		film.setDescription(filmForm.getDescription().equals("") ? null : filmForm.getDescription());
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		
		// specialFeatures 배열 -> ,문자열
		String specialFeatures = "";
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		}else {
			for(int i=0; i<filmForm.getSpecialFeatures().size(); i++) {
				
				
				if(i == filmForm.getSpecialFeatures().size()-1) {
					specialFeatures += filmForm.getSpecialFeatures().get(i);
				}else {
					specialFeatures += filmForm.getSpecialFeatures().get(i) + ",";
				}
			}
			
			film.setSpecialFeatures(specialFeatures);
		}
		
		film.setFilmId(filmId);
		
		log.debug("specialFeatures : "+ specialFeatures);
		log.debug("LanguageId : "+ filmForm.getLanguageId());
		
		filmMapper.updateFilm(film);
		
	}
	
	
}
