package com.kh.iblossom.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.vo.DetailOrder;
import com.kh.iblossom.order.model.vo.Order;
import com.kh.iblossom.product.model.vo.Review;

@Repository
public class OrderDao {
	
	// 주문/결제 조회용
	public ArrayList<Order> detailOrder(SqlSessionTemplate sqlSession, int userNo) {
		
		 return (ArrayList)sqlSession.selectList("orderMapper.detailOrder", userNo); 
	}

	
	public int selectOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectOrderListCount");
	}

	
	// *이슈) 페이징처리 (메소드이름은 관리자 - 전체주문내역 )
	public ArrayList<Order> adminSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	      
		int limit = pi.getBoardLimit();
	    int offset = (pi.getCurrentPage() - 1) * limit;

	    RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("orderMapper.adminSelectList", null, rowBounds);
	}
	
	// 관리자 - 전체주문내역 조회용 메소드
	/*
	public ArrayList<Order> adminSelectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.adminSelectList");
	}
	*/

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
	
	public int countReady(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("orderMapper.countReady", userNo);
	}
	
	public int countShipping(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("orderMapper.countShipping", userNo);
	}
	
	public int countComplete(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("orderMapper.countComplete", userNo);
	}
	
	public ArrayList<Order> selectMyOrderAllList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectMyOrderAllList", userNo);
	}
	
	public int updateDeliveryStatus(SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("orderMapper.updateDeliveryStatus", null);
	}

	//승아
	//리뷰
	public ArrayList<Order>selectOrderReview(SqlSessionTemplate sqlSession, Review r){
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderReview",r);
	}

	// 관리자 - 개별주문내역 조회용 메소드 (상세보기)
	public ArrayList<DetailOrder> adminSelectDetail(SqlSessionTemplate sqlSession, int orderNo) {

		return (ArrayList)sqlSession.selectList("orderMapper.adminSelectDetail", orderNo);
	}

	// 관리자 - 개별주문내역 조회용 메소드 (주문한개)
	public Order selectOneOrder(SqlSessionTemplate sqlSession, int orderNo) {

		return sqlSession.selectOne("orderMapper.selectOneOrder", orderNo);
	}

}
