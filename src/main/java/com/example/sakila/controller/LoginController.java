package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.service.StaffService;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	/** Autowired **/
	@Autowired StaffService staffService; // private해도 됨. 하지만 편하게 사용하기 위해 default로 설정함.


	// 로그인 폼으로 이동
	@GetMapping("/off/login")
	public String login() {
		// OffInterceptor 호출
		log.debug("/off/login 실행");
		
		return "off/login";
		
	}
	
	// 로그인 액션
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
			@RequestParam( name="username") String username , @RequestParam( name="password") String password) { // 입력받는 값
		
		// OffInterceptor 호출
		log.debug("/off/login 실행");
		log.debug("username---> "+username);
		
		// int staffId = Integer.parseInt(request.getParameter("staffId"));
		// String password = request.getParameter("password");
		
		Staff paramStaff = new Staff();
		paramStaff.setUsername(username);
		paramStaff.setPassword(password);
		
		log.debug("param Id"+paramStaff.getStaffId());
		log.debug("param PW"+paramStaff.getPassword());
		
		// loginService의 login()을 호출해 Mapper에 접근
		Staff loginStaff = staffService.login(paramStaff);
		
		if(loginStaff == null ) {// 로그인 실패
			model.addAttribute("msg", "로그인 실패 !");
			return "off/login"; // 포워딩 
		}
		session.setAttribute("loginStaff", loginStaff);
		
		log.debug("loginStaff.getRole()---> "+ loginStaff.getRole());
		
		return "redirect:/on/main";
	}
	
	// 로그아웃
	@GetMapping("/on/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		log.debug("/on/logout 실행 - 로그아웃 성공");
		
		return"redirect:/off/login";
	}
	
	
	
	
	
}
