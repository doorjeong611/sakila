package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class InventoryController {
	
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmService;
	
	// on/inventoryList
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
	
	
	// on/addInventroy
	@GetMapping("/on/addInventory")
	public String addInventory(@RequestParam Integer storeId, @RequestParam(required = false) String searchTitle, Model model) {
		log.debug("[Get - addInventory]");
		
		log.debug("storeId : "+storeId);
		
		// addInventory : button으로 filmList 요청
		if(searchTitle != null && !searchTitle.equals("")) {
			log.debug("searchTitle : "+searchTitle);
			
			// 영화 검색 목록 모델에 추가.(filmMapper : selectFilmListByTitle - 이미 존재)
			List<Film> filmList = filmService.getFilmListByTitle(searchTitle);
			
			model.addAttribute("filmList",filmList);
			model.addAttribute("searchTitle",searchTitle);
			
		}
		
		model.addAttribute("storeId",storeId);
		
		return "on/addInventory";
	}
	
	// on/addInventroy
	@PostMapping("/on/addInventory")
	public String addInventory(Inventory inventory) {
		log.debug("[Post - addInventory]");
		
		log.debug("storeId" + inventory.getStoreId());
		log.debug("filmId" + inventory.getFilmId());
		
		Integer storeId = inventory.getStoreId();
		
		// insert
		inventoryService.addInventory(inventory);
		
		return "redirect:/on/inventoryList?storeId="+storeId;
	}
	
	// /on/removeInventoryByKey
	@GetMapping("/on/removeInventoryByKey")
	public String removeInventoryByKey(Inventory inventory ) {
		log.debug("[Get - removeInventoryByKey]");
		log.debug("storeId : "+inventory.getStoreId());
		
		Integer inventoryId = inventory.getInventoryId();
		Integer storeId = inventory.getStoreId();
		
		inventoryService.removeInventoryByKey(inventoryId);
		
		return "redirect:/on/inventoryList?storeId="+storeId;

	}
	
	
}
