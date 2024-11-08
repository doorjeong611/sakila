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
import org.springframework.web.bind.annotation.RequestBody;



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
	public String addActor(HttpSession session, ActorForm actorForm , Model model) {
		log.debug("[POST-addActor]");
		log.debug("firstName : "+actorForm.getFirstName());
		log.debug("lastName : "+actorForm.getLastName());
		log.debug("actorFile : "+actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFileSize : "+actorForm.getActorFile().size());
		}
		
		
		List<MultipartFile> list = actorForm.getActorFile();
		if(list != null && list.size() != 0) {
				
			for(MultipartFile f : list) {
				if(!f.getContentType().equalsIgnoreCase("image/jpeg") || !f.getContentType().equalsIgnoreCase("image/jgp") || 
						!f.getContentType().equalsIgnoreCase("image/png") || !f.getContentType().equalsIgnoreCase("image/gif") ) {
					
					String msg="이미지 파일만 첨부가능";
					model.addAttribute("msg", msg);
					return "on/addActor";
				}
			}
		}
		
		String path = session.getServletContext().getRealPath("/upload/");
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
	public String actorOne(@RequestParam int actorId, @RequestParam(defaultValue = "") String searchTitle,Model model) {
		log.debug("[GET - actorOne ]");
		
		// searchWord = ""이라면 actorOne 요청, ""이 아니라면 film검색 요청임.
		
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.getActorFileListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		
		log.debug("actor : "+ actor.toString());		
		log.debug("actorFileList : "+ actorFileList.toString());		
		log.debug("filmList : "+ filmList.toString());		
		
		if(!searchTitle.equals("")) {
			// film검색결과 리스트를 추가.
			List<Film> searchFilmList =  filmService.getFilmListByTitle(searchTitle);
			model.addAttribute("searchFilmList", searchFilmList);
		}
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		
		
		return "/on/actorOne";
	}
	
	// on/modifyActor : actor 정보 수정
	@GetMapping("/on/modifyActor")
	public String modifyActor(@RequestParam int actorId, Model model) {
		log.debug("[GET - modifyActor]");
		log.debug("actorId : "+ actorId);	
		
		// service로부터 actorOne 요청해서 actorId일치하는 배우 정보 받기 -> modifyForm으로 전달
		Actor actor = actorService.getActorOne(actorId);

		model.addAttribute("actorId", actorId );
		model.addAttribute("actor", actor );
		
		return "on/modifyActor";
	}
	
	// on/modifyActor
	@PostMapping("/on/modifyActor")
	public String modifyActor(Actor actor) {
		log.debug("[GET - modifyActor]");
		log.debug("actorId : "+ actor.getActorId());	
		
		// service -> modify
		int result = actorService.modifyActor(actor);
		log.debug("result : "+ result);
		
		return "redirect:/on/actorList";
	}
	

	// /on/removeActor
	@GetMapping("/on/removeActor")
	public String removeActor(@RequestParam int actorId, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/upload/");
		
		actorService.removeActor(actorId, path);
		
		return "redirect:/on/actorList";
	}
	
	
	
	
	
}
