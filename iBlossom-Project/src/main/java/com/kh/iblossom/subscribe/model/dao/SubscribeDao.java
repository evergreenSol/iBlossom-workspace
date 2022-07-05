package com.kh.iblossom.subscribe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDao {

	public ArrayList<SubProduct> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("subscribeMapper.selectList");
	}

	public int insertSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {

		return sqlSession.insert("subscribeMapper.insertSubProduct", sp);
	}
	
	public ArrayList<Subscribe> selectMySubscribe(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<Subscribe> list = new ArrayList<Subscribe>();
		
//		return (ArrayList)sqlSession.selectList("subscribeMapper.selectMySubscribe", userNo);
		return list;
	}
}
