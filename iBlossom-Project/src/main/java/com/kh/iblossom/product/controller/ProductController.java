package com.kh.iblossom.product.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ProductController {
	
	@RequestMapping("")
	public String subscribeListView() {

		return "product/flowerMarketListView.jsp";
	}


}
