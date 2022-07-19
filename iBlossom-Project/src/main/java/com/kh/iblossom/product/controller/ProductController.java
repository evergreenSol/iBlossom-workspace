package com.kh.iblossom.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.stream.Collectors;

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
import com.kh.iblossom.product.model.service.ProductService;
import com.kh.iblossom.product.model.vo.Product;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

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

		// 게시판 리스트 화면 포워딩
		return "admin/product/admin_product_ListView";
	}

	//꽃마켓 main(꽃다발)
	@RequestMapping("flowerList.pr")
	public String selectflowerList(Model model) {

		ArrayList<Product> list = productService.selectflowerList();

		model.addAttribute("flowerList", list);

		//		// 게시판 리스트 화면 포워딩
		return "user/product/product_ListView";
	}

	//꽃마켓 main(꽃병)
	@RequestMapping(value="baseList.pr")
	public String selectListBase(Model model) {

		ArrayList<Product> list = productService.selectListBase();

		model.addAttribute("baseList", list);
		return "user/product/product_ListView";

	}

	/*
	 * // 꽃마켓 main
	 * 
	 * @RequestMapping("productList.pr") public String productListView() {
	 * 
	 * return "product/product_ListView"; }
	 */


	// 꽃대/꽃다발 꽃 상세조회

	/*
	 * @RequestMapping("productDetailView.pr") public String productDetailView() {
	 * 
	 * return "product/product_DetailView"; }
	 */


	// 상품 관리(상품 등록) - admin -
	@RequestMapping("productEnroll.pr")
	public String productEnrollForm() {

		// 단순히 작성폼을 띄우주는 역할
		return "admin/product/product_EnrollForm";
	}

	@RequestMapping("insert.pr")
	public String insertProduct(Product p, MultipartFile upThumbNail,MultipartFile upContentPhoto ,HttpSession session, Model model) {

				System.out.println(p);
		//		System.out.println(contentPhoto);
		System.out.println(upContentPhoto);
		
		System.out.println("insert1 +: " + p.getContentPhoto());
		
		if(!upThumbNail.getOriginalFilename().equals("")) {

			String changeName = saveFile(upThumbNail, session);
			p.setThumbNail("resources/uploadFiles/" + changeName);
			
			//System.out.println("insert2 +: " + p.getContentPhoto());

		}
		if(!upContentPhoto.getOriginalFilename().equals("")) {

			String changeName1 = saveFile(upContentPhoto, session);
			p.setContentPhoto("resources/uploadFiles/" + changeName1);
		}


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

	//상품 상세보기(admin)
	@RequestMapping("detail.pr")
	public ModelAndView selectProduct(int pno, ModelAndView mv) {
		//pno에 상세조회하고자하는 해당 상품 번호가 담겨있음

		// ModelAndView 객체의 addObject 메소드는 자기자신을 리턴해주기 때문에
		// 한번에 setViewName 메소드까지 메소드체이닝으로 호출 가능하다.

		Product p = productService.selectProduct(pno);
		mv.addObject("p", p).setViewName("admin/product/admin_productDetailView");

		return mv;
	}

	//flower상세보기
	@RequestMapping("detailList.pr")
	public ModelAndView selectListProduct(int pno, ModelAndView mv) {
		//pno에 상세조회하고자하는 해당 상품 번호가 담겨있음

		// ModelAndView 객체의 addObject 메소드는 자기자신을 리턴해주기 때문에
		// 한번에 setViewName 메소드까지 메소드체이닝으로 호출 가능하다.

		Product p = productService.selectProduct(pno);
		System.out.println(p);
		mv.addObject("p", p).setViewName("user/product/product_DetailView");

		return mv;
	}

	// 조합형
	@RequestMapping("combinationDetailList.pr") 
	public String selectDetailList(Model model) {

		ArrayList<Product> list = productService.selectDetailList();

		
		model.addAttribute("list",list);
		
		System.out.println(list);

		return "user/product/combination_DetailView";

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
		System.out.println(p);

		return "admin/product/product_UpdateForm";

	}

	// 상품관리(상품 수정) -admin
	@RequestMapping("update.pr")
	public String updateProduct(Product p, MultipartFile reThumbNail, MultipartFile reContentPhoto, HttpSession session, Model model) {

		// 넘어온 첨부파일이 없을 경우 : filename이 속성값이 빈 문자열
		// 넘어온 첨부파일이 있을 경우 : filename 속성값에 원본파일명이 들어있음

		System.out.println(p);

		//넘어온 썸네일이 있을 경우
		if(!reThumbNail.getOriginalFilename().equals("")) {
			// 썸네일
			// 기존의 첨부파일 O / 새로운 첨부파일 O
			//기존의 썸네일이 있을 경우
			if(!p.getThumbNail().equals("")) { 


				// 기존 첨부파일을 서버로부터 삭제 
				String savePath = session.getServletContext().getRealPath(p.getThumbNail());
				new File(savePath).delete();

				// 새로운 썸네일로 바꾸고 싶을 경우
				// 이 시점에서 서버에 파일 업로드 가능
				String changeName = saveFile(reThumbNail,session);

				// p에 새로운 넘어온 썸네일 첨부파일
				p.setThumbNail("resources/uploadFiles/" + changeName);
			}
		}

		// 상세사진
		//넘어온 상세사진이 있을 경우
		if(!reContentPhoto.getOriginalFilename().equals("")) {
			//기존의 상세사진 O / 새로운 상세사진 O
			if(!p.getContentPhoto().equals("")) { //기존의 상세사진이 있을 경우
				// 기존 첨부파일을 서버로부터 삭제 
				String savePath = session.getServletContext().getRealPath(p.getContentPhoto());
				System.out.println(savePath);
				new File(savePath).delete();
				System.out.println(savePath);
				//새로운 상세사진으로 바꾸고 싶을 경우
				String changeName1 = saveFile(reContentPhoto,session);

				//p에 새로운 넘어온 상세사진 첨부파일
				p.setContentPhoto("resources/uploadFiles/" + changeName1);
				
			}else if(p.getContentPhoto() == null) {
				//기존의 첨부파일 X 새로운 첨부파일 O
				String changeName1 = saveFile(reContentPhoto,session);
				System.out.println(changeName1);
				p.setContentPhoto("resources/uploadFiles/" + changeName1);
			}
		}
		int result = productService.updateProduct(p);
		System.out.println("피 :" +p);
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

	/*
	 * // 리뷰 관리 -admin
	 * 
	 * @RequestMapping("reviewList.pr") public String reviewListView() {
	 * 
	 * return "admin/product/review_ListView"; }
	 */

	/*
	 * // 조합형
	 * 
	 * @RequestMapping("combinationDetailList.pr") public String selectDetailList()
	 * { return "user/product/combination_DetailView"; }
	 */



	/*
	 * //상품관리 - admin
	 * 
	 * @RequestMapping("adRroductList.pr") public String adProductListView() {
	 * 
	 * return "product/admin_product_ListView"; }
	 */
	
	// 상품 검색 (관리자)
		@RequestMapping("search.pr")
		public String subMemberSearch(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition, String keyword, Model model) {
			
			HashMap<String, String> map = new HashMap<>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			
			// 페이징 처리를 위한 pi 객체 만들기
			// => Pagination 클래스에 getPageInfo(listCount, currentPage, pageLimit, boardLimit) 메소드를 호출
			int searchCount = productService.selectSearchCountFlower(map); // 현재 검색결과에 맞는 게시글의 총 갯수
			
			int pageLimit = 10;
			int boardLimit = 5;
			
			PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
			
			// 조회 요청
			ArrayList<Product> list = productService.selectSearchListFlower(pi, map);

			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			
			// 이슈 : 검색이 진행된 후 검색 조건과 검색어가 유지되지 않음
			//		 페이징바를 눌러서 이동시 list.bo 로 요청이 들어가는 이슈
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
			
			return "admin/product/admin_product_ListView";
		}
	
	// 이달의 꽃
	@ResponseBody
	@RequestMapping(value="flowerOfTheMonth.pr", produces="application/json; charset=UTF-8")
	public String selectTagProduct(@RequestParam(value="keywords[]") ArrayList<String> keywords, HttpSession session) {
		
		System.out.println(keywords);
		
		ArrayList<String> list = keywords;
		
		ArrayList<Product> result = new ArrayList<>();
		
		
		ArrayList<Product> resultP = new ArrayList<>();
		
		for(int i = 0; i < keywords.size(); i++) {
			System.out.println(list.get(i));
			
			Product p = new Product();
			
			p.setTag(list.get(i));
			
			resultP = productService.selectTagProduct(p);
			
			result.addAll(resultP);
			
		}
		
		System.out.println(result);
		
		result.removeAll(Arrays.asList("", null));
		
		ArrayList<Product> selectList = (ArrayList<Product>) result.stream().distinct().collect(Collectors.toList());
		
		System.out.println(selectList);
		
		// session.setAttribute("selectList", selectList);
		
		return new Gson().toJson(selectList);
		
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
