package com.kh.iblossom.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Product;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

public interface ProductService {


	// 상품 리스트 조회 + 페이징 처리
	// 상품 총 개수 조회
	int selectListCount();
	// 상품 리스트 조회
	ArrayList<Product> selectList(PageInfo pi);

	// 상품 등록하기 서비스
	int insertProduct(Product p);
	
	//상품 상세 조회 서비스(admin)
	Product selectProduct(int productNo);
	
	//상품 삭제 서비스
	int deleteProduct(int productNo);
	
	// 상품 수정 서비스
	int updateProduct(Product p);
	
	//상품 마켓 전체조회(꽃다발)
	ArrayList<Product> selectflowerList();
	
	//상품 상세 조회서비스(꽃대/꽃병)
	Product selectListProduct(int productNo);
	
	//상품 상세 조회서비스(조합형)
	ArrayList<Product> selectDetailList();
	
	//상품 마켓 전체 조회(꽃병)
	ArrayList<Product> selectListBase();
	
	// 검색용 메소드
	int selectSearchCount(HashMap<String, String> map);
	
	// 구독 회원 검색용 메소드
	ArrayList<Product> selectSearchList(PageInfo pi, HashMap<String, String> map);
}
