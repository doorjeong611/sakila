package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	
	// addStaff 지점 리스트
	List<Map<String, Object>>selectStoreList();
	
	// on/storeList : storeList 
	List<Map<String, Object>>selectStoreListByAll();
	
	
}
