package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	
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
	
	
	@GetMapping("/on/actorList")
	public String actorList(@RequestParam (defaultValue = "1") int currentPage, @RequestParam (defaultValue = "10") int rowPerPage) {
		log.debug("[Get-actorList]");
		return "on/actorList";
	}
	
	
	
	
}
