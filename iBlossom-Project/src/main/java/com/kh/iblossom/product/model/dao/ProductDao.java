package com.kh.iblossom.product.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.iblossom.product.model.vo.Review;

@Repository

public class ProductDao {
	
	public ArrayList<Review> selectMyReview(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<Review> list = new ArrayList<Review>();
		
		// return (ArrayList)sqlSession.selectList("reviewMapper.selectList", userNo);
		return list;
	}

}
