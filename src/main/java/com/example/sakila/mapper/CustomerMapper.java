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
	
	
	// on/addRental : 고객 검색
	List<Map<String, Object>> selectCustomerListBySearchCustomer(String searchCustomer);
	
	// on/customerOne : 회원의 개인정보
	Map<String, Object> selectCustomerOneCustomerInfo(Integer customerId);
	
	// on/customerOne : 회원의 대여이력
	List<Map<String, Object>> selectCustomerOneCustomerRentalInfo(Map<String, Object> map);
	
	// on/customerOne : 회원의 대여이력 pagination을 위한 lastPage 구하기
	Integer selectRentalInfoTotal(Integer customerId);
	
	
	
	
	
}
