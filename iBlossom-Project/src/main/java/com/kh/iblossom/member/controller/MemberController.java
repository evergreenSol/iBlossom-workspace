package com.kh.iblossom.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.Service.OnedayClassService;
import com.kh.iblossom.product.model.service.ProductService;
import com.kh.iblossom.qna.model.service.QnaService;
import com.kh.iblossom.subscribe.model.service.SubscribeService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OnedayClassService onedayclassService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	 private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 로그인
	@RequestMapping(value="loginForm.me")
	public String LoginForm() {
		
		return "common/login";
	}
	
	// 로그아웃
	@RequestMapping(value="logout.me")
	public String Logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 로그인
	@RequestMapping("login.me")
	public String login(Member m,
						HttpSession session) {
	
		// 암호화로 인해 아이디로 조회
		Member loginUser = memberService.login(m);
		
		System.out.println(loginUser.getUserPwd());
		System.out.println(m.getUserPwd());
		
		if(loginUser != null && bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			session.setAttribute("loginUser", loginUser);
			
			return "user/member/myPage_MainView";
		}
		else {
			session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
			return "redirect:login.me";
		}
		
	}
	
	// 회원가입 폼 이동 메소드
	@RequestMapping(value="enrollForm.me")
	public String EnrollMemberForm() {
		return "common/join";
	}
	
	
	// 회원가입 - 아이디 중복 체크 메소드
	@ResponseBody
	@RequestMapping(value="checkId.me")
	public void countUserId(String userId, HttpServletResponse response) throws IOException {
		
		int result = memberService.countUserId(userId);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}
	
	// 회원가입 메소드
	@RequestMapping(value="insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			
			return "common/login";
		}
		else {
			return "redirect:/";
		}
		
	}
	

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
	public String MyPageSubscribeView(HttpSession session, Model model) {
		
		/*
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Subscribe> list = subscribeService.selectMySubscribe(userNo);
		
		model.addAttribute("list", list);
		
		*/
		
		return "user/member/myPage_SubscribeView";
	}
	
	@RequestMapping(value="updateForm.me")
	public String MyPageUpdateForm() {
		
		return "user/member/myPage_UpdateForm";
	}
	
	@RequestMapping(value="deleteForm.me")
	public String MyPageDeleteForm(HttpSession session, String userPwd, Model model) {
		/*
		 * 
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		if(bCryptPasswordEncoder.matches(userPwd, encPwd)) {
		
			int result = memberService.deleteMember(userNo);
			
			if(result > 0) {
				// 탈퇴 성공
				session.removeAttribute("loginUser");
				
				return "redirect:/";
			}
			else {
				// 탈퇴 실패시 어떻게 해줄가?
			}
		}
		else {
			// 비번이 다름.
			// alert?
			return "redirect: deleteForm.me";
		}
		
		*/
		return "user/member/myPage_DeleteForm";
	}
	
	@RequestMapping(value="onedayClass.me")
	public String MyPageOneDayClass(HttpSession session, Model model) {
		
		/*
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<OnedayClass> list = onedayclassService.selectMyOnedayClass(userNo);
		
		model.addAttribute("list", list);
		
		*/
		
		return "user/member/myPage_OnedayClass";
	}
	
	@RequestMapping(value="reviewListView.me")
	public String MyPageReviewListView(HttpSession session, Model model) {
		
		/*
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Review> list = productService.selectMyReview(userNo);
		
		*/
		
		return "user/member/myPage_ReviewListView";
	}
	
	@RequestMapping(value="qnaListView.me")
	public String MyPageQnaListView(HttpSession session, Model model) {
		
		/*

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Qna> list = qnaService.selectMyQna(userNo);
		
		model.addAttribute("list", list);
		
		*/
		
		return "user/member/myPage_QnaListView";
	}
	
	
	
}
