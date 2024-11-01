package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	
	private int filmId;				// PK
	private String title;
	private String description;
	private String releaseYear;
	private int languageId;			// FK
	private int originalLanguageId;	// FK
	private int rentalDuration;
	private double rentalRate;
	private int length;
	private double replacementCost;
	private String rating;
	private String lastUpdate;

}
