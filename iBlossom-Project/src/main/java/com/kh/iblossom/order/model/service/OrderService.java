package com.kh.iblossom.order.model.service;

import java.util.ArrayList;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.order.model.vo.DetailOrder;
import com.kh.iblossom.order.model.vo.Order;

public interface OrderService {

	// 주문/결제 조회용
	ArrayList<Order> detailOrder(int userNo);
	
	
	// 리스트조회, 페이징처리
	int selectOrderListCount();

	
	// 주문내역 리스트 조회
	ArrayList<Order> selectOrderList(PageInfo pi);

	// 결제 후 주문 테이블
	int insertOrder(Order o);
	
	// 결제 후 주문 상세 테이블
	int insertDetailOrder(DetailOrder detailOrder);

	Order selectOrder(String receiptId);
	
	// 마이페이지 주문보기(취소 제외)
	ArrayList<Order> selectMyOrderList(int userNo);
	
	// 마이페이지 취소된 주문보기
	ArrayList<Order> selectMyOrderCancelList(int userNo);
	
	// 결제 취소용
	int cancelMyPay(String receiptId);

	// 마이페이지 주문상세보기
	ArrayList<DetailOrder> selectMyDetailOrderList(int orderNo);

	// 마이페이지 주문상세보기 - 주문한개
	Order selectMyOneOrder(int orderNo);
	
	// 마이페이지 메인용
	int countReady(int userNo);
	int countShipping(int userNo);
	int countComplete(int userNo);
	ArrayList<Order> selectMyOrderAllList(int userNo);
	
	int updateDeliveryStatus();
	
}
