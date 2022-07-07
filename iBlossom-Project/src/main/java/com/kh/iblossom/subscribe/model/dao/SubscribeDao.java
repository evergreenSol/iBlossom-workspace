package com.kh.iblossom.subscribe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDao {
	
	// 구독용 상품 리스트 조회
	public ArrayList<SubProduct> selectList(SqlSessionTemplate sqlSession) {
		
	
	  return (ArrayList)sqlSession.selectList("subscribeMapper.selectList"); 
	 }
	 
	// 구독용 상품 추가
	public int insertSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {

		return sqlSession.insert("subscribeMapper.insertSubProduct", sp);
	}

	// 구독용 상품 삭제
	public int deleteSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.delete("subscribeMapper.deleteSubProduct", spno);
		
	}

	// 구독용 상품 단일 조회
	public SubProduct selectSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.selectOne("subscribeMapper.selectSubProduct", spno);
	}

	// 구독용 상품 수정
	public int updateSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {
		
		return sqlSession.update("subscribeMapper.updateSubProduct", sp);
	}

	// 구독 추가
	public int insertSubscribe(SqlSessionTemplate sqlSession, Subscribe s) {
		 
		return sqlSession.insert("subscribeMapper.insertSubscribe", s);
	}
	
	// 마이페이지 구독조회
	public ArrayList<Subscribe> selectMySubscribe(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<Subscribe> list = new ArrayList<Subscribe>();
		
		return list;
	}
}
