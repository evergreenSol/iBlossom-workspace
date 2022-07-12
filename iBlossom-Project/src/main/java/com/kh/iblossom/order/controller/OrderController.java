package com.kh.iblossom.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.iblossom.cart.model.Service.CartService;
import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.order.model.service.OrderService;
import com.kh.iblossom.order.model.vo.Order;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	/*------------------------------------------------------------*/
	
	/*
	// 기존에 연결을 위해 쓴거 
	// 주문
	@RequestMapping("detailView.or")
	public String DetailOrderList() {
		return "user/order/order_DetailView";
		// /WEB-INF/views/user/order/order_DetailView.jsp
	}*/
	
	// 주문/결제 조회용
	@RequestMapping("detail.or")
	public String DetailOrder(HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Cart> list = cartService.selectCart(userNo);
			
		model.addAttribute("list", list);
		
		return "user/order/order_DetailView";
	}
	
	
	// 결제완료
	@RequestMapping("complete.or")
	public String orderComplete() {
		return "user/order/order_Complete";
	}
	
	
	// -------------------------------------------------------------------------------------
	
	// 관리자 영역
	
	// 관리자 - 전체주문내역
	@RequestMapping("adminList.or")
	public String orderListView() { 
		return "admin/order/orderListView"; 
	}
	
	
	// 관리자 - 개별주문내역
	@RequestMapping("adminDetail.or")
	public String orderDetailView() { 
		return "admin/order/orderDetailView"; 
	}
	
	
	// 관리자 페이지에서 쓰일 < 페이징 처리 >
	
	// 페이징처리를 위한 변수들 셋팅 => PageInfo 객체
	@RequestMapping("list.or") /**/
	public String selectOrderList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = orderService.selectOrderListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Order> list = orderService.selectOrderList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		// 전체주문내역 화면 포워딩
		return "admin/order/orderListView";
	}
	
}
