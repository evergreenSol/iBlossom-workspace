package com.kh.iblossom.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.qna.model.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired 
	private QnaService qnaService;
	 
	@RequestMapping("qnaList.qu")
	public String qnaListView() {

		return "user/qna/qna_QnaListView";
	}
}
