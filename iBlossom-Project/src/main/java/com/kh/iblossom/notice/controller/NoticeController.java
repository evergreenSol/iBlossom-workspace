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

}
