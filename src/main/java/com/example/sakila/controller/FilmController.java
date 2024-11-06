package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	
	
	@GetMapping("/on/filmOne")
	public String filmOne(@RequestParam int filmId, Model model) {
		log.debug("[GET - filmOne]");
		
		Map<String, Object> film = filmService.getFilmOne(filmId);		
		List<Actor> actorList =  actorService.getActorListByFilm(filmId);
		
		model.addAttribute("film", film);
		model.addAttribute(actorList);
		
		log.debug("film_language : " + film.get("language"));
		log.debug("actorList firstName : " + actorList.get(0).getFirstName());
		
		
		return "on/filmOne";
	}
	
	

	
	
}
