package com.kh.iblossom.order.model.service;

import java.util.ArrayList;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.vo.Order;

public interface OrderService {

	// 주문/결제 조회용
	ArrayList<Order> detailOrder(int userNo);
	
	
	// 리스트조회, 페이징처리
	int selectOrderListCount();

	
	// 주문내역 리스트 조회
	ArrayList<Order> selectOrderList(PageInfo pi);


	int insertOrder();


}
