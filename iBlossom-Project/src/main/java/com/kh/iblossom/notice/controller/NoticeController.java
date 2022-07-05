package com.kh.iblossom.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired 
	private NoticeService noticeService;
	 
	@RequestMapping("listView.no")
	public String noticeListView() {

		return "user/notice/notice_ListView";
	}
<<<<<<< HEAD
	
	// contact us 호출만 함
=======


>>>>>>> f08051f6463b7d8b1e09579dfb22ec22348853df
	@RequestMapping("contactus.no")
	public String contactusView() {

		return "user/notice/notice_ContactusView";
	}
<<<<<<< HEAD
	
	// faq 호출만 함
	@RequestMapping("faq.no")
	public String faqView() {

		return "user/notice/notice_FaqView";
	}
}
=======
}

>>>>>>> f08051f6463b7d8b1e09579dfb22ec22348853df
