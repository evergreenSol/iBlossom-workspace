package com.kh.iblossom.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.cart.model.Service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	// 장바구니 
	@RequestMapping("mainView.car")
	public String mainView() {
	
		return "user/cart/cart_MainView"; // /WEB-INF/views/user/cart/cart_MainView.jsp
	}
}
