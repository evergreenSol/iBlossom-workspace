package com.kh.iblossom.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.order.model.service.OrderService;
import com.kh.iblossom.order.model.vo.Order;
import com.kh.iblossom.product.model.service.ProductService;
import com.kh.iblossom.product.model.service.ReviewService;
import com.kh.iblossom.product.model.vo.Product;
import com.kh.iblossom.product.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;

	//리뷰 전체 리스트
	@RequestMapping("list.re")
	public String selectReviewList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {

		int listCount = reviewService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Review> list = reviewService.selectReviewList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		System.out.println(pi);
		System.out.println(list);

		return "admin/product/review_ListView";
	}

	//리뷰 작성하기
	@RequestMapping("insert.re")
	public String insertReview(Review r, MultipartFile upReviewPhoto, HttpSession session, Model model) {


		ArrayList<Order> list = orderService.selectOrderReview(r);
		System.out.println(list);



		/*
		 * Product p = productService.selectProduct(pno);
		 * 
		 * System.out.println(p);
		 */



		System.out.println(r); System.out.println(list); model.addAttribute("r",r);

		if(list.isEmpty()) {


			// model.addAttribute("errorMsg","해당 상품을 구매 후 작성해주세요");
			session.setAttribute("alertMsg", "해당 상품을 구매 후 작성해주세요.");


		} else {

			if(!upReviewPhoto.getOriginalFilename().equals("")) { String changeName =
					saveFile(upReviewPhoto,session);

			r.setReviewPhoto("resources/uploadFiles/" + changeName); }

			int result = reviewService.insertReview(r);

			if(result > 0) {

				session.setAttribute("alertMsg", "성공적으로  리뷰이 등록되었습니다.");

				return "redirect:detailList.pr?pno=" + r.getProductNo();
		

			}else {

				model.addAttribute("errorMsg","리뷰 등록 실패"); 
			}

			return "common/error"; 
		}

		return "common/error";

	}







	/*
	 * // 리뷰 수정폼
	 * 
	 * @RequestMapping("update.re") public String reviewUpdateForm(int rno, Model
	 * model) {
	 * 
	 * //해당 상품의 상세조회 요청 Review r = reviewService.selectReview(rno); }
	 */

	//리뷰삭제
	@RequestMapping("delete.re")
	public String deleteReview(int rno, Model model, String filePath, HttpSession session ) {

		System.out.println(rno);
		int result = reviewService.deleteReview(rno);
		

		if(result > 0) { //성공

			session.setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");

			return "redirect:list.re";
		}
		else { //실패 => 에러문구 담아서 에러페이지로 포워딩

			model.addAttribute("errorMsg","리뷰 삭제 실패");

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


	// 리뷰 띄우기
	@ResponseBody
	@RequestMapping(value="reviewList.re",produces = "application/json; charset=UTF-8")
	public String ajaxReviewList(int productNo) {

		ArrayList<Review> list = reviewService.reviewSelectList(productNo);
		System.out.println("Controller:" + list);
		return new Gson().toJson(list);
	}

	
	// admin 리뷰 상세보기
	@RequestMapping("detail.re")
	public ModelAndView selectReview(int rno, ModelAndView mv) {
		//pno에 상세조회하고자하는 해당 상품 번호가 담겨있음

		// ModelAndView 객체의 addObject 메소드는 자기자신을 리턴해주기 때문에
		// 한번에 setViewName 메소드까지 메소드체이닝으로 호출 가능하다.

		Review r = reviewService.selectReview(rno);
		mv.addObject("r", r).setViewName("admin/product/admin_reviewDetailView");

		return mv;
	}
}
