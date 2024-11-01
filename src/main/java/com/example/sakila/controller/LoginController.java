package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	/** Autowired **/
	// staffMapper는 인터페이스이므로 객체생성 불가 이의 자식의 객체가 스프링 빈에 들어가있음 (다형성)
	@Autowired StaffMapper staffMapper; // private해도 됨. 하지만 편하게 사용하기 위해 default로 설정함.
	
	
	

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
			@RequestParam( name="staffId") int staffId , @RequestParam( name="password") String password) { 
		
		// OffInterceptor 호출
		log.debug("/off/login 실행");
		
		// int staffId = Integer.parseInt(request.getParameter("staffId"));
		// String password = request.getParameter("password");
		
		Staff paramStaff = new Staff();
		paramStaff.setStaffId(staffId);
		paramStaff.setPassword(password);
		
		Staff loginStaff = staffMapper.login(paramStaff);
		
		if(loginStaff == null ) {// 로그인 실패
			model.addAttribute("msg", "로그인 실패 !");
			return "off/login"; // 포워딩 
		}
		session.setAttribute("loginStaff", loginStaff);
		
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
