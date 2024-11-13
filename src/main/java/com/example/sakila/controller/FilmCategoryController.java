package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.vo.FilmCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmCategoryController {
	
	@Autowired FilmCategoryService filmCategoryService; 
	
	@PostMapping("/on/addFilmCategory")
	public String addFilmCategory(FilmCategory filmCategory) {
		log.debug("[Post - addFilmCategory]");
		log.debug("filmCategory : "+ filmCategory.toString());
		
		int result = filmCategoryService.addFilmCategory(filmCategory);
		
		log.debug("result : "+ result );
	
		return "redirect:/on/filmOne?filmId="+ filmCategory.getFilmId();
	}
	
	@GetMapping("/on/removeFilmCategory")
	public String removeFilmCategory(FilmCategory filmCategory) {
		log.debug("[Get - removeFilmCategory]");
		log.debug("filmCategory : "+ filmCategory.toString());
		
		int result = filmCategoryService.removeFilmCategory(filmCategory);
			
		log.debug("result : "+ result );
		
		return "redirect:/on/filmOne?filmId="+ filmCategory.getFilmId();
	}
	
	
	
	
	
}
