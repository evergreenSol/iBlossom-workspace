package com.kh.iblossom.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.vo.Order;

@Repository
public class OrderDao {
	
	// 주문/결제 조회용
	public ArrayList<Order> detailOrder(SqlSessionTemplate sqlSession, int userNo) {

		 return (ArrayList)sqlSession.selectList("orderMapper.detailOrder", userNo); 
	}

	
	public int selectOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectOrderListCount");
	}

	
	// 페이징처리
	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList", null, rowBounds);
	}


	public int selectOrder(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}



}
