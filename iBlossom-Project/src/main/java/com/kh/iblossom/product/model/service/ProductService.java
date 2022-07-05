package com.kh.iblossom.product.model.service;

import java.util.ArrayList;

import com.kh.iblossom.product.model.vo.Review;

public interface ProductService {

	ArrayList<Review> selectMyReview(int userNo);
	
}
