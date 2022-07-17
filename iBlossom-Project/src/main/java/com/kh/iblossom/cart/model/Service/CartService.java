package com.kh.iblossom.cart.model.Service;

import java.util.ArrayList;

import com.kh.iblossom.cart.model.vo.Cart;

public interface CartService {
			
	// 장바구니 조회
	ArrayList<Cart> selectCart(int userNo);
	
	Cart selectOneCart(Cart c);
	
	
	/*--------------------------------------------------------*/
	// 상세페이지 -> cart 연결용
	
	// 장바구니 상품 추가용 메소드(승아)
	int insertCartList(Cart c);
	
	int deleteCart(int cartNo);
	
	int updateCart(Cart c);

}
