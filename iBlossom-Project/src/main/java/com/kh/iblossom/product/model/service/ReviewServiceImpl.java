package com.kh.iblossom.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.dao.ReviewDao;
import com.kh.iblossom.product.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	   @Autowired
	   private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
	
		return reviewDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		return reviewDao.selectReviewList(sqlSession,pi);
	}

	//리뷰 등록하기
	@Override
	public int insertReview(Review r) {
		
		return reviewDao.insertReview(sqlSession,r);
	}

	//리뷰 수정하기
	@Override
	public int updateReivew(Review r) {
		return reviewDao.updateReivew(sqlSession,r);
	}

	//리뷰 삭제하기
	@Override
	public int deleteReview(int reviewNo) {
		
		return reviewDao.deleteReivew(sqlSession,reviewNo);
	}

	@Override
	public ArrayList<Review> reviewSelectList(int productNo) {
		return reviewDao.reviewSelectList(sqlSession, productNo);
	}

	@Override
	public Review selectReview(int reviewNo) {
		
		return reviewDao.selectReview(sqlSession, reviewNo);
	}
	
}
