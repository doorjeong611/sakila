package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Store;


@Slf4j
@Controller
public class StoreController {
	
	@Autowired StoreService storeService;
	
	@GetMapping("/on/storeList")
	public String getStoreList(Model model) {
		
		List<Map<String,Object>> storeList = storeService.getStoreListByAll(); 
		
		model.addAttribute("storeList", storeList);
		
		return "on/storeList";
	}
	
	
	
}
