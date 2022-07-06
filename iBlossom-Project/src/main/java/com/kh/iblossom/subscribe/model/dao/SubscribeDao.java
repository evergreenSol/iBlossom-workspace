package com.kh.iblossom.subscribe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.subscribe.model.vo.SubProduct;

@Repository
public class SubscribeDao {
	
	// 정기구독 상품 조회용 메소드
	public ArrayList<SubProduct> selectList(SqlSessionTemplate sqlSession) {
		
	
	  return (ArrayList)sqlSession.selectList("subscribeMapper.selectList"); 
	 }
	 
	// 정기구독 상품 추가용 메소드
	public int insertSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {

		return sqlSession.insert("subscribeMapper.insertSubProduct", sp);
	}

	// 정기구독 상품 삭제용 메소드
	public int deleteSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.delete("subscribeMapper.deleteSubProduct", spno);
		
	}

	public SubProduct insertSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.selectOne("subscribeMapper.selectSubProduct", spno);
	}

	public int updateSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {
		
		return sqlSession.update("subscribeMapper.updateSubProduct", sp);
	}
}
