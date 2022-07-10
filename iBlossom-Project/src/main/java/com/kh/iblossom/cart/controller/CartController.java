package com.kh.iblossom.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.cart.model.Service.CartService;
import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;
import com.sun.mail.handlers.message_rfc822;

@Controller
public class CartController {	
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	// 장바구니  페이지 조회

	// - 장바구니 페이지 : 로그인한 상태에서 select 할 상품이 있을 경우
	// - 장바구니 빈 페이지 : 비로그인 상태 / select 할 상품이 없을 경우	 
	@RequestMapping("list.ca")
	public String selectCartList(Cart c, HttpSession session, Member m) {
		
		Member loginUser = memberService.login(m);
		
		ArrayList<Cart> list = cartService.selectCartList();
		
		if(list.isEmpty() && loginUser == null) { 
			
			// 빈 장바구니
			return "user/cart/cart_EmptyList";
		
		} else { 
			
			// 물건 있는 장바구니
			return "user/cart/cart_ListView"; // /WEB-INF/views/user/cart/cart_ListView.jsp
		}
	}
	
	
	// 빈 장바구니 조회
	@RequestMapping("empty.ca")
	public String emptyCartList() {
	
		// 장바구니 페이지만 띄워주는 용도
		return "user/cart/cart_EmptyList";
	}	
	
	
	/*
	// 장바구니 상품 조회
	@ResponseBody
	@RequestMapping("list.car")
	public String selectCartList(Model model) {
		
		ArrayList<Cart> list = cartService.selectCartList();
		
		model.addAttribute("list",list);
		
		return "user/cart/cart_ListView";
	}
	*/
	
	// 장바구니 상품 추가
	@RequestMapping("insert.ca")
	public String insertCartList(Cart c, HttpSession session, Model model) {
		
		System.out.println(c);
			
		// Service 단으로 cart 를 넘겨서 insert 요청
		int result = cartService.insertCartList(c);
		
		if(result > 0) { 
			
			// 성공시 ~~~ 페이지로 url 재요청
			// session.setAttribute("alertMsg", "성공적으로 장바구니가 추가되었습니다.");
			return "user/cart/cart_ListView";
			
		} else {
			
			return "redirect:/";
		}
	}
	

}
