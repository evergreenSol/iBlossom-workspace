package com.kh.iblossom.cart.model.Service;

import java.util.ArrayList;

import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.cart.model.vo.CartCommand;

public interface CartService {
			
	// 장바구니 조회
	ArrayList<Cart> selectCart(int userNo);
	
	
	/*--------------------------------------------------------*/
	// 상세페이지 -> cart 연결용
	
	// 장바구니 상품 추가용 메소드(승아)
	int insertCartList(Cart c);

	// 장바구니(조합형) 추가용 메소드 (승아)
	int inserCommandCartList(CartCommand cartCommand);

}
