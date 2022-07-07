package com.kh.iblossom.subscribe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDao {
	
	// �젙湲곌뎄�룆 �긽�뭹 議고쉶�슜 硫붿냼�뱶
	public ArrayList<SubProduct> selectList(SqlSessionTemplate sqlSession) {
		
	
	  return (ArrayList)sqlSession.selectList("subscribeMapper.selectList"); 
	 }
	 
	// �젙湲곌뎄�룆 �긽�뭹 異붽��슜 硫붿냼�뱶
	public int insertSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {

		return sqlSession.insert("subscribeMapper.insertSubProduct", sp);
	}

	// �젙湲곌뎄�룆 �긽�뭹 �궘�젣�슜 硫붿냼�뱶
	public int deleteSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.delete("subscribeMapper.deleteSubProduct", spno);
		
	}

	public SubProduct insertSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.selectOne("subscribeMapper.selectSubProduct", spno);
	}

	public int updateSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {
		
		return sqlSession.update("subscribeMapper.updateSubProduct", sp);
	}

	public int insertSubscribe(SqlSessionTemplate sqlSession, Subscribe s) {
		 
		return sqlSession.insert("subscribeMapper.insertSubscribe", s);
	}
	
	// 마이페이지 구독조회
	public ArrayList<Subscribe> selectMySubscribe(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<Subscribe> list = new ArrayList<Subscribe>();
		
//		return (ArrayList)sqlSession.selectList("subscribeMapper.selectMySubscribe", userNo);
		return list;
	}
}
