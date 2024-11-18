package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

@Service
public class InventoryService {
	
	@Autowired InventoryMapper inventoryMapper;
	
	// on/removeFilm : 특정 film의 재고가 존재하는지 확인
	public Integer getCountInventoryByFilm(Integer filmId) {
		
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
	
	// /on/inventoryList : inventoryList
	public List<Map<String, Object>> getInventroyListByStore(Integer storeId, Integer currentPage, Integer rowPerPage){
		
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return inventoryMapper.selectInventroyListByStore(paramMap);
		
	}
	
	// /on/inventoryList : page
	public Integer getTotalCountByInventoryList(Integer storeId, Integer rowPerPage) {
		
		int totalCount = inventoryMapper.selectTotalCountByInventoryList(storeId);
		
		int lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}

		return lastPage;
	}
	
	
	// on/addInventroy
	public Integer addInventory(Inventory inventory) {
		
		return inventoryMapper.insertInventory(inventory);
		
	}
	
	// on/removeInventoryByKey 
	public Integer removeInventoryByKey(int inventoryId) {
		return inventoryMapper.deleteInventoryByKey(inventoryId);
	}
	
}
