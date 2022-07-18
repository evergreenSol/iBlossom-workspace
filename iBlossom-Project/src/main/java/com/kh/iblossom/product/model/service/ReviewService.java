package com.kh.iblossom.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Review;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

public interface ReviewService {


	// 리뷰 리스트 조회 + 페이징 처리
	// 리뷰 총 개수 조회
	int selectListCount();
	
	// 리뷰 리스트 조회
	ArrayList<Review> selectReviewList(PageInfo pi);
	
	// 리뷰 등록하기
	int insertReview(Review r);
	
	// 리뷰 수정 서비스
	int updateReview(Review r);
	
	//리뷰 삭제 서비스
	int deleteReview(int reviewNo);
	
	//리뷰 jsp 띄우기
	ArrayList<Review> reviewSelectList(int productNo);
	
	// 게시글 상세 조회
	Review selectReview(int ReviewNo);
	
	ArrayList<Review> selectMyReview(int userNo);
	
	// 검색용 메소드
	int selectSearchCount(HashMap<String, String> map);

	// 리뷰 검색용 메소드
	ArrayList<Review> selectSearchList(PageInfo pi, HashMap<String, String> map);
	
	
}
