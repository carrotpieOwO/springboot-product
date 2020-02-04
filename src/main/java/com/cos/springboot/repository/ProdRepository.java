package com.cos.springboot.repository;

import java.util.List;

import com.cos.springboot.model.Product;

public interface ProdRepository {

	List<Product> findAll();
	List<Product> findByType(String type);
	
	List<Product> orderByPrice(); 
	List<Product> orderByCount();
	
	List<Product> orderByPriceType(String type);
	List<Product> orderByCountType(String type);
	 
}
