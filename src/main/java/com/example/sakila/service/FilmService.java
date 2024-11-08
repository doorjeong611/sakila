package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class FilmService {
	
	@Autowired FilmMapper filmMapper;
	
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
	
	
	public List<Film> getFilmListByTitle(String searchTitle){
		return filmMapper.selectFilmListByTitle(searchTitle);
	}
	
	
}
