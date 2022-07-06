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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.iblossom.subscribe.model.service.SubscribeService;
import com.kh.iblossom.subscribe.model.vo.SubProduct;

@Controller
public class SubscribeController {

	
	@Autowired private SubscribeService subscribeService;
	 	
	@RequestMapping("listView.su")
	public String subscribeListView(Model model) {

		ArrayList<SubProduct> list = subscribeService.selectList();

		model.addAttribute("list",list);
		
		return "user/subscribe/subscribeListView";
	}
	
	@ResponseBody
	@RequestMapping(value="getSubProduct", produces="application/json; charset=UTF-8")
	public String ajaxSelectSubProduct(int spno, ModelAndView mv) {
		
		SubProduct sp = subscribeService.selectSubProduct(spno);
		
		return new Gson().toJson(sp);
	}
	
	
	@RequestMapping("updateForm.su")
	public String subscribeUpdateForm(Model model) {

		ArrayList<SubProduct> list = subscribeService.selectList();

		model.addAttribute("list",list);
		
		return "user/subscribe/subscribeUpdateForm";
	}
	
	@RequestMapping("insert.su")
	public String insertSubProduct(SubProduct sp, MultipartFile subfile, HttpSession session, Model model) {
		
		if(!subfile.getOriginalFilename().equals("")) {
		
			String changeName = saveFile(subfile, session);
	
			sp.setSubOriginName(subfile.getOriginalFilename());
			sp.setSubChangeName("resources/uploadFiles/" + changeName);	
		}
		
		int result = subscribeService.insertSubProduct(sp);
		
		if(result > 0) {
			return "redirect:listView.su";
		}
		else {
			return "redirect:listView.su";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="delete.su", produces="text/html; charset=UTF-8")
	public String ajaxDeleteSubProduct(int spno, String filePath, HttpSession session) {
		
		int result = subscribeService.deleteSubProduct(spno);
			
			// 첨부파일이 있었던 경우 => 파일 삭제
		
		    if(!filePath.equals("")) {
		  
		    	String realPath = session.getServletContext().getRealPath(filePath); new
		    	File(realPath).delete(); 
	    	}
		 
		return (result > 0) ? "success" : "fail";
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
	
	
	@RequestMapping("subMemberListView.su")
	public String subMemberListView() {

		return "user/subscribe/subMember_ListView";
	}

}
