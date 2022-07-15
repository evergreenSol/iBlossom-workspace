package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
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
	public ArrayList<SubProduct> selectSubProductList() {

		return subscribeDao.selectSubProductList(sqlSession);
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

	// 정기구독 상품 조회용 메소드
	@Override
	public SubProduct selectSubProduct(int spno) {
		
		return subscribeDao.selectSubProduct(sqlSession, spno);
	}

	// 정기구독 상품 수정용 메소드
	@Override
	public int updateSubProduct(SubProduct sp) {

		return subscribeDao.updateSubProduct(sqlSession, sp);
	}

	// 정기구독 상품 추가용 메소드
	@Override
	public int insertSubscribe(Subscribe s) {
		
		return subscribeDao.insertSubscribe(sqlSession, s);
	}
	
	// count용 메소드
	@Override
	public int selectListCount() {
		
		return subscribeDao.selectListCount(sqlSession);
	}

	// 구독 회원 조회용 메소드
	@Override
	public ArrayList<Subscribe> selectSubMemberList(PageInfo pi) {
		
		return subscribeDao.selectSubMembertList(sqlSession, pi);
	}

	// 검색용 메소드
	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		 
		return subscribeDao.selectSearchCount(sqlSession, map);
	}

	// 구독회원 검색용 메소드
	@Override
	public ArrayList<Subscribe> selectSearchList(PageInfo pi, HashMap<String, String> map) {

		return subscribeDao.selectSearchList(sqlSession, pi, map);
	}


	// 마이페이지 구독 취소 메소드
	@Override
	public int cancelMySubList(String receiptId) {
		return  subscribeDao.cancelMySubList(sqlSession, receiptId);
	}

	// 배송상태 변경 메소드
	@Override
	public int updateDeliverStatus() {
		
		return subscribeDao.updateDeliverStatus(sqlSession);
	}
	
	// 마이페이지 구독 조회 메소드
	@Override
	public ArrayList<Map<String,String>> selectMySubReceiptId(int userNo) {
		return subscribeDao.selectMySubReceiptId(sqlSession, userNo);
	}

	@Override
	public ArrayList<Subscribe> selectMySubscribe(String receiptId) {
		return subscribeDao.selectMySubscribe(sqlSession, receiptId);
	}
}
