package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
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
	@Autowired CategoryService categoryService;
	
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
	
	// on/filmList
	@GetMapping("/on/filmList")
	public String filmList(@RequestParam(required = false) Integer categoryId
											, @RequestParam(defaultValue = "1" ) int currentPage
											, @RequestParam(defaultValue = "10") int rowPerPage
											, Model model) {
		log.debug("[Get - filmList]");
		log.debug("categoryId : " + categoryId);
		log.debug("currentPage : " + currentPage);
		log.debug("rowPerPage : " + rowPerPage);

		// filmList
		List<Map<String , Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		log.debug("filmList : " + filmList.toString());
		
		
		// categoryList
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList : " + categoryList.toString());
		
		// pagination
		int lastPage = filmService.getFilmTotalCount(rowPerPage, categoryId);
		
		model.addAttribute("filmList", filmList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("CurrentCategoryId", categoryId); // jsp에서 select부분에 보여주기 위해 추가
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		
		return "on/filmList";
	}
	
	// on/languageList
	@GetMapping("/on/languageList")
	public String getLanguageList(Model model) {
		log.debug("[Get - getLanguageLists]");
		
		List<Language> langList = filmService.getLanguageList();
		log.debug("languageList : " + langList.toString());
		
		model.addAttribute("langList", langList);

		return "on/languageList";
	}
	
	// on/addLanguage
	@GetMapping("/on/addLanguage")
	public String addLanguage() {
		log.debug("[Get - addLanguage]");

		return "on/addLanguage";
	}
	
	// on/addLanguage
	@PostMapping("/on/addLanguage")
	public String addLanguage(@RequestParam String name, Model model) {
		log.debug("[Post - addLanguage]");
		
		int result = filmService.addLanguage(name);
		log.debug("result : " + result);
		
		if(result == -1) {
			String msg = "이미 등록된 언어입니다.";
			model.addAttribute("msg", msg);
			 return "on/addLanguage";
		}
		
		
		
		return "redirect:/on/languageList";
	}
	
	
	
}
