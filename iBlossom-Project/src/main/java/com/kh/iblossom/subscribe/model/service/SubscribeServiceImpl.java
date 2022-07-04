package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.subscribe.model.dao.SubscribeDao;
import com.kh.iblossom.subscribe.model.vo.SubProduct;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDao subscribeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<SubProduct> selectList() {

		return subscribeDao.selectList(sqlSession);
	}

	@Override
	public int insertSubProduct(SubProduct sp) {
		
		return subscribeDao.insertSubProduct(sqlSession, sp);
	}

}
