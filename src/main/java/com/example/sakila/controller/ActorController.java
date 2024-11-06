package com.example.sakila.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	@Autowired ActorFileService actorFileService;
	@Autowired FilmService filmService;
	
	
	// Actor 추가 폼으로
	@GetMapping("/on/addActor")
	public String addActor() {
		log.debug("[Get-addActor]");
		return "on/addActor";
	}
	
	// addActor.jsp에서 넘어와 처리
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session, ActorForm actorForm) {
		log.debug("[POST-addActor]");
		log.debug("firstName : "+actorForm.getFirstName());
		log.debug("lastName : "+actorForm.getLastName());
		log.debug("actorFile : "+actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFileSize : "+actorForm.getActorFile().size());
		}
		
		String path = session.getServletContext().getRealPath("/upload")+"/";
		log.debug("upload path : "+path);
		
		actorService.addActor(actorForm, path);
		
		
		return "redirect:/on/actorList";
	}
	
	
	// actorList.jsp
	@GetMapping("/on/actorList")
	public String actorList(@RequestParam (defaultValue = "1") int currentPage
							, @RequestParam (defaultValue = "10") int rowPerPage
							,  @RequestParam (required = false ) String searchWord
							, Model model) {
		// @RequestParam은 null을 받을 수 없음. required = false로 설정해야 null도 받을 수 있음
		
		log.debug("[Get-actorList]");
		log.debug("searchWord : " + searchWord);
		
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		
		// searchWord 유/무에 따른 getTotalCount를 호출해서 lastPage구하기
		int lastPage = actorService.getTotalCount(rowPerPage, searchWord);
		log.debug("lastPage : " + lastPage);
		
		int num = 0;
		
		model.addAttribute("actorList", actorList);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "on/actorList";
	}
	
	// actorOne
	@GetMapping("/on/actorOne")
	public String actorOne(@RequestParam int actorId, Model model) {
		log.debug("[GET - actorOne ]");
		
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.getActorFileListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		
		log.debug("actor : "+ actor.toString());		
		log.debug("actorFileList : "+ actorFileList.toString());		
		log.debug("filmList : "+ filmList.toString());		
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		
		
		return "/on/actorOne";
	}
	
	
	
	
}
