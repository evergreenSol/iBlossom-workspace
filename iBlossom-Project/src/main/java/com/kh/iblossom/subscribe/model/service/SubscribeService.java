package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;

import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;


public interface SubscribeService {
	
	ArrayList<SubProduct> selectList();

	int insertSubProduct(SubProduct sp);
	
	ArrayList<Subscribe> selectMySubscribe(int userNo);
}
