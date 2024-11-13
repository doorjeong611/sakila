package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class InventoryController {
	
	@Autowired InventoryService inventoryService;
	
	@GetMapping("/on/inventoryList")
	public String getInventoryList(@RequestParam Integer storeId ,@RequestParam(defaultValue = "1") Integer currentPage 
									,@RequestParam(defaultValue = "10") Integer rowPerPage , Model model) {
		log.debug("[Get - getInventoryList]");
		log.debug("storeId : "+storeId);
		log.debug("currentPage : "+currentPage);
		log.debug("rowPerPage : "+rowPerPage);
		
		List<Map<String, Object>> inventoryList = inventoryService.getInventroyListByStore(storeId, currentPage, rowPerPage);
		
		// 페이지 : lastPage
		int lastPage = inventoryService.getTotalCountByInventoryList(storeId, rowPerPage);		
		
		log.debug("lastPage : "+lastPage);
		
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("storeId", storeId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
				
		return "on/inventoryList";
	}
	
	
	
	
}
