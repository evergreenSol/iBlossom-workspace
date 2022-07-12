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

	@Autowired
	private CartService cartService;

	@Autowired
	private MemberService memberService;

	// 로그인이 되지 않은 상태라면 / 로그인 했는데 안담은 상태라면 : "바구니가 비어있습니다." 페이지
	// 로그인했고 담은 물건이 있다면 담은 물건 합한 채로 보여주기

	// 장바구니 페이지 조회
	@RequestMapping("list.ca")
	public String selectCartList() {

		// 장바구니 페이지만 띄워주는 용도
		return "user/cart/cart_ListView"; // /WEB-INF/views/user/cart/cart_ListView.jsp
	}

	/*
	 * // 장바구니 상품 조회
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("list.car") public String selectCartList(Model model) {
	 * 
	 * ArrayList<Cart> list = cartService.selectCartList();
	 * 
	 * model.addAttribute("list",list);
	 * 
	 * return "user/cart/cart_ListView"; }
	 */
	// 장바구니 상품 추가
	@RequestMapping("insert.ca")
	public String insertCartList(Cart c, HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println(c);
		System.out.println(loginUser);

		if (loginUser == null) {
			return "common/login";
		} else {
			// Service 단으로 cart 를 넘겨서 insert 요청
			c.setUserNo(loginUser.getUserNo());
			int result = cartService.insertCartList(c);

			if (result > 0) {

				// 성공시 ~~~ 페이지로 url 재요청
				// session.setAttribute("alertMsg", "성공적으로 장바구니가 추가되었습니다.");
				return "user/cart/cart_ListView";

			} else {

				return "common/login";
			}
		}
	}

	// 조합형 장바구니
	@RequestMapping("insertCo.ca")
	public void inserCommandCartList(CartCommand cartCommand, HttpServletRequest request, HttpSession session, Model model) {

		//Member loginUser = (Member) session.getAttribute("loginUser");
		
		//request.getParameter("0");
		System.out.println(request.getParameter("sum"));
		System.out.println(request.getParameter("1"));
		//System.out.println(loginUser);
		ArrayList<Cart> list = (ArrayList<Cart>) cartCommand.getCartList();
		
		/*
		 * System.out.println(list); System.out.println(list.get(0).getProductNo());
		 * System.out.println(list.get(1).getProductNo());
		 */
		/*
		 * if(loginUser == null) { return "common/login"; } else { // Service 단으로 cart 를
		 * 넘겨서 insert 요청 cartCommand.setUserNo(loginUser.getUserNo()); int result =
		 * cartService.inserCommandCartList(cartCommand);
		 * 
		 * if(result > 0 ) {
		 * 
		 * // 성공시 ~~~ 페이지로 url 재요청 // session.setAttribute("alertMsg",
		 * "성공적으로 장바구니가 추가되었습니다."); return "user/cart/cart_ListView";
		 * 
		 * } else {
		 * 
		 * return "common/login"; } }
		 */
	}

	// 빈 장바구니 조회
	@RequestMapping("empty.ca")
	public String emptyCartList() {

		// 장바구니 페이지만 띄워주는 용도
		return "user/cart/cart_EmptyList";
	}

}
