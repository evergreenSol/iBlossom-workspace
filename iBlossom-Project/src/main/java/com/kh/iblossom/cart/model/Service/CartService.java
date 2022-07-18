package com.kh.iblossom.cart.model.Service;

import java.util.ArrayList;

import com.kh.iblossom.cart.model.vo.Cart;

public interface CartService {
			
	// 장바구니 조회용 메소드
	ArrayList<Cart> selectCart(int userNo);
	
	Cart selectOneCart(Cart c);

	// 장바구니 상품 추가용 메소드(승아)
	int insertCartList(Cart c);
	
	// 장바구니 삭제용 메소드
	int deleteCart(int cartNo);
	
	int updateCart(Cart c);

}
