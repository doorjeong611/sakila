package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.vo.FilmCategory;

@Service
@Transactional
public class FilmCategoryService {
	
	@Autowired FilmCategoryMapper filmCategoryMapper;
	
	// on/filmOne 해당 필름의 카테고리 가져오기
	public List<Map< String, Object>> getFilmCategoryListByFilm(int filmId){
		
		return filmCategoryMapper.selectFilmCategoryListByFilm(filmId);
	}
	
	
	// on/filmOne에서 category 추가하기 : /on/addFilmCategory
	public Integer addFilmCategory(FilmCategory filmCategory) {
		
		return filmCategoryMapper.insertFilmCategory(filmCategory);
	}
	
	// on/filmOne에서 category 삭제하기 : /on/removeFilmCategory
	public Integer removeFilmCategory(FilmCategory filmCategory) {
		return filmCategoryMapper.deleteFilmCateogory(filmCategory);
	}
	
	
}
