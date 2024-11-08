package com.example.sakila;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component // 스프링이 알아서 new OnIntercept 이렇게 만들어 스프링 빈에 등록시킴. -> @Autowired를 통해 가져올 수 있음. 같은 원리로 작동 : @controller, @mapper 
public class OnInterceptor implements HandlerInterceptor{
	
	
	// 특정 컨트롤러 실행 전에 request, response를 가로챔. / postHandle =  컨트롤러가 실행된 후 request. response 가로챔.
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 가로챈 controller 요청 출력
		log.debug(request.getRequestURL().toString()+"요청 INTERCEPTOR");
		
		// 로그인 여부 확인 session.getAttribute("loginStaff");
		HttpSession session = request.getSession();
		if(session.getAttribute("loginStaff") == null) { // 로그아웃 상태라면
			
			response.sendRedirect(request.getContextPath() + "/off/login"); // /off/login.jsp => /off/** == 로그아웃 상태에 접근 가능한 컨트롤러
			return false; // return; -> 하면 안됨. why? 이 메서드는 리턴 타입이 boolean이기 때문에 return;으로 끝내면 void이니까.
			
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
		
}
