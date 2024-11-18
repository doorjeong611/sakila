package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {

	///on/removeFilm - selectCountInventoryByFilm: 특정 film의 재고가 존재하는지
	Integer selectCountInventoryByFilm(Integer filmId);
	
	// /on/inventoryList
	List<Map<String, Object>> selectInventroyListByStore(Map<String, Object> paramMap);
	
	// on/inventoryList : page
	Integer selectTotalCountByInventoryList(Integer storeId);
	
	// on/addInventroy
	Integer insertInventory(Inventory inventory);
	
	// on/removeInventoryByKey
	Integer deleteInventoryByKey(int inventoryId);
	
	
}
