package com.kh.iblossom.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.cart.model.vo.Cart;

@Repository
public class CartDao {
	
	// 장바구니 상품 조회용 메소드
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession) {
		
		 return (ArrayList)sqlSession.selectList("cartMapper.selectCartList"); 
	}
	
	// 장바구니 상품 추가용 메소드
	public int insertCartList(SqlSessionTemplate sqlSession, Cart c) {

		 return sqlSession.insert("cartMapper.insertCartList", c);
	}
	
}
