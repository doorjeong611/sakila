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
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Slf4j
@Controller
public class FilmController {
	
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	
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
	
	// on/addFilm
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		log.debug("[GET - addFilm]");
		// Language
		List<Language> languageList = languageService.getLanguageList();
		log.debug("languageList : " + languageList.toString());
		log.debug("languageList 0 languageId : " + languageList.get(0).getLanguageId());
		
		model.addAttribute("languageList", languageList);
		
		return "on/addFilm";
	}
	
	
	// on/addFilm
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		log.debug("[POST - addFilm]");
		log.debug("filmForm"+filmForm.toString());
		
		// service : filmform -> film 변환
		filmService.addFilm(filmForm);
		
		return "redirect:/on/filmList";
		
	}
	
	
	

	
	
}
