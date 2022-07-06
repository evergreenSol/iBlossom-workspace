package com.kh.iblossom.qna.controller;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.qna.model.service.QnaService;
import com.kh.iblossom.qna.model.vo.Qna;

@Controller
public class QnaController {
	
	@Autowired 
	private QnaService qnaService;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	 
	@RequestMapping("qnaList.qu")
	public String qnaListView() {

		return "user/qna/qna_QnaListView";
	}
	
	@RequestMapping("qnaForm.qu")
	public String qnaForm() {
		
		return "user/qna/qna_QnaForm";
	}
	
	@RequestMapping("insert.qu")
	public String insertQna(Qna q, HttpSession session, Model model) {
		
		int result = qnaService.insertQna(q);
		
		if(result > 0) { // 성공 => 게시글 리스트페이지로 url 재요청
		
			session.setAttribute("alertMsg", "성공적으로 문의글이 등록되었습니다.");
			
			return "redirect:qnaList.qu";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "문의글 등록 실패");
			
			return "user/qna/qna_QnaListView.jsp"; // /WEB-INF/views/common/errorPage.jsp
		}
	}
	
}
