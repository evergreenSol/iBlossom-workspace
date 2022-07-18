package com.kh.iblossom.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.Service.OnedayClassService;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.order.model.service.OrderService;
import com.kh.iblossom.order.model.vo.DetailOrder;
import com.kh.iblossom.order.model.vo.Order;
import com.kh.iblossom.product.model.service.ProductService;
import com.kh.iblossom.product.model.service.ReviewService;
import com.kh.iblossom.product.model.vo.Product;
import com.kh.iblossom.product.model.vo.Review;
import com.kh.iblossom.qna.model.service.QnaService;
import com.kh.iblossom.qna.model.vo.Qna;
import com.kh.iblossom.subscribe.model.service.SubscribeService;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OnedayClassService onedayclassService;

	@Autowired
	private ReviewService reviewService;

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

	// 회원가입 이용약관 이동 메소드
	@RequestMapping(value="enrollAgree.me")
	public String enrollAgree() {
		return "common/enrollAgree";
	}

	// 회원가입 폼 이동 메소드
	@RequestMapping(value="enrollForm.me")
	public String enrollMemberForm() {
		return "common/join";
	}

	// 회원가입 - 이메일 중복 체크 메소드
	@ResponseBody
	@RequestMapping(value="checkEmail.me")
	public void countEmail(String email, HttpServletResponse response) throws IOException {

		int result = memberService.countEmail(email);

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
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

	// 마이페이지 메인 호출 및 응답
	@RequestMapping(value="mypage.me")
	public String myPageMainView(HttpSession session, Model model) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		// 최근 1개월
		// 배송준비
		// 배송중
		// 배송완료
		int ready = orderService.countReady(userNo);
		int shipping = orderService.countShipping(userNo);
		int complete = orderService.countComplete(userNo);

		// 최근 1개월 
		// 주문
		ArrayList<Order> list = orderService.selectMyOrderAllList(userNo);

		model.addAttribute("ready", ready);
		model.addAttribute("shipping", shipping);
		model.addAttribute("complete",complete);
		model.addAttribute("list", list);


		return "user/member/myPage_MainView";
	}

	// 나의 주문정보 보기 메소드
	@RequestMapping(value="orderListView.me")
	public String myPageOrderListView(HttpSession session, Model model) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		ArrayList<Order> list = orderService.selectMyOrderList(userNo);
		ArrayList<Order> cancelList = orderService.selectMyOrderCancelList(userNo);

		System.out.println(list);
		System.out.println(cancelList);

		model.addAttribute("list", list);
		model.addAttribute("cancelList", cancelList);

		// DB에서 주문내역을 ArrayList로 받아오기. 

		return "user/member/myPage_OrderListView";

	}


	// 나의 주문내역 상세보기 메소드
	@RequestMapping(value="orderDetailView.me")
	public String myPageOrderDetailView(int orderNo, Model model) {


		ArrayList<DetailOrder> list = orderService.selectMyDetailOrderList(orderNo);

		Order o = orderService.selectMyOneOrder(orderNo);

		System.out.println(list);
		System.out.println(o);

		model.addAttribute("list", list);
		model.addAttribute("o", o);


		// 매개변수로 주문 번호 가져오기
		// DB에서 해당 주문의 상세내역을 ArrayList로 받아오기

		return "user/member/myPage_OrderDetailView";
	}

	// 나의 구독정보 메소드
	@RequestMapping(value="subscribeView.me")
	public String myPageSubscribeView(HttpSession session, Model model) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		// 최근 3개만, 최근 6개만 최근 12개만...

		ArrayList<Map<String,String>> list = subscribeService.selectMySubReceiptId(userNo);

		ArrayList<String> receiptIdList = new ArrayList<>();

		for(int i = 0; i < list.size(); i++) {

			receiptIdList.add(list.get(i).get("RECEIPT_ID"));
		}

		model.addAttribute("receiptIdList", receiptIdList);

		return "user/member/myPage_SubscribeView";
	}


	@RequestMapping(value="subscribeRealView.me")
	public String selectMySubscribe(String receiptId, Model model) {
		System.out.println(receiptId);

		ArrayList<Subscribe> list = subscribeService.selectMySubscribe(receiptId);

		System.out.println("멤버 컨트롤러 list: " + list);

		model.addAttribute("list", list);

		return "user/member/myPage_SubscribeView_Content";
	}




	// 구독 삭제 메소드
	@ResponseBody
	@RequestMapping(value="cancelSubscribe.me", produces="html/text; charset=UTF-8")
	public String cancelSubscribe(String receiptId) {

		System.out.println(receiptId);

		int result = subscribeService.cancelMySubList(receiptId);

		System.out.println(result);

		String value = Integer.toString(result);

		return value;
	}

	// 꽃 주문 삭제 메소드
	@ResponseBody
	@RequestMapping(value="cancelPay.me", produces="html/text; charset=UTF-8")
	public String cancelPay(String receiptId) {

		System.out.println(receiptId);

		int result = orderService.cancelMyPay(receiptId);

		System.out.println(result);

		String value = Integer.toString(result);

		return value;
	}



	// 프로필 수정 페이지 이동 메소드
	@RequestMapping(value="updateForm.me")
	public String myPageUpdateForm() {

		return "user/member/myPage_UpdateForm";
	}

	// 프로필 수정 메소드
	@RequestMapping(value="update.me")
	public String myPageUpdateMember(HttpSession session, Member m, Model model) {

		//		System.out.println((Member)session.getAttribute("loginUser"));
		//		System.out.println(m);

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
			session.setAttribute("alertMsg", "수정이 완료되었습니다.");
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
      
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<OnedayClass> list = onedayclassService.selectMyOnedayClass(userNo);
      
      model.addAttribute("list", list);
      
      return "user/member/myPage_OnedayClass";
   }
   
   // 나의 리뷰
   @RequestMapping(value="reviewListView.me")
   public String myPageReviewListView(HttpSession session, Model model) {
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<Review> list = reviewService.selectMyReview(userNo);
      
      model.addAttribute("list", list);
      
      return "user/member/myPage_ReviewListView";
   }
   
    // 나의 리뷰 상세 보기
   @RequestMapping(value="reviewDetailView.me")
   public String myPageReviewDetailView(int reviewNo, Model model) {
	   
	   if(reviewNo == 0) {
		   return "redirect:flowerList.pr";
		   
	   }
	   
	   Review r = reviewService.selectReview(reviewNo);
	   
	   System.out.println(r);
	   
	   model.addAttribute("r", r);
	   
	   return "user/member/myPage_ReviewDetailView";
   }
   
   // 마이페이지 1대1문의
   @RequestMapping(value="qnaListView.me")
   public String myPageQnaListView(HttpSession session, Model model) {
      
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      ArrayList<Qna> list = qnaService.selectMyQnaList(userNo);
      
      // System.out.println(list);
      
      model.addAttribute("list", list);

      return "user/member/myPage_QnaListView";
   }
   
   // 1대1문의 상세보기
   @RequestMapping(value="qnaDetailView.me")
   public String myPageQnaDetailView(int qnaNo, Model model) {
	   
	   // System.out.println(qnaNo);
	   
	   if(qnaNo == 0) {
		   return "redirect:qnaForm.qu";
	   }
	   
	   Qna q = qnaService.selectQna(qnaNo);
	   System.out.println(q);
	   model.addAttribute("q", q);
	   
	   return "user/member/myPage_QnaDetailView";
	   
   }
   
   
   // 날짜에 따른 배송상태 변경하기
   @ResponseBody
   @RequestMapping(value="checkDate.me")
   public String updateDeliverStatus() {
	   
	   int result1 = subscribeService.updateDeliverStatus();
	   
	   int result2 = orderService.updateDeliveryStatus();
	   
	   if(result1 * result2 > 0) {
		   return "1";
	   }
	   else {
		   return "0";
	   }
   }
   
	// 누적금에 따른 회원 등급 변경하기
	@ResponseBody
	@RequestMapping(value="checkDate.me")
	public String updateDeliverStatus() {

		int result1 = subscribeService.updateDeliverStatus();

		int result2 = orderService.updateDeliveryStatus();

		if(result1 * result2 > 0) {
			return "1";
		}
		else {
			return "0";
		}
	}

	// 누적금에 따른 회원 등급 변경하기
	@ResponseBody
	@RequestMapping(value="checkPurchase.me")
	public String updateGrLevel(HttpSession session) {

		int result = memberService.updateGrLevel();

		String userId = ((Member)session.getAttribute("loginUser")).getUserId();

		Member m = new Member();
		m.setUserId(userId);

		if(result > 0) {
			Member updateMem = memberService.login(m);
			session.setAttribute("loginUser", updateMem);
			return "1";

		}
		else {
			return "0";
		}
	}

	@RequestMapping(value="refund.me", method=RequestMethod.POST) 
	public String refundPurchase(Order o, HttpSession session) {

		System.out.println("refund.me 로 넘어옴");

		System.out.println(o.getTotalPrice());

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();

		Member m = new Member();
		m.setUserId(userId);

		HashMap<String, Integer> map = new HashMap<>();


		map.put("userNo", userNo);
		map.put("refund", o.getTotalPrice());
		//		map.put("refund", Integer.valueOf(price));

		System.out.println(map);

		int result = memberService.refundPurchase(map);

		if(result > 0) {

			Member updateMem = memberService.login(m);
			session.setAttribute("loginUser", updateMem);

			session.setAttribute("alertMsg", "refund.me에서 결제취소가 되었습니다.");
			return "redirect:orderListView.me";
		}
		else {
			session.setAttribute("alertMsg", "결제취소에 실패했습니다.");
			return "redirect:orderListView.me";
		}
	}

	//나의리뷰삭제
	@RequestMapping("deleteMy.re")
	public String deleteReview(int reviewNo, Model model, String filePath, HttpSession session ) {

		System.out.println(reviewNo);
		int result = reviewService.deleteReview(reviewNo);


		if(result > 0) { //성공

			session.setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");

			return "redirect:reviewListView.me";
		}
		else { //실패 => 에러문구 담아서 에러페이지로 포워딩

			model.addAttribute("errorMsg","리뷰 삭제 실패");

			return "common/errorPage";
		}
	}



	//나의 리뷰 수정 (단순 폼 띄우기)

	@RequestMapping("reviewUpdateMy.re")
	public String ReviewUpdateForm(int reviewNo, Model model) {

		Review r = reviewService.selectReview(reviewNo);

		model.addAttribute("r",r);

		return "user/member/myPage_ReviewUpdateView";

	}



	//나의 리뷰 수정
	@RequestMapping("updateMy.re")
	public String updateReview(Review r, MultipartFile reReviewPhoto, HttpSession session, Model model) {
		
		System.out.println(r.getReviewNo());

		if(!reReviewPhoto.getOriginalFilename().equals("")) { //새로운 첨부파일이 있을경우

			// 새롭게 첨부된 파일 O, 기존 첨부파일 O
			if(r.getReviewPhoto() != null ) { //기존의 리뷰 사진
				String savePath = session.getServletContext().getRealPath(r.getReviewPhoto());

				new File(savePath).delete();
			}

			//이 시점에서 서버에 파일 업로드 가능
			String changeName = saveFile(reReviewPhoto, session);

			// r 에 새로 넘어온 첨부파일에 대한 원본명, 수정명을 필드값으로 수정
			r.setReviewPhoto(reReviewPhoto.getOriginalFilename());


			r.setReviewPhoto("resources/uploadFiles/" + changeName);
		}


		int result = reviewService.updateReview(r);

		if(result > 0) { // 성공

			session.setAttribute("alertMsg", "성공적으로 리뷰가 수정되었습니다.");

			return "redirect:reviewDetailView.me?reviewNo=" + r.getReviewNo();
		}
		else { // 실패

			model.addAttribute("errorMsg", "리뷰 수정 실패");

			return "common/errorPage"; 
		}
	}




	public String saveFile(MultipartFile thumNail, HttpSession session) {

		// 파일명 수정 후 업로드 시키기
		// 예) "flower.png" => "2022061511020112345.png"
		// 1. 원본파일명 가져오기
		String originName = thumNail.getOriginalFilename(); // "flower.png"

		// 2. 시간 형식을 문자열로 뽑아내기
		// "20220615110201" (년월일시분초) => SimpleDateFormat
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 3. 뒤에 붙을 5자리 랜덤값 뽑기
		// "13253"
		int ranNum = (int)(Math.random() * 90000 + 10000);

		// 4. 원본파일명으로부터 확장자 부분만 추출
		// ".png"
		String ext = originName.substring(originName.lastIndexOf("."));

		// 5. 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;

		// 6. 업로드 하고자 하는 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		// 7. 경로와 수정파일명을 합체시킨 후 저장

		try {
			thumNail.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}


}


	
	// 구독 취소 시 DB 환불 반영
	
	
	
	
	// 검색용 메소드
	@RequestMapping("search.me")
	public String tagSearch(String keyword, Model model) {
		
		String modifiedKeyword = keyword.trim().replace(" ", "");
		
		System.out.println(modifiedKeyword);
		
		int searchCount = productService.selectSearchCount(modifiedKeyword); // 현재 검색결과에 맞는 게시글의 총 갯수
		
		// 조회 요청
		ArrayList<Product> list = productService.selectSearchList(modifiedKeyword);
		
		System.out.println(list);

		model.addAttribute("count",searchCount);
		model.addAttribute("list", list);
		model.addAttribute("keyword", modifiedKeyword);
		

		return "common/searchResultView";

	}
 
   
}
	
	

