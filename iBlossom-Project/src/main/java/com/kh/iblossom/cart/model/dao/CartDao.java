package com.kh.iblossom.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.cart.model.vo.Cart;

@Repository
public class CartDao {
	
	// 상품이 담겨져있는 장바구니 조회용
	public ArrayList<Cart> selectCart(SqlSessionTemplate sqlSession, int userNo) {
		
		 return (ArrayList)sqlSession.selectList("cartMapper.selectCart", userNo); 
	}
	

	
	/*--------------------------------------------------------*/
	// 상세페이지 -> cart 연결용
	
	// 장바구니 상품 추가용 메소드
	public int insertCartList(SqlSessionTemplate sqlSession, Cart c) {

		 return sqlSession.insert("cartMapper.insertCartList", c);
	}
	
	
	
	public Cart selectOneCart(SqlSessionTemplate sqlSession, Cart c) {
		System.out.println("카트넘버 : "  + c);
		
		return sqlSession.selectOne("cartMapper.selectOneCart", c);
	}

	
	// DB 다 넣은 뒤 카트 삭제용 메소드
	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		
		return sqlSession.delete("cartMapper.deleteCart", cartNo);
	}
	
	
	/*
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList"); 
	}*/

}
