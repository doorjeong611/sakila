package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
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
	@Autowired InventoryService inventoryService;
	@Autowired FilmCategoryService filmCategoryService;
	
	// on/filmOne
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam Integer filmId, @RequestParam(required = false) String searchName ) {
		log.debug("[GET - filmOne]");
		
		/** [출력 정보]
		 * 1) 해당 film의 정보
		 * 2) 전체 category
		 * 3) 해당 film의 category
		 * 4) actor 검색(searchName) -> 검색어 관련 actorList
		 * 5) 해당 film의 출연 actorList 
		 **/
		
		// 1) 해당 film의 정보
		Map<String, Object> film = filmService.getFilmOne(filmId);	
		log.debug("film_language : " + film.get("language"));
		
		// 2) 전체 category
		List<Category> allCategoryList = categoryService.getCategoryList();
		log.debug("allCategoryList.0.categoryId : " + allCategoryList.get(0).getCategoryId());
		
		// 3) 해당 film의 category
		List<Map<String, Object>> filmCategoryList = filmCategoryService.getFilmCategoryListByFilm(filmId);
		
		// 4) actor 검색(searchName) -> 검색어 관련 actorList
		if(searchName != null || searchName != "") { // 배우이름검색 버튼을 통해 요청이 들어온다면
			List<Actor> searchActorList = actorService.getActorListBySearch(searchName);
			
			model.addAttribute("searchActorList", searchActorList);
		}
		
		
		// 5) 해당 film의 출연 actorList 
		List<Actor> actorList =  actorService.getActorListByFilm(filmId);
		
		model.addAttribute("film", film);
		model.addAttribute("allCategoryList", allCategoryList);
		model.addAttribute("filmCategoryList", filmCategoryList);
		model.addAttribute(actorList);
		
		log.debug("film_language : " + film.get("language"));
		//log.debug("actorList firstName : " + actorList.get(0).getFirstName());
		
		
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
	
	// on/removeFilm
	@GetMapping("/on/removeFilm")
	public String getRemoveFilm(Model model, @RequestParam(required = false) Integer filmId ) {
		log.debug("[Get - removeFilm]");
		
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		log.debug("count : " + count);
		
		if(count != 0) {
			String removeMsg = "INVENTORY에 존재! 삭제 불가";
			model.addAttribute("removeMsg", removeMsg);
			
			Map<String, Object> film = filmService.getFilmOne(filmId);		
			List<Actor> actorList =  actorService.getActorListByFilm(filmId);
			
			model.addAttribute("film", film);
			model.addAttribute(actorList);
			
			return "on/filmOne";
		}
		
		filmService.removeFilmByKey(filmId);
		
		return "redirect:/on/filmList";
	}
	
	
	// on/modifyFilm
	@GetMapping("/on/modifyFilm")
	public String modifyFilm( @RequestParam(required = false) Integer filmId , Model model) {
		log.debug("[Get - modifyFilm]");
		log.debug("filmId : " + filmId);
		// modifyFilmForm.jsp로 이동
		
		// Language
		List<Language> languageList = languageService.getLanguageList();
		
		Map<String, Object> map = filmService.getFilmOne(filmId);
		log.debug("title : " + map.get("title"));
		log.debug("releaseYear : " + map.get("releaseYear"));
		log.debug("languageId : " + map.get("languageId"));
		
		model.addAttribute("map", map);
		model.addAttribute("languageList", languageList);
		model.addAttribute("filmId", filmId);
		
		return "/on/modifyFilmForm";
	}
	
	
	// on/modifyFilm
	@PostMapping("/on/modifyFilm")
	public String postMethodName(@RequestParam int filmId, FilmForm filmForm , Model model) {
		log.debug("[Post - modifyFilm]");
		log.debug("filmId : " + filmId);
		
		log.debug("title : " + filmForm.getTitle());
		
		filmService.modifyFilm(filmForm, filmId);
		
		// 다시 filmOne으로 돌아가기 위해..
		Map<String, Object> film = filmService.getFilmOne(filmId);		
		List<Actor> actorList =  actorService.getActorListByFilm(filmId);
		
		model.addAttribute("film", film);
		model.addAttribute(actorList);
		
		model.addAttribute("filmId", filmId);
		
		return "on/filmOne";
	}
	
	
	
}
