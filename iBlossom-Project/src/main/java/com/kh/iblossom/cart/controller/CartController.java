package com.kh.iblossom.cart.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.cart.model.Service.CartService;
import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.cart.model.vo.CartCommand;
import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;

@Controller
public class CartController {	
	
	/* @Responsebody 어노테이션을 사용하면 http요청 body를 자바 객체로 전달받을 수 있다. */
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;

	
	// 장바구니 조회용
	@RequestMapping("list.ca")
	public String selectCart(HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Cart> list = cartService.selectCart(userNo);
		
		if(list.isEmpty()) {
			
			return "user/cart/cart_EmptyList";
		}
		else {
			
			model.addAttribute("list", list);
			return "user/cart/cart_ListView";
		}
		
		// 로그인한 유저의 list 가 있을 경우와 없을 경우 로직
	}
	
	/*--------------------------------------------------------*/
	// 상세페이지 -> cart 연결용
	
	// 장바구니 상품 추가
	@RequestMapping("insert.ca")
	public String insertCartList(Cart c, HttpSession session, Model model) {
		
		
		  
		 // System.out.println(c);
		
		  
		int result = cartService.insertCartList(c);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 장바구니가 추가되었습니다.");
			return "redirect:list.ca";
			
		} else {
			return "common/login";
		}
	}


	// 조합형 장바구니
	@RequestMapping("insertCo.ca")
	public String inserCommandCartList(CartCommand cartCommand, HttpSession session, Model model) {

		ArrayList<Cart> list = (ArrayList<Cart>)cartCommand.getCartList();
		
		System.out.println(list);
		
		for(int i = 0; i < list.size(); i++) {
			
			Cart c = list.get(i);
			
			cartService.insertCartList(c);
			
		}
		
		return "redirect:list.ca";
		
	}
/*
	// 빈 장바구니 조회
	@RequestMapping("empty.ca")
	public String emptyCartList() {

	
	@RequestMapping("test.ca")
	public String test() {
		
		return "user/cart/cart_ListView";*/
	
	/*--------------------------------------------------------*/


	/*
	@RequestMapping("listView.ca")
	public String selectCartList(int cartNo, int subLevel, String deliverAt, Model model) {
		
		cart c = cartService.selectCart(cartNo);
		
		model.addAttribute("c",c);
		
		model.addAttribute("deliverAt",deliverAt); 
		model.addAttribute("subLevel",subLevel);
		model.addAttribute("deliverFee", 200); 
	
		// 장바구니 페이지만 띄워주는 용도
		return "user/cart/cart_ListView";
	}*/
	
	/*
	// 상품이 담겨져있는 장바구니 조회용
	@RequestMapping("listView.ca")
	public String selectCartList(Model model) {
		
		ArrayList<Cart> list = cartService.selectCartList();
		
		model.addAttribute("list",list);
		
		return "user/cart/cart_ListView";
	}*/	
		
	/*
	@RequestMapping("list.ca")
	public String selectCart(HttpSession session, Model model, Member m) {
	Member loginUser = memberService.login(m);
	
	ArrayList<Cart> list = cartService.selectCart();
 
	if(list.isEmpty() && loginUser == null) { 
		// 장바구니 빈 페이지 : 비로그인 상태 / select 할 상품이 없을 경우
		return "user/cart/cart_EmptyList";
	
	} else { 
		// 장바구니 페이지 : 로그인한 상태에서 select 할 상품이 있을 경우
		return "user/cart/cart_ListView"; 
		// /WEB-INF/views/user/cart/cart_ListView.jsp
	}
	}*/
		
	}

