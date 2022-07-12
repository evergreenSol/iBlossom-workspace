package com.kh.iblossom.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.dao.OrderDao;
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
	public int insertOrder() {
		
		return orderDao.selectOrder(sqlSession);
	}


}
