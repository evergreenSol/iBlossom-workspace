package com.kh.iblossom.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Review;

@Repository
public class ReviewDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("reviewMapper.selectListCount");
	}

	//리뷰 리스트 전체 조회
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;

		RowBounds rowBounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList",null,rowBounds);
	}

	//리뷰 등록하기
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {

		return sqlSession.insert("reviewMapper.insertReview",r);
	}

	// 리뷰 수정하기
	public int updateReivew(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("reviewMapper.updateReivew",r);
	}

	//리뷰 삭제하기
	public int deleteReivew(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.update("reviewMapper.deleteReview",reviewNo);
	}

	//리뷰 띄우기
	public ArrayList<Review> reviewSelectList(SqlSessionTemplate sqlSession,int productNo){

		System.out.println("DAO:" + (ArrayList)sqlSession.selectList("reviewMapper.reviewSelectList"));
		return (ArrayList)sqlSession.selectList("reviewMapper.reviewSelectList", productNo);
	}



	public Review selectReview(SqlSessionTemplate sqlSession, int reviewNo) {

		return sqlSession.selectOne("reviewMapper.selectReview", reviewNo);
	}
	
	public ArrayList<Review> selectMyReview(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList) sqlSession.selectList("reviewMapper.selectMyReview", userNo);
	}

}
