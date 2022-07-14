package com.kh.iblossom.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.vo.DetailOrder;
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

	public int insertOrder(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("orderMapper.insertOrder", o);
	}
	
	public int insertDetailOrder(SqlSessionTemplate sqlSession, DetailOrder detailOrder) {
		
		return sqlSession.insert("orderMapper.insertDetailOrder", detailOrder);
	}
	
	public Order selectOrder(SqlSessionTemplate sqlSession, String receiptId) {
		
		return sqlSession.selectOne("orderMapper.selectOrder", receiptId);
	}
	
	public ArrayList<Order> selectMyOrderList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectMyOrderList", userNo);
	}
	
	public ArrayList<Order> selectMyOrderCancelList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectMyOrderCancelList", userNo);
	}
	
	public int cancelMyPay(SqlSessionTemplate sqlSession, String receiptId) {
		return sqlSession.update("orderMapper.cancelMyPay", receiptId);
	}
	
	public ArrayList<DetailOrder> selectMyDetailOrderList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectMyDetailOrderList", userNo);
	}
	
	public Order selectMyOneOrder(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("orderMapper.selectMyOneOrder", orderNo);
	}


}
