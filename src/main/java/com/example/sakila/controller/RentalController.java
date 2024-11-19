package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.sakila.service.CustomerService;
import com.example.sakila.service.RentalService;
import com.example.sakila.util.TeamColor;
import com.example.sakila.vo.Rental;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@Slf4j
public class RentalController {
	
	@Autowired RentalService rentalService;
	@Autowired CustomerService customerService;
	
	// on/addRental
	@GetMapping("/on/addRental")
	public String addRental(Model model, @RequestParam Integer inventoryId, @RequestParam(required = false) String searchCustomer) {
		log.debug("[Get - addRental]");
		
		log.debug("inventoryId : " +inventoryId );
		
		if(searchCustomer != null && !searchCustomer.equals("") ) {
			log.debug( TeamColor.BLUE + "searchCustomer : " +searchCustomer + TeamColor.RESET );
			
			List<Map<String, Object>> customerList = customerService.getCustomerListBySearchCustomer(searchCustomer);
			
			log.debug(TeamColor.BLUE + "customerList. : " + customerList.toString()+TeamColor.RESET);
			
			model.addAttribute("customerList", customerList);
			
		}
		
		
		
		
		model.addAttribute("inventoryId", inventoryId);
		
		return "/on/addRental";
	}
	
	
	// on/addRental
	@PostMapping("/on/addRental")
	public String postMethodName(Rental rental, Model model, HttpSession session) {
		log.debug("[Post - addRental]");
		
		log.debug(TeamColor.BLUE + "rental : " +rental.toString() +TeamColor.RESET);
		
		Integer customerId = rental.getCustomerId();
		log.debug(TeamColor.BLUE + "customerId : " +customerId +TeamColor.RESET);
		
		Integer result = rentalService.addRental(rental);
		
		log.debug(TeamColor.BLUE + "result : " +result +TeamColor.RESET);
		
		return "redirect:/on/customerOne?customerId="+customerId;
	}
	
	
	
	
	
	
	
}
