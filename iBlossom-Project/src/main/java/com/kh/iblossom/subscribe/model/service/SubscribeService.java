package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;
import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;


public interface SubscribeService {
	
	// 정기구독 상품 조회용 메소드
	ArrayList<SubProduct> selectList();

	// 정기구독 상품 추가용 메소드
	int insertSubProduct(SubProduct sp);

	// 정기구독 상품 삭제용 메소드
	int deleteSubProduct(int spno);

	SubProduct selectSubProduct(int spno);

	int updateSubProduct(SubProduct sp);
	
	ArrayList<Subscribe> selectMySubscribe(int userNo);
}
