package com.kh.iblossom.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.cart.model.Service.CartService;
import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.cart.model.vo.CartCommand;
import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.order.model.service.OrderService;
import com.kh.iblossom.order.model.vo.DetailOrder;
import com.kh.iblossom.order.model.vo.DetailOrderCommand;
import com.kh.iblossom.order.model.vo.Order;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	

	// 주문/결제 조회용
	@RequestMapping("detail.or")
	public String DetailOrder(CartCommand cartCommand, HttpSession session, Model model) {
		
		// System.out.println("옴");
		// System.out.println(cartCommand);
		
		ArrayList<Cart> list = (ArrayList<Cart>)cartCommand.getCartList();
		
		// int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		if(list == null) {
			session.setAttribute("alertMsg", "결제할 항목을 선택해주세요.");
			return "redirect:list.ca";
		}
		else {
			
			ArrayList<Cart> selectList = new ArrayList<>();
			
			// System.out.println("list: " + list);
			// System.out.println("크기: " + list.size());
			
			for(int i = 0; i < list.size(); i++) {
				
				int cartNo = list.get(i).getCartNo();
				
				Cart c = list.get(i);
				c.setProductCount(list.get(i).getProductCount());
				
				System.out.println(c);
				
				int updateResult = cartService.updateCart(c);
				
				if(cartNo != 0) {
					
					System.out.println("카트넘버: " + cartNo);
					
					Cart cart = cartService.selectOneCart(c);
					
					System.out.println("추출한 카트: " + cart);
					
					selectList.add(cart);
					
				}
			}
			
			// System.out.println(selectList);
			
			model.addAttribute("selectList", selectList);
			
			// ArrayList<Cart> list = cartService.selectCart(userNo);
			
			// model.addAttribute("list", list);
			
			return "user/order/order_DetailView";
		}
	}
	
	// 결제완료 페이지 이동
	@RequestMapping("complete.or")
	public String orderComplete() {
		return "user/order/order_Complete";
	}
	
	// 주문결제 페이지에서 데이터 추가
	@ResponseBody
	@RequestMapping("insert.or")
	public String insertOrder(Order o, HttpSession session, Model model) {
		
		// System.out.println(o);
		
		String receiptId = o.getReceiptId();
		int oNo;
		
		// 오더 테이블 만들기(주문)
		int result = orderService.insertOrder(o);
		
		// System.out.println("result = " + result);
		// System.out.println("receiptId = " + receiptId);
		
		if(result > 0) { // 오더테이블이 만들어짐
			
			// 방금 만든 오더 테이블 조회해오기 
			Order thisOrder = orderService.selectOrder(receiptId);
			System.out.println(thisOrder);
			oNo = thisOrder.getOrderNo();
			
			String orderNo = Integer.toString(oNo);
			
			return orderNo;
		}
		else { // 못만듦 ㅜㅜ
			return "0";
			
		}
	}
	
	@RequestMapping("insertDetailOrder.or")
	public String insertDetailOrder(DetailOrderCommand detailOrderCommand, int orderNo, HttpSession session, Model model) {
		// 디테일 오더 테이블 만들기(주문상세)
		
		// System.out.println("트리거 실행");
		// System.out.println(detailOrderCommand);
		
		ArrayList<DetailOrder> list = (ArrayList<DetailOrder>)detailOrderCommand.getDetailOrderList();
		
		// 구매액 Purchase Amount
		int purchase = 0;
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		Member m = new Member();
		m.setUserId(userId);
		
		for(int i = 0; i < list.size(); i++) {
			DetailOrder detailOrder = list.get(i);
			// detailOrder.setOrderNo(orderNo);
			
			detailOrder.setOrderNo(orderNo);
			
			purchase += detailOrder.getOnePrice() * detailOrder.getOneQuantity();
			
			int cartNo = detailOrder.getCartNo();
			
			int DOResult = orderService.insertDetailOrder(detailOrder);
			int cartDeleteResult = cartService.deleteCart(cartNo);
			
			if(DOResult * cartDeleteResult < 0) {
				break;
			}
		}
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("userNo", userNo);
		map.put("purchase", purchase);
		
		int paResult = memberService.updateSubPurchase(map);
		if(paResult > 0) {
			
			Member updateMem = memberService.login(m);
			session.setAttribute("loginUser", updateMem);
		}
		
		model.addAttribute("orderNo", orderNo);
				
		return "user/order/order_Complete";
	}
	
	
	// -------------------------------------------------------------------------------------
	
	// 관리자 영역
	
	// 관리자 페이지에서 쓰일 < 페이징 처리 >
	// 페이징처리를 위한 변수들 셋팅 => PageInfo 객체
	@RequestMapping("adminList.or") /**/
	public String selectOrderList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = orderService.selectOrderListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// * 이슈발생 *
		// 왜 메소드이름이 adminSelectList 이냐 ?
		// 관리자 전체주문내역 조회용 메소드의 내용을 불러오기 위해서이다.
		ArrayList<Order> list = orderService.adminSelectList(pi);
		
		System.out.println(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		// 전체주문내역 화면 포워딩
		return "admin/order/orderListView";
		
	}
	
	/*
	 * // 관리자 - 전체주문내역 조회용 메소드
	 * 
	 * @RequestMapping(value="adminList.or") public String adminSelectList(Model
	 * model) {
	 * 
	 * ArrayList<Order> list = orderService.adminSelectList();
	 * 
	 * System.out.println(list);
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * return "admin/order/orderListView";
	 * 
	 * }
	 */
	
    // 관리자 - 개별주문내역 조회용 메소드 (상세보기)
    @RequestMapping(value="adminDetail.or")
    public String adminSelectDetail(int orderNo, Model model) {
 	   
 	  ArrayList<DetailOrder> list = orderService.adminSelectDetail(orderNo);
 	  
 	  // 주문 한개
 	  Order o = orderService.selectOneOrder(orderNo);
 	  
 	  System.out.println(list);
 	  System.out.println(o);
 	  
 	  model.addAttribute("list", list);
 	  model.addAttribute("o", o);
 	  
       // 매개변수로 주문 번호 가져오기
       // DB에서 해당 주문의 상세내역을 ArrayList로 받아오기
       
       return "admin/order/orderDetailView";
    }
    
    
	/*
	// 기존에 연결을 위해 쓴거 
	// 주문
	@RequestMapping("detailView.or")
	public String DetailOrderList() {
		return "user/order/order_DetailView";
		// /WEB-INF/views/user/order/order_DetailView.jsp
	}*/
    
	
	/*
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
	*/
	
}
