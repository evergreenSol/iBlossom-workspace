package com.kh.iblossom.cart.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.cart.model.dao.CartDao;
import com.kh.iblossom.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;	
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 장바구니 조회용
	@Override
	public ArrayList<Cart> selectCart(int userNo) {

		return cartDao.selectCart(sqlSession, userNo);
	}
	


	
	/*--------------------------------------------------------*/
	// 상세페이지 -> cart 연결용
	
	// 장바구니 상품 추가용 메소드(승아)
	@Override
	public int insertCartList(Cart c) {

		return cartDao.insertCartList(sqlSession, c);
	}




	@Override
	public Cart selectOneCart(Cart c) {
		
		System.out.println(c);
		return cartDao.selectOneCart(sqlSession, c);
	}



	/*@Override
	public ArrayList<Cart> selectCartList() {

		return cartDao.selectCartList(sqlSession);
	}
	*/
	
	

	
}
