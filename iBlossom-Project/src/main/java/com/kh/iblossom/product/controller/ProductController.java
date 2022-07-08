package com.kh.iblossom.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.product.model.service.ProductService;
import com.kh.iblossom.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 메뉴바의 "상품관리" 클릭해서 요청한 경우 => /list.pr (기본적으로 1 번 페이지를 요청하게끔 처리)
	// 페이징바의 "숫자" 를 클릭해서 요청한 경우 => /list.pr?cpage=요청하는페이지수

	@RequestMapping("list.pr")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		// System.out.println("cpage : " + currentPage);

		// 페이징처리를 위한 변수들 셋팅 => PageInfo 객체

		int listCount = productService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Product> list = productService.selectList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

//		// 게시판 리스트 화면 포워딩
		return "admin/product/admin_product_ListView";
	}

	// 꽃마켓 main
	@RequestMapping("productList.pr")
	public String productDetailView() {

		return "user/product/product_ListView";
	}

	// 조합형 꽃 상세조회
	@RequestMapping("combination_DetailView.pr")
	public String combinationLDetailView() {

		return "user/product/combination_DetailView";
	}

	// 상품 관리(상품 등록) - admin -
	@RequestMapping("productEnroll.pr")
	public String productEnrollForm() {

		// 단순히 작성폼을 띄우주는 역할
		return "user/product/product_EnrollForm";
	}

	@RequestMapping("insert.pr")
	public String insertProduct(Product p, MultipartFile thumbnail, HttpSession session, Model model) {

		System.out.println(p);
		System.out.println(thumbnail);
//		System.out.println(contentPhoto);
//		
		// : 상품명, 카테고리명, 가격, 수량(0),썸네일, 상품상세사진, 꽃상세내용, 태그
		int result = productService.insertProduct(p);

		if (result > 0) {

			session.setAttribute("alertMsg", "성공적으로 상품이 등록되었습니다.");

			return "redirect:list.pr";
		} else {// 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
		}
		return "common/errorPage";
	}

	//상품 상세보기
	@RequestMapping("detail.pr")
	public ModelAndView selectProduct(int pno, ModelAndView mv) {
		//pno에 상세조회하고자하는 해당 상품 번호가 담겨있음
		
		// ModelAndView 객체의 addObject 메소드는 자기자신을 리턴해주기 때문에
		// 한번에 setViewName 메소드까지 메소드체이닝으로 호출 가능하다.
		
		Product p = productService.selectProduct(pno);
		mv.addObject("p", p).setViewName("admin/product/admin_productDetailView");
		
		return mv;
	}
	
	// 상품관리 (상품 삭제) -admin
	@RequestMapping("delete.pr")
	public String deleteProduct(int pno, Model model, String filePath, HttpSession session) {

		int result = productService.deleteProduct(pno);

		if (result > 0) { // 성공

			/*
			 * // 첨부파일이 있었던 경우 => 파일 삭제 if(!filePath.equals("")) {
			 * 
			 * String realPath = session.getServletContext().getRealPath(filePath); new
			 * File(realPath).delete(); }
			 */

			// 문구 담아서
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");

			// 상품 리스트 페이지로 url 재요청
			return "redirect:list.pr";
		} else { // 실패 => 에러문구 담아서 에러페이지로 포워딩

			model.addAttribute("errorMsg", "게시글 삭제 실패");

			return "common/errorPage";
		}

	}

	
	 // 상품관리(상품 수정)폼 - admin
	 
	 @RequestMapping("productUpdate.pr")
	 public String productUpdateForm(int pno, Model model) {
	 
		 //해당 상품의 상세조회 요청
		 Product p = productService.selectProduct(pno);
		 
		 //Model에 데이터 담기
		 model.addAttribute("p",p);
		 
		 return "user/product/product_UpdateForm";
	 
	 }
	 
	 // 상품관리(상품 수정) -admin
	 @RequestMapping("update.pr")
	 public String updateProduct(Product p, HttpSession session, Model model) {
		 
		 int result = productService.updateProduct(p);
			
			if(result > 0) { // 성공
				
				session.setAttribute("alertMsg", "성공적으로 상품이 수정되었습니다.");
				
				// detail.pr?pno=x 으로 url 재요청
				return "redirect:detail.pr?pno=" + p.getProductNo();
			}
			else { // 실패
				
				model.addAttribute("errorMsg", "상품 수정 실패");
				
				return "common/errorPage"; 
			}
	 }

	// 리뷰 관리 -admin
	@RequestMapping("reviewList.pr")
	public String reviewListView() {

		return "admin/product/review_ListView";
	}

	/*
	 * //상품관리 - admin
	 * 
	 * @RequestMapping("adRroductList.pr") public String adProductListView() {
	 * 
	 * return "product/admin_product_ListView"; }
	 */

}
