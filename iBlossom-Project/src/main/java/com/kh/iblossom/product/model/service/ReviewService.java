package com.kh.iblossom.product.model.service;

import java.util.ArrayList;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Review;

public interface ReviewService {


	// 리뷰 리스트 조회 + 페이징 처리
	// 리뷰 총 개수 조회
	int selectListCount();
	
	// 리뷰 리스트 조회
	ArrayList<Review> selectReviewList(PageInfo pi);
	
	// 리뷰 등록하기
	int insertReview(Review r);
	
	// 리뷰 수정 서비스
	int updateReivew(Review r);
	
	//리뷰 삭제 서비스
	int deleteReview(int reviewNo);
}