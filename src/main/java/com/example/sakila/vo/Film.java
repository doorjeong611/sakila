package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	
	private int filmId;				// PK
	private String title;
	private String description;		// null
	private Integer releaseYear;	// null
	private Integer languageId;			// FK
	private Integer originalLanguageId;	// FK
	private Integer rentalDuration;
	private Double rentalRate;
	private Integer length;				// 기본값 : null int의 기본값은 0이기 때문에 Integer로 받음(null)받기 위해
	private Double replacementCost;
	private String rating;
	private String specialFeatures;	// 기본값 : null
	private String lastUpdate;

}
