package com.kh.iblossom.product.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.product.model.dao.ProductDao;
import com.kh.iblossom.product.model.vo.Review;

import org.springframework.stereotype.Service;


@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Review> selectMyReview(int userNo) {
		
		return productDao.selectMyReview(sqlSession, userNo);
	}
	
	

}
