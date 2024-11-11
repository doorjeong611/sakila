package com.example.sakila.controller;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class StoreController {
	
	@GetMapping("/on/storeList")
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
	
	
}
