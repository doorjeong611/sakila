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
	
	@PostMapping("addFilmByActor")
	public String addFilmByActor(FilmActor filmActor) {
		log.debug("[Post -addFilmByActor ]" );
		log.debug("filmId: " + filmActor.getFilmId());
		log.debug("actorId" + filmActor.getActorId());
		
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}

	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		log.debug("[Get -removeFilmActor ]" );
		log.debug("filmId: " + filmActor.getFilmId());
		log.debug("actorId" + filmActor.getActorId());
		
		filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
	
	
	
}
