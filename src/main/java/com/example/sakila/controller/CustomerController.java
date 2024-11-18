package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.CustomerService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerController {
	
	@Autowired CustomerService customerService;
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	
	
	// /on/addCustomer
	@GetMapping("/on/addCustomer")
	public String addCustomer(@RequestParam(required = false) String searchAddress, Model model) {
		log.debug("[ Get - addCustomer ]");
		
		// storeList
		List<Map<String,Object>> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		// addressList <- 검색 searchAddress != null
		if(searchAddress != null &&  !searchAddress.equals("")) {
			List <Address> addressList = addressService.getAddressListByWord(searchAddress);
			model.addAttribute("addressList", addressList);
		}
		
		return "on/addCustomer";
	}
	
	// /on/addCustomer
	@PostMapping("/on/addCustomer")
	public String postMethodName(Customer customer) {
		log.debug("[ Post - addCustomer ]");
		
		// customer 추가
		Integer result = customerService.addCustomer(customer);
		log.debug("result :" + result);
		
		return "redirect:/on/customerList";
	}
	
	// /on/customerList
	@GetMapping("/on/customerList")
	public String customerList( @RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer rowPerPage,
								@RequestParam(required = false) String searchCustomer, Model model) {
		log.debug("[ Get - customerList ]");
		
		// customer list : address의 district 까지 출력하기 -> 나머지는 customerOne에서 출력
		Map<String, Object> customerList = customerService.getCustomerList(currentPage, rowPerPage, searchCustomer);
		log.debug("startPagingNum : "+customerList.get("startPagingNum"));
		log.debug("endPagingNum : "+customerList.get("endPagingNum"));
		
		Integer lastPage = customerService.getLastPage(rowPerPage);
		log.debug("currentPage : "+currentPage);
		log.debug("lastPage : "+lastPage);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPagingNum", customerList.get("startPagingNum"));
		model.addAttribute("endPagingNum", customerList.get("endPagingNum"));
		
		model.addAttribute("customerList", customerList.get("cList"));
		
		return "on/customerList";
	}
	
	
}
