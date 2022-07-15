package com.kh.iblossom.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.dao.OrderDao;
import com.kh.iblossom.order.model.vo.DetailOrder;
import com.kh.iblossom.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*----------------------------------------------------*/
	
	// 주문/결제 조회용	
	@Override
	public ArrayList<Order> detailOrder(int userNo) {

		return orderDao.detailOrder(sqlSession, userNo);
	}

	
	@Override
	public int selectOrderListCount() {

		return orderDao.selectOrderListCount(sqlSession);
	}

	
	@Override
	public ArrayList<Order> selectOrderList(PageInfo pi) {
		
		return orderDao.selectOrderList(sqlSession, pi);
	}


	@Override
	public int insertOrder(Order o) {
		
		return orderDao.insertOrder(sqlSession, o);
	}


	@Override
	public int insertDetailOrder(DetailOrder detailOrder) {
		return orderDao.insertDetailOrder(sqlSession, detailOrder);
	}

	@Override
	public Order selectOrder(String receiptId) {
		return orderDao.selectOrder(sqlSession, receiptId);
	}


	@Override
	public ArrayList<Order> selectMyOrderList(int userNo) {
		
		return orderDao.selectMyOrderList(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Order> selectMyOrderCancelList(int userNo) {
		
		return orderDao.selectMyOrderCancelList(sqlSession, userNo);
	}


	@Override
	public int cancelMyPay(String receiptId) {
		return orderDao.cancelMyPay(sqlSession, receiptId);
	}


	@Override
	public ArrayList<DetailOrder> selectMyDetailOrderList(int orderNo) {
		return orderDao.selectMyDetailOrderList(sqlSession, orderNo);
	}


	@Override
	public Order selectMyOneOrder(int orderNo) {
		return orderDao.selectMyOneOrder(sqlSession, orderNo);
	}


	@Override
	public int countReady(int userNo) {

		return orderDao.countReady(sqlSession, userNo);
	}


	@Override
	public int countShipping(int userNo) {
		
		return orderDao.countShipping(sqlSession, userNo);
	}


	@Override
	public int countComplete(int userNo) {

		return orderDao.countComplete(sqlSession, userNo);
	}


	@Override
	public ArrayList<Order> selectMyOrderAllList(int userNo) {

		return orderDao.selectMyOrderAllList(sqlSession, userNo);
	}
	
	


}
