package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.subscribe.model.dao.SubscribeDao;
import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDao subscribeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 정기구독 상품 조회용 메소드
	@Override
	public ArrayList<SubProduct> selectList() {

		return subscribeDao.selectList(sqlSession);
	}

	// 정기구독 상품 추가용 메소드
	@Override
	public int insertSubProduct(SubProduct sp) {
		
		return subscribeDao.insertSubProduct(sqlSession, sp);
	}

	// 정기구독 상품 삭제용 메소드
	@Override
	public int deleteSubProduct(int spno) {
		
		return subscribeDao.deleteSubProduct(sqlSession, spno);
	}

	@Override
	public SubProduct selectSubProduct(int spno) {
		
		return subscribeDao.selectSubProduct(sqlSession, spno);
	}

	@Override
	public int updateSubProduct(SubProduct sp) {

		return subscribeDao.updateSubProduct(sqlSession, sp);
	}

	@Override
	public int insertSubscribe(Subscribe s) {
		
		return subscribeDao.insertSubscribe(sqlSession, s);
	}
	
	
	// 마이페이지 구독 조회 메소드
	@Override
	public ArrayList<Subscribe> selectMySubscribe(int userNo) {
		return subscribeDao.selectMySubscribe(sqlSession, userNo);
	}

}
