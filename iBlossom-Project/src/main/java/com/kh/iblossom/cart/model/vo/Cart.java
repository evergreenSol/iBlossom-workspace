package com.kh.iblossom.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {

	private int cartNo; // CART_NO NUMBER PRIMARY KEY,
	private int userNo; // USER_NO NUMBER NOT NULL,
	private int productNo; // PRODUCT_NO NUMBER NOT NULL,	
	private int productCount; // PRODUCT_COUNT NUMBER NOT NULL,
	private int productPrice; // PRODUCT_PRICE NUMBER NOT NULL,
	
}
