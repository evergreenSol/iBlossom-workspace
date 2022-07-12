package com.kh.iblossom.cart.model.vo;

import lombok.Data;

@Data
public class Cart {

	private int cartNo; // CART_NO NUMBER PRIMARY KEY,
	private int userNo; // USER_NO NUMBER NOT NULL,
	private int productNo; // PRODUCT_NO NUMBER NOT NULL,	
	private int productCount; // PRODUCT_COUNT NUMBER NOT NULL,
	private int productPrice; // PRODUCT_PRICE NUMBER NOT NULL,
	
	private String flowerName; 
	private String thumbnail; 
	
}
