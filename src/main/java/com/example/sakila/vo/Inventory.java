package com.example.sakila.vo;

import lombok.Data;

@Data
public class Inventory {
	
	private int inventoryId;
	private int filmId;
	private int storeId;
	private String lastUpdate;

	
	
}
