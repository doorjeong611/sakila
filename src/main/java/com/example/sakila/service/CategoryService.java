package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.vo.Category;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	public List<Category> getCategoryList(){
		return categoryMapper.selectCategoryList();
	}
	
}
