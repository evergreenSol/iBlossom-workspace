package com.kh.iblossom.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.dao.ReviewDao;
import com.kh.iblossom.product.model.vo.Review;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

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
	public int updateReview(Review r) {
		System.out.println("Service:" + r.getReviewNo());
		return reviewDao.updateReview(sqlSession,r);
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

	@Override
	public ArrayList<Review> selectMyReview(int userNo) {

		return reviewDao.selectMyReview(sqlSession, userNo);
	}
	
	
	// 검색용 메소드
		@Override
		public int selectSearchCount(HashMap<String, String> map) {
			 
			return reviewDao.selectSearchCount(sqlSession, map);
		}

		// 리뷰 검색용 메소드
		@Override
		public ArrayList<Review> selectSearchList(PageInfo pi, HashMap<String, String> map) {

			return reviewDao.selectSearchList(sqlSession, pi, map);
		}
	
}
