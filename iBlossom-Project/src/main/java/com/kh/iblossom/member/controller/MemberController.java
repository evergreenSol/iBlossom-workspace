package com.kh.iblossom.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.Service.OnedayClassService;
import com.kh.iblossom.product.model.service.ProductService;
import com.kh.iblossom.qna.model.service.QnaService;
import com.kh.iblossom.qna.model.vo.Qna;
import com.kh.iblossom.subscribe.model.service.SubscribeService;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

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
	public String loginForm() {
		
		return "common/login";
	}
	
	// 로그아웃
	@RequestMapping(value="logout.me")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "로그아웃 성공했습니다.");
		
		return "redirect:/";
	}
	
	// 로그인
	@RequestMapping("login.me")
	public String login(Member m,
						HttpSession session) {
	
		// 암호화로 인해 아이디로 조회
		Member loginUser = memberService.login(m);
		
		if(loginUser != null && bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getUserId().equals("admin0")) {
				
				return "redirect:/";
				
			} 
			else {
				session.setAttribute("alertMsg", "로그인에 성공하였습니다.");	
				return "redirect:/"; 
				}
		}
		else { 	
			session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
			return "redirect:loginForm.me";
		}
		
	}
	
	// 회원가입 폼 이동 메소드
	@RequestMapping(value="enrollForm.me")
	public String enrollMemberForm() {
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
			
			Member loginUser = memberService.login(m);
			
			session.setAttribute("loginUser", loginUser);
			
			return "user/member/myPage_UpdateForm";
		}
		else {
			return "redirect:/";
		}
		
	}
	
	// 아이디 찾기
	@RequestMapping("/findId.me")
	public String findId() {
		return "common/findId";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findPwdForm.me")
	public String findPwdForm() {
		return "common/findPwd";
	}
	
	
	
	
	// 메뉴바의 "상품관리" 클릭해서 요청한 경우 => /list.pr (기본적으로 1 번 페이지를 요청하게끔 처리)
	   // 페이징바의 "숫자" 를 클릭해서 요청한 경우 => /list.pr?cpage=요청하는페이지수

	   @RequestMapping("list.me")
	   public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

	      // System.out.println("cpage : " + currentPage);

	      // 페이징처리를 위한 변수들 셋팅 => PageInfo 객체

	      int listCount = memberService.selectListCount();

	      int pageLimit = 10;
	      int boardLimit = 5;

	      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

	      ArrayList<Member> list = memberService.selectList(pi);

	      model.addAttribute("pi", pi);
	      model.addAttribute("list", list);

//	      // 게시판 리스트 화면 포워딩
	      return "admin/member/memberListView";
	   }

   // 마이페이지 호출 및 응답
   @RequestMapping(value="mypage.me")
   public String myPageMainView() {
      
      return "user/member/myPage_MainView";
   }
   
   // 나의 주문정보 보기 메소드
   @RequestMapping(value="orderListView.me")
   public String myPageOrderListView() {
      
      
      // DB에서 주문내역을 ArrayList로 받아오기. 
      
      return "user/member/myPage_OrderListView";
      
   }
   
   
   // 나의 주문내역 상세보기 메소드
   @RequestMapping(value="orderDetailView.me")
   public String myPageOrderDetailView() {
      
      // 매개변수로 주문 번호 가져오기
      // DB에서 해당 주문의 상세내역을 ArrayList로 받아오기
      
      return "user/member/myPage_OrderDetailView";
   }
   
   // 나의 구독정보 메소드
   @RequestMapping(value="subscribeView.me")
   public String myPageSubscribeView(HttpSession session, Model model) {
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<Subscribe> list3m = subscribeService.selectMySubscribeThree(userNo);
      ArrayList<Subscribe> list6m = subscribeService.selectMySubscribeSix(userNo);
      ArrayList<Subscribe> list12m = subscribeService.selectMySubscribeTwelve(userNo);
      ArrayList<Subscribe> listReg = subscribeService.selectMySubscribeRegular(userNo);
      
      model.addAttribute("list3m", list3m);
      model.addAttribute("list6m", list6m);
      model.addAttribute("list12m", list12m);
      model.addAttribute("listReg", listReg);
      
      System.out.println(list3m);
      System.out.println(list6m);
      System.out.println(list12m);
      System.out.println(listReg);
      
      return "user/member/myPage_SubscribeView";
   }
   
   // 프로필 수정 페이지 이동 메소드
   @RequestMapping(value="updateForm.me")
   public String myPageUpdateForm() {
      
      return "user/member/myPage_UpdateForm";
   }
   
   // 프로필 수정 메소드
	@RequestMapping(value="update.me")
	public String myPageUpdateMember(HttpSession session, Member m, Model model) {
		
		System.out.println((Member)session.getAttribute("loginUser"));
		System.out.println(m);
		
		m.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		   
		if(!m.getUserPwd().equals(((Member)session.getAttribute("loginUser")).getUserPwd())) {
			
			String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
			
			m.setUserPwd(encPwd);
		}
		
		System.out.println(m);
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			Member updateMem = memberService.login(m);
			session.setAttribute("loginUser", updateMem);
			return "redirect:updateForm.me";
		}
		else {
			return "redirect:mypage.me";
		}
	}
   
   
   // 회원 탈퇴 페이지 이동 메소드
   @RequestMapping(value="deleteForm.me")
   public String myPageDeleteForm() {
      
      return "user/member/myPage_DeleteForm";
   }
   
	// 회원 탈퇴 메소드
	@RequestMapping(value="delete.me")
	public String myPageDeleteMember(HttpSession session, String userPwd, Model model) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bCryptPasswordEncoder.matches(userPwd, encPwd)) {
		
			int result = memberService.deleteMember(userNo);
			
			System.out.println(result);
			if(result > 0) {
				// 탈퇴 성공
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "회원 탈퇴 되었습니다.");
				
				return "redirect:/";
			}
			else {
				// 탈퇴 실패시 어떻게 해줄가?
				session.setAttribute("alertMsg", "회원 탈퇴에 실패했습니다.");
				return "user/member/deleteForm";
			}
		}
		else {
			// 비번이 다름.
			// alert?
			session.setAttribute("alertMsg", "비밀번호가 다릅니다.");
			return "user/member/deleteForm";
		}

		
	}
   
   @RequestMapping(value="onedayClass.me")
   public String myPageOneDayClass(HttpSession session, Model model) {
      
      /*
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<OnedayClass> list = onedayclassService.selectMyOnedayClass(userNo);
      
      model.addAttribute("list", list);
      
      */
      
      return "user/member/myPage_OnedayClass";
   }
   
   @RequestMapping(value="reviewListView.me")
   public String myPageReviewListView(HttpSession session, Model model) {
      
      /*
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<Review> list = productService.selectMyReview(userNo);
      
      */
      
      return "user/member/myPage_ReviewListView";
   }
   
   @RequestMapping(value="qnaListView.me")
   public String myPageQnaListView(HttpSession session, Model model) {
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<Qna> list = qnaService.selectMyQna(userNo);
      
      System.out.println(list);
      
      model.addAttribute("list", list);

      return "user/member/myPage_QnaListView";
   }
   
 
   
}
	
	

