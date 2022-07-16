package com.kh.iblossom.onedayclass.contorller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.common.template.Pagination;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.Service.OnedayClassService;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;
import com.kh.iblossom.qna.model.vo.Qna;
import com.kh.iblossom.subscribe.model.vo.SubProduct;

@Controller
public class OnedayClassController {

	@Autowired 
	private OnedayClassService onedayClassService;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
   
	// 상세페이지
	@RequestMapping("classDetail.cl")
	public String classListView(Model model) {

		ArrayList<OnedayClass> list = onedayClassService.selectClassList();
		
		// System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "user/onedayclass/class_DetailView";
	}
	
	// 결제페이지
   @RequestMapping("ResForm.cl")
   public String classResForm(int classNo, Model model) {
	   
      // System.out.println(classNo);
      
      OnedayClass oc = onedayClassService.selectOnedayClass(classNo);
      
      // System.out.println(oc);
      
      model.addAttribute("oc", oc); // date -> classNo
      
      return "user/onedayclass/class_ReservationForm";
   }
    
   // 예약 정보
	@ResponseBody
	@RequestMapping(value="resInsert.cl", produces="text/html; charset=UTF-8")
	public String insertClassRes(OnedayClassAdmin oa, HttpSession session, Model model) {
		
		System.out.println(oa);
		int classNo = oa.getClassNo();	
		int result = onedayClassService.insertClassRes(oa);
		
		if(result >0) {
			onedayClassService.updateClassCap(classNo);
			
		} else {
			return "예약실패";
		}
		
		return (result > 0) ? "예약이 완료되었습니다." : "예약에 실패하였습니다.";
	}
	
	// 관리자페이지 클래스 리스트	
	@RequestMapping("classList.ad")
	public String classAdminListView(Model model) {
		
		ArrayList<OnedayClass> list = onedayClassService.selectAdminList();

		model.addAttribute("list", list);
		
		return "admin/onedayclass/admin_class_ListView";
	}	
	
	// 관리자페이지 클래스별 예약자리스트	
	@RequestMapping("resList.ad")
	public String classResList(int classNo, Model model) {
		
		ArrayList<OnedayClassAdmin> list = onedayClassService.selectResList(classNo);

		model.addAttribute("list", list);
		
		return "admin/onedayclass/admin_class_ResList";
	}
	
//   // 리스트 상세보기
//   @RequestMapping("clResList.ad")
//   public String selectClassRes(int classNo, Model model) {
//
//	  System.out.println(classNo);
//	   
//	   OnedayClassAdmin oa = onedayClassService.selectClassRes(classNo);
//
//	   model.addAttribute("oa", oa);
//   
//	   return "admin/onedayclass/admin_class_ResList";
//	   
//  }
	
	// 관리자페이지 클래스 삭제
	@ResponseBody
	@RequestMapping(value="deleteClass.ad", produces="text/html; charset=UTF-8")
	public String deleteClass(int classNo, Model model, HttpSession session) {
		
		System.out.println(classNo);
		int result = onedayClassService.deleteClass(classNo);
		
			
			return (result > 0) ? "성공" : "실패";
	}
	
	// 관리자페이지 클래스 추가 화면
	@RequestMapping("classAddForm.ad")
	public String clssAddForm() {
		
		return "admin/onedayclass/admin_class_UpdateForm";
	}
	
	// 관리자페이지 클래스 추가
	@RequestMapping("insertClass.ad")
	public String insertClass(OnedayClass o, HttpSession session, Model model) {
		

		int result = onedayClassService.insertClass(o);
		
		
		if(result > 0) { 
		
			session.setAttribute("alertMsg", "추가 완료");
			
			return "redirect:classList.ad";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "추가 실패");
			
			return "redirect:insertClass.ad";
		}
	}
	

	
	
}	
