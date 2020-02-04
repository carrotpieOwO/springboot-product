package com.cos.springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.springboot.model.Product;
import com.cos.springboot.repository.ProdRepository;

@Controller
public class ProdController {
	@Autowired
	private ProdRepository prodRepository;
	
	@GetMapping("/product")
	public String list(Model model) {
		List<Product> products = prodRepository.findAll();
		model.addAttribute("products",products);
		return "product/list";
	}
	
	@GetMapping("/product/list") 
	public @ResponseBody List<Product> all (Model model) {
		List<Product> products = prodRepository.findAll();
		model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/product/{type}") 
	public @ResponseBody List<Product> type (@PathVariable String type, Model model) {
		List<Product> products = prodRepository.findByType(type);
		model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/product/price/전체보기") 
	public @ResponseBody List<Product> price (Model model) {
		List<Product> products = prodRepository.orderByPrice();
		model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/product/price/{type}") 
	public @ResponseBody List<Product> priceType (@PathVariable String type, Model model) {
		List<Product> products = prodRepository.orderByPriceType(type);
		model.addAttribute("products",products);
		return products;
	}
	
	
	@GetMapping("/product/order/전체보기") 
	public @ResponseBody List<Product> order (Model model) {
		List<Product> products = prodRepository.orderByCount();
		model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/product/order/{type}") 
	public @ResponseBody List<Product> orderType (@PathVariable String type, Model model) {
		List<Product> products = prodRepository.orderByCountType(type);
		model.addAttribute("products",products);
		return products;
	}
	
	

}
