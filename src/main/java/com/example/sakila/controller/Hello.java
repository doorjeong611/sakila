package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Hello {

		@GetMapping("/hello")
		public String hello() {
			// logging 프레임워크 사용.
			log.debug("ㅎㅎ");
			
			return "hello";
		}
	
}
