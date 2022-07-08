package com.kh.iblossom.product.model.service;

import java.util.ArrayList;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Product;

public interface ProductService {


	// 상품 리스트 조회 + 페이징 처리
	// 상품 총 개수 조회
	int selectListCount();
	// 상품 리스트 조회
	ArrayList<Product> selectList(PageInfo pi);

	// 상품 등록하기 서비스
	int insertProduct(Product p);
	
	//상품 상세 조회 서비스
	Product selectProduct(int productNo);
	
	//상품 삭제 서비스
	int deleteProduct(int productNo);
	
	// 상품 수정 서비스
	int updateProduct(Product p);
}
