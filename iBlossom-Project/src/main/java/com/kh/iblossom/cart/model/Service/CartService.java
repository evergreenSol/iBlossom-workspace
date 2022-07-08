package com.kh.iblossom.cart.model.Service;

import java.util.ArrayList;

import com.kh.iblossom.cart.model.vo.Cart;

public interface CartService {
			
	// 장바구니 리스트 조회용 메소드
	ArrayList<Cart> selectCartList();
	
	// 장바구니 상품 추가용 메소드
	int insertCartList(Cart c);

}
