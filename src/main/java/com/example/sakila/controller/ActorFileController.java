package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;



@Slf4j
@Controller
public class ActorFileController {
	
	@Autowired ActorFileService actorFileService;
	
	@GetMapping("/on/addActorFile")
	public String addActorFile(@RequestParam int actorId, Model model) {
		log.debug("[GET-addActorFile]");
	
		// 파라미터 값은 model에 담지 않더라도 el을 이용하여 받을 수 있지만 가독성을 위해 Model에 담음.
		model.addAttribute("actorId", actorId);
		
		return "on/addActorFile";
	}
	
	// addFile
	@PostMapping("/on/addActorFile")
	public String addActorFile(HttpSession session, ActorForm actorForm, Model model) {
		log.debug("[POST - addActorFile]");
		
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile f : list) {
			if(!f.getContentType().equalsIgnoreCase("image/jpeg") && !f.getContentType().equalsIgnoreCase("image/jgp") && 
					!f.getContentType().equalsIgnoreCase("image/png") && !f.getContentType().equalsIgnoreCase("image/gif") ) {
				
				String msg="이미지 파일만 첨부가능";
				model.addAttribute("msg", msg);
				model.addAttribute("actorId", actorForm.getActorId());
				return "on/addActorFile";
			}
		}
		

		String path = session.getServletContext().getRealPath("/upload/");
		log.debug("upload path : "+path);
		
		
		actorFileService.addActorFile(actorForm, path);
		
		int actorId = actorForm.getActorId();
		
		return "redirect:/on/actorOne?actorId="+ actorId;
	}
	
	
}
