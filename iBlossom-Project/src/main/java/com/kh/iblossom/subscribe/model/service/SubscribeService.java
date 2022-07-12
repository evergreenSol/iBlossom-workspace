package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;


public interface SubscribeService {
	
	// 정기구독 상품 조회용 메소드
	ArrayList<SubProduct> selectSubProductList();

	// 정기구독 상품 추가용 메소드
	int insertSubProduct(SubProduct sp);

	// 정기구독 상품 삭제용 메소드
	int deleteSubProduct(int spno);

	SubProduct selectSubProduct(int spno);

	int updateSubProduct(SubProduct sp);

	int insertSubscribe(Subscribe s);
	

	// 마이페이지 구독 취소 메소드
	int cancelMySubList(String receiptId);
	
	int selectListCount();
	
	ArrayList<Subscribe> selectSubMemberList(PageInfo pi);

	int selectSearchCount(HashMap<String, String> map);

	ArrayList<Subscribe> selectSearchList(PageInfo pi, HashMap<String, String> map);

	// 배송상태 변경 메소드
	int updateDeliverStatus();
	

	// 마이페이지 구독 조회용 메소드
	ArrayList<Map<String,String>> selectMySubReceiptId(int userNo);
	
	ArrayList<Subscribe> selectMySubscribe(String receiptId);
	
}
