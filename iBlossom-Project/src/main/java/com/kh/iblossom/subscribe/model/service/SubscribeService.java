package com.kh.iblossom.subscribe.model.service;

import java.util.ArrayList;
import com.kh.iblossom.subscribe.model.vo.SubProduct;


public interface SubscribeService {
	
	ArrayList<SubProduct> selectList();

	int insertSubProduct(SubProduct sp);
}
