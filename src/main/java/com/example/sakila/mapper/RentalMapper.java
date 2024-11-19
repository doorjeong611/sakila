package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Rental;

@Mapper
public interface RentalMapper {

	// on/addRental
	Integer insertRental(Rental rental);
	
	
}
