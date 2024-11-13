package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmCategory;

@Mapper
public interface FilmCategoryMapper {
	
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	// 카테고리 삭제시 FilmCategory 삭제
	Integer deleteFilmCategoryByCategory(Integer categoryId);
	
	// on/filmOne 해당 필름의 카테고리 가져오기
	List<Map< String, Object>> selectFilmCategoryListByFilm(int filmId);
	
	// on/filmOne에서 category 추가하기 : /on/addFilmCategory
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	// on/filmOne에서 category 삭제하기 : /on/removeFilmCategory
	Integer deleteFilmCateogory(FilmCategory filmCategory);
	
	
	
}
