package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.RentalMapper;
import com.example.sakila.vo.Rental;

@Service
public class RentalService {
	
	@Autowired RentalMapper rentalMapper;
	
	// on/addRental
	public Integer addRental(Rental rental) {
		return rentalMapper.insertRental(rental);
	}
	
	
}
