package com.example.sakila;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OffInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		if(session.getAttribute("loginStaff") != null) { // 로그인 상태라면
			
			response.sendRedirect(request.getContextPath() + "/on/main"); // /on/login.jsp => /on/** == 로그인 상태에 접근 가능한 컨트롤러
			return false; // return; -> 하면 안됨. why? 이 메서드는 리턴 타입이 boolean이기 때문에 return;으로 끝내면 void이니까.
			
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	
	
	
	
}
