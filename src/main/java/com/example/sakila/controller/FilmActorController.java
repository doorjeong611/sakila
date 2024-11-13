package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;


@Slf4j
@Controller
public class FilmActorController {
	
	@Autowired FilmActorService filmActorService;
	
	// /on/actorOne : 배우의 필모그래피 추가.
	@PostMapping("/on/addFilmActorByActor")
	public String addFilmActorByActor(FilmActor filmActor) {
		log.debug("[Post -addFilmByActor ]" );
		log.debug("filmId: " + filmActor.getFilmId());
		log.debug("actorId" + filmActor.getActorId());
		
		int result = filmActorService.addFilmActor(filmActor);
		
		log.debug("result" + result);
		
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
	

	// actorOne : 배우의 필모그래피 삭제
	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		log.debug("[Get -removeFilmActor ]" );
		log.debug("filmId: " + filmActor.getFilmId());
		log.debug("actorId" + filmActor.getActorId());
		
		filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
	
	// /on/filmOne : 필름의 출연 배우 추가. 
	@PostMapping("/on/addFilmActorByFilm")
	public String addFilmActorByFilm(FilmActor filmActor) {
		log.debug("[Post -addFilmActorByFilm ]" );
		log.debug("filmId: " + filmActor.getFilmId());
		log.debug("actorId" + filmActor.getActorId());
		
		int result = filmActorService.addFilmActor(filmActor);
		
		log.debug("result" + result);
		
		return "redirect:/on/filmOne?filmId="+filmActor.getFilmId();
	}
	
	
	// /on/filmOne : 필름의 출연 배우 삭제. 
	@GetMapping("/on/removeFilmActorByFilm")
	public String removeFilmActorByFilm(FilmActor filmActor) {
		log.debug("[Get -removeFilmActorByFilm ]" );
		log.debug("filmId: " + filmActor.getFilmId());
		log.debug("actorId" + filmActor.getActorId());
		
		filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/filmOne?filmId="+filmActor.getFilmId();
	}
	
	
	
}
