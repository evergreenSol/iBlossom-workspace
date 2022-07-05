package com.kh.iblossom.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.product.model.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 꽃마켓 main
	@RequestMapping("productMarket.pr")
	public String productDetailView() {

		return "product/product_MarketView";
	}

	// 꽃상세조회
	@RequestMapping("productDetailList.pr")
	public String productDetailListView() {

		return "product/product_DetailView";
	}
	
	//상품관리 (리스트) -admin
	@RequestMapping("productList.pr")
	public String productListView() {

		return "product/product_ListView";
	}


	// 상품 관리(상품 등록) - admin
	@RequestMapping("productEnroll.pr")
	public String productEnrollForm() {

		return "product/product_EnrollForm";
	}
	
	// 상품관리(상품 수정) - admin
	@RequestMapping("productUpdate.pr")
	public String productUpdateForm() {

		return "product/product_UpdateForm";
	}
	
	
	
	// 리뷰 관리 -admin
	@RequestMapping("reviewList.pr")
	public String reviewListView() {

		return "product/review_ListView";
	}



}
