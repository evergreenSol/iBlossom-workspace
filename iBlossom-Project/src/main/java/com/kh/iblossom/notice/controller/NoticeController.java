package com.kh.iblossom.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.notice.model.service.NoticeService;
import com.kh.iblossom.notice.model.vo.Notice;
import com.kh.iblossom.qna.model.vo.Qna;

@Controller
public class NoticeController {
	
	@Autowired 
	private NoticeService noticeService;
	 
	@RequestMapping("listView.no")
	public String noticeListView(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,Model model) {
		
		int listCount = noticeService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectList();

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "user/notice/notice_ListView";
	}
	
	// 관리자페이지 공지사항 리스트
	@RequestMapping("noticeList.ad")
	public String adminNoticeListView(Model model) {
		
		ArrayList<Notice> list = noticeService.selectAdminList();

		model.addAttribute("list", list);
		
		return "admin/notice/admin_notice_ListView";
	}
	
   // 공지사항 상세보기 
   @RequestMapping(value="detailNotice.ad")
   public String selectAdminNotice(int noticeNo, Model model) {
	   
	   Notice n = noticeService.selectAdminNotice(noticeNo);
	   
	   model.addAttribute("n", n);
	   
	   return "admin/notice/admin_notice_UpdateForm";
	   
   }
	
	// 관리자페이지 공지사항 작성 화면
	@RequestMapping("noticeForm.ad")
	public String noticeForm() {
		
		return "admin/notice/admin_notice_EnrollForm";
	}
	
	// 관리자페이지 공지사항 작성 폼
	@RequestMapping("insertNotice.ad")
	public String insertNotice(Notice n, HttpSession session, Model model) {
		
		int result = noticeService.insertNotice(n);				
		
		if(result > 0) { 
		
			session.setAttribute("alertMsg", "등록 성공");
			
			return "redirect:noticeList.ad";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "등록 실패");
			
			return "common/errorPage";
		}
	}
	
	// 공지 수정
	@RequestMapping("updateNotice.ad")
	public String updateNotice(Notice n, HttpSession session, Model model) {
		
		int result = noticeService.updateNotice(n);	
		
		if(result > 0) { 
		
			session.setAttribute("alertMsg", "수정 성공");
			
			return "redirect:noticeList.ad";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "수정 실패");
			
			return "common/errorPage";
		}
	}
	
	
	// 공지 삭제
	@ResponseBody
	@RequestMapping(value="deleteNotice.ad", produces="text/html; charset=UTF-8")
	public String deleteNotice(int noticeNo, Model model, HttpSession session) {
		
		int result = noticeService.deleteNotice(noticeNo);
		
			
			return (result > 0) ? "성공" : "실패";
	}

	
	// contact us 호출만 함
	@RequestMapping("contactus.no")
	public String contactusView() {

		return "user/notice/notice_ContactusView";
	}
	
	// faq 호출만 함
	@RequestMapping("faq.no")
	public String faqView() {

		return "user/notice/notice_FaqView";
	}
	
}



