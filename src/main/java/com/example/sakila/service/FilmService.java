package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Film;

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
	
	
	
}
