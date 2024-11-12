package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {

	///on/removeFilm - selectCountInventoryByFilm: 특정 film의 재고가 존재하는지
	Integer selectCountInventoryByFilm(Integer filmId);
	
}
