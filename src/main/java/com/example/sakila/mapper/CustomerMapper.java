package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	// /on/addCustomer
	Integer insertCustomer(Customer customer);
	
	// on/customerList
	List<Map<String, Object>> selectCustomerList(Map<String, Object> paramMap);
	
	// on/customerList : 마지막 페이지
	Integer selectTotalCustomer(Integer rowPerPage);
	
}
