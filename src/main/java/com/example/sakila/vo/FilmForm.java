package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm { // db 테이블의 도메인 객체에 맞춰야함. 

	private String title;
	private String description;			// null가능
	private Integer releaseYear;			// null가능
	private int languageId;				// FK
	private Integer originalLanguageId;	// FK
	private int rentalDuration;
	private double rentalRate;
	private Integer length;					// null가능
	private double replacementCost;
	private String rating;
	private List<String> specialFeatures; // null가능
	// String[]보다 편하게 사용하기 위해 List 사용.

	// 빌드패턴 : 특정한 객체에서 다른 객체로 변환하는 것. 
	// Service에서 바꿔도 되고 클래스에서 메서드를 만들어둬도 됨. lombok 안 @builder도 있음.
//	public Film changeFilm() {
//		Film f = new Film();
//		f.setTitle(title);
//		return f;
//	}
	
	
}
