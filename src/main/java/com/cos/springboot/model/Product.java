package com.cos.springboot.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Product {
	private int id;
	private String name;
	private int price;
	private int count;
	private String type;
	
	@Builder
	public Product(String name, int price, int count, String type) {
		super();
		this.name = name;
		this.price = price;
		this.count = count;
		this.type = type;
	}

}
