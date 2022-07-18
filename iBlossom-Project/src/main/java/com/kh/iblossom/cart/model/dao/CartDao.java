package com.kh.iblossom.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.cart.model.vo.Cart;

@Repository
public class CartDao {
	
	// 장바구니 조회용 메소드
	public ArrayList<Cart> selectCart(SqlSessionTemplate sqlSession, int userNo) {
		
		 return (ArrayList)sqlSession.selectList("cartMapper.selectCart", userNo); 
	}
	
	// 장바구니 상품 추가용 메소드
	public int insertCartList(SqlSessionTemplate sqlSession, Cart c) {

		 return sqlSession.insert("cartMapper.insertCartList", c);
	}

	public Cart selectOneCart(SqlSessionTemplate sqlSession, Cart c) {
		System.out.println("카트넘버 : "  + c);
		
		return sqlSession.selectOne("cartMapper.selectOneCart", c);
	}

	// 장바구니 삭제용 메소드
	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		
		return sqlSession.delete("cartMapper.deleteCart", cartNo);
	}
	
	public int updateCart(SqlSessionTemplate sqlSession, Cart c) {
		
		return sqlSession.update("cartMapper.updateCart", c);
	}
	
	/*
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList"); 
	}*/

}
