package com.kh.iblossom.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.qna.model.service.QnaService;
import com.kh.iblossom.qna.model.vo.Qna;

@Controller
public class QnaController {
	
	@Autowired 
	private QnaService qnaService;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	 
	
	@RequestMapping("qnaForm.qu")
	public String qnaForm() {
		
		return "user/qna/qna_QnaForm";
	}
	
	@RequestMapping("insert.qu")
	public String insertQna(Qna q, HttpSession session, Model model) {
		
//		System.out.println(q.getQnaTitle());
//		System.out.println(q.getQnaContent());
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		q.setUserNo(userNo);
		
		System.out.println(q);
		
		int result = qnaService.insertQna(q);
		
//		System.out.println(result);
		
		
		if(result > 0) { 
		
			session.setAttribute("alertMsg", "성공적으로 문의글이 등록되었습니다.");
			
			return "redirect:qnaListView.me";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "문의글 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	// 관리자페이지 문의 리스트
//	@RequestMapping("qnaList.ad")
//	public String qnaListView() {
//
//		return "admin/qna/admin_qna_ListView";
//	}
	
	@RequestMapping("qnaList.ad")
	public String qnaListView(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		// System.out.println("cpage : " + currentPage);

		// 페이징처리를 위한 변수들 셋팅 => PageInfo 객체

		int listCount = qnaService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Qna> list = qnaService.selectList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/qna/admin_qna_ListView";
	}	
	
	// 관리자페이지 문의 상세보기
	@RequestMapping("qnaDetail.ad")
	public ModelAndView selectQna(int qno, ModelAndView mv) {
		//pno에 상세조회하고자하는 해당 상품 번호가 담겨있음
		
		// ModelAndView 객체의 addObject 메소드는 자기자신을 리턴해주기 때문에
		// 한번에 setViewName 메소드까지 메소드체이닝으로 호출 가능하다.
		
		Qna q = QnaService.selectQna(qno);
		mv.addObject("q", q).setViewName("admin/qna/admin_qna_AnswerForm");
		
		return mv;
	}
	
	// 관리자페이지 문의 답변작성 화면
	@RequestMapping("answerForm.ad")
	public String answerForm() {
		
		return "admin/qna/admin_qna_AnswerForm";
	}
	
	// 관리자페이지 문의 답변작성 화면
	@RequestMapping("answerInsert.ad")
	public String insertAnswer(Qna q, HttpSession session, Model model) {
		
//		System.out.println(q.getQnaTitle());
//		System.out.println(q.getQnaContent());
		
		int result = qnaService.insertQna(q);
		
//		System.out.println(result);
		
		
		if(result > 0) { 
		
			session.setAttribute("alertMsg", "성공적으로 답변이 등록되었습니다.");
			
			return "redirect:qnaList.ad";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "답변 등록 실패");
			
			return "common/errorPage";
		}
	}
	
}
