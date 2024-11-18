package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

@Service
@Transactional
public class CustomerService {
	
	@Autowired CustomerMapper customerMapper; 
	
	
	// /on/addCustomer
	public Integer addCustomer(Customer customer) {
		
		return customerMapper.insertCustomer(customer);
	}
	
	// on/customerList
	public Map<String, Object> getCustomerList(Integer currentPage, Integer rowPerPage, String searchCustomer){		
		
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchCustomer", searchCustomer);
		
		// 10개씩 페이지 보여주기
		Integer numPerPage = 10;
		// 페이징 첫번째 페이지 넘버
		Integer startPagingNum = ((currentPage - 1) / 10 * 10) + 1;
		// 페이징 마지막 페이지 넘버
		Integer endPagingNum = startPagingNum + (numPerPage-1); // 10개씩 출력하니까 startPagingNum + 9를 함
		// 마지막 페이지가 98이라면 98까지 출력해야함
		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		
		
		List<Map<String, Object>> cList = customerMapper.selectCustomerList(paramMap);
		
		Map<String, Object> customerList = new HashMap<>();
		
		customerList.put("cList", cList);
		customerList.put("startPagingNum", startPagingNum);
		customerList.put("endPagingNum", endPagingNum);
		
		return customerList;
	}
	
	// on/customerList -> 마지막 페이지
	public Integer getLastPage(Integer rowPerPage) {
	
		Integer totalCount = customerMapper.selectTotalCustomer(rowPerPage);
		
		Integer lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		return lastPage ;
	}
	
	
}
