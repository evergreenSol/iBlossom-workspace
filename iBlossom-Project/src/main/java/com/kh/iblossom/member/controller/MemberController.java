package com.kh.iblossom.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	// 마이페이지 호출 및 응답
	@RequestMapping(value="mypage.me")
	public String MyPageMainView() {
		
		return "user/member/myPage_MainView";
	}
	
	@RequestMapping(value="orderListView.me")
	public String MyPageOrderListView() {
		
		
		// DB에서 주문내역을 ArrayList로 받아오기. 
		
		return "user/member/myPage_OrderListView";
		
	}
	
	@RequestMapping(value="orderDetailView.me")
	public String MyPageOrderDetailView() {
		
		// 매개변수로 주문 번호 가져오기
		// DB에서 해당 주문의 상세내역을 ArrayList로 받아오기
		
		return "user/member/myPage_OrderDetailView";
	}
	
	@RequestMapping(value="subscribeView.me")
	public String MyPageSubscribeView() {
		
		return "user/member/myPage_SubscribeView";
	}
	
	@RequestMapping(value="updateForm.me")
	public String MyPageUpdateForm() {
		
		return "user/member/myPage_UpdateForm";
	}
	
	@RequestMapping(value="deleteForm.me")
	public String MyPageDeleteForm() {
		
		return "user/member/myPage_DeleteForm";
	}
	
	@RequestMapping(value="oneDayClass.me")
	public String MyPageOneDayClass() {
		
		return "user/member/myPage_OneDayClass";
	}
	
	@RequestMapping(value="reviewListView.me")
	public String MyPageReviewListView() {
		
		return "user/member/myPage_ReviewListView";
	}
	
	@RequestMapping(value="qnaListView.me")
	public String MyPageQnaListView() {
		return "user/member/myPage_QnaListView";
	}
	
}
