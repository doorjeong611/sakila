package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 자바의 모든 프로그램은 Main부터 시작. => 이 클래스가 프로그램 중 가장 먼저 실행. => intercept 실행예정.(실행을 위해 맵핑해야함.)
@SpringBootApplication // 가장 먼저 실행하기 위한 어노테이션
public class SakilaApplication implements WebMvcConfigurer{ // intercept를 실행하기 위해 implements WebMvcConfigurer 구현

	@Autowired
	private OnInterceptor onInterceptor;
	
	@Autowired
	private OffInterceptor offInterceptor;
	
	
	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}	
	
	// 인터셉터 설정 (1. 인터셉터 클래스 구현 , 2. 인터셉터 맵핑)
	@Override
	public void addInterceptors(InterceptorRegistry registry) { // InterceptorRegistry registry == Interceptor mapping List + 맵핑 가능
	
		// /on/**으로 시작하는 컨트롤러를 가로채어 OnInterceptor.prehandle(request, response) 실행
		registry.addInterceptor(onInterceptor).addPathPatterns("/on/**"); // /on/** == 로그인상태로만 접속 가능한 controller
		registry.addInterceptor(offInterceptor).addPathPatterns("/off/**");// /off/** == 로그인상태로만 접속 가능한 controller
				
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	

}
