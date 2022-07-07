package com.kh.iblossom.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.order.model.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	// 주문
	@RequestMapping("detailView.or")
	public String DetailOrderList() {

		return "user/order/order_DetailView"; // /WEB-INF/views/user/order/order_Complete.jsp
	}
	
	// 결제완료
	@RequestMapping("complete.or")
	public String orderComplete() {
		
		// 단순히 결제완료 폼을 띄워주는 역할
		return "user/order/order_Complete"; // /WEB-INF/views/user/order/order_Complete.jsp
	}
	
}
