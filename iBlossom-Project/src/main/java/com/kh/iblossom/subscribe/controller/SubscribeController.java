package com.kh.iblossom.subscribe.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.kh.iblossom.subscribe.model.service.SubscribeService;
import com.kh.iblossom.subscribe.model.vo.SubProduct;

@Controller
public class SubscribeController {

	
	@Autowired private SubscribeService subscribeService;
	 

//	// 정기구독 상품 리스트 조회용 메소드
//	@RequestMapping("listView.su")
//	public String selectList(Model model) { 
//		
//		ArrayList<Subproduct> list = subproductService.selectList();
//		
//		model.addAttribute("list", list);
//		
//		return "subscribe/subscribeListView";
//	}
//	
//	@RequestMapping("pay.su")
//	public String paySubProduct() {
//		
//		return "common/payView";
//	}
	@RequestMapping("listView.su")
	public String subscribeListView() {

		return "subscribe/subscribeListView";
	}

	@RequestMapping("updateForm.su")
	public String subscribeUpdateForm(Model model) {

		ArrayList<SubProduct> list = subscribeService.selectList();

		model.addAttribute("list",list);
		
		return "subscribe/subscribeUpdateForm";
	}
	
	@RequestMapping("insert.su")
	public String insertSubProduct(SubProduct sp, MultipartFile subfile, HttpSession session, Model model) {
		
		if(!subfile.getOriginalFilename().equals("")) {
		
			// saveFile 메소드로 위의 코드를 따로 정의함
			String changeName = saveFile(subfile, session);
			System.out.println(changeName);
			
			// 8. Board b 에 originName, changeName 필드에 값 저장
			sp.setSubOriginName(subfile.getOriginalFilename());
			sp.setSubChangeName("resources/uploadFiles/" + changeName);	
		}
		
		// Service 단으로 b 를 넘겨서 insert 요청
		// 넘어온 첨부파일이 있을 경우 b : 제목, 내용, 작성자, 원본파일명, 수정파일명
		// 넘어온 첨부파일이 없을 경우 b : 제목, 내용, 작성자
		System.out.println(sp);
		
		int result = subscribeService.insertSubProduct(sp);
		
		return "redirect:listView.su";
		
		/*
		 * if(result > 0) { // 성공 => 게시글 리스트페이지로 url 재요청
		 * 
		 * session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
		 * 
		 * return "redirect:listView.bo"; } else { // 실패 => 에러페이지 포워딩
		 * 
		 * model.addAttribute("errorMsg", "게시글 등록 실패");
		 * 
		 * return "common/errorPage"; // /WEB-INF/views/common/errorPage.jsp }
		 */
	}
	
	public String saveFile(MultipartFile subfile, HttpSession session) {
		
		// 파일명 수정 후 업로드 시키기
		// 예) "flower.png" => "2022061511020112345.png"
		// 1. 원본파일명 가져오기
		String originName = subfile.getOriginalFilename(); // "flower.png"
		
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
			subfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
