package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.InventoryMapper;

@Service
public class InventoryService {
	
	@Autowired InventoryMapper inventoryMapper;
	
	// on/removeFilm : 특정 film의 재고가 존재하는지 확인
	public Integer getCountInventoryByFilm(Integer filmId) {
		
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
	
}
