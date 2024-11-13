package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Store;

@Service
@Transactional
public class StoreService {

	@Autowired StoreMapper storeMapper;
	
	// on/addStaff : addStaff.jsp에서 storeList 출력 후 선택
	public List<Map<String , Object>> getStoreList(){
		
		return storeMapper.selectStoreList();
	}
	
	// on/storeList : storeList.jsp에서 storeList 출력
	public List<Map<String , Object>> getStoreListByAll(){
		
		return storeMapper.selectStoreListByAll();
	}
	
}
