package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	ArrayList<Subscribe> selectMySubscribeThree(int userNo);
	ArrayList<Subscribe> selectMySubscribeSix(int userNo);
	ArrayList<Subscribe> selectMySubscribeTwelve(int userNo);
	ArrayList<Subscribe> selectMySubscribeRegular(int userNo);

	int selectListCount();
	
	ArrayList<Subscribe> selectSubMemberList(PageInfo pi);

	int selectSearchCount(HashMap<String, String> map);

	ArrayList<Subscribe> selectSearchList(PageInfo pi, HashMap<String, String> map);

}
