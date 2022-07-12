package com.kh.iblossom.onedayclass.contorller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.cart.model.vo.Cart;
import com.kh.iblossom.onedayclass.model.Service.OnedayClassService;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;
import com.kh.iblossom.subscribe.model.vo.SubProduct;

@Controller
public class OnedayClassController {

	@Autowired 
	private OnedayClassService onedayClassService;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	 
	@RequestMapping("classDetail.cl")
	public String classDetailView() {

		return "user/onedayclass/class_DetailView";
	}


   @RequestMapping("ResForm.cl")
   public String classResForm(String classNo, Model model) {

	  ArrayList<Onedayclass> list = OnedayclassService.selectOnedayclassList(); 
	   
      System.out.println(classNo);
      
      model.addAttribute("classNo", classNo); // date -> classNo
      
      return "user/onedayclass/class_ReservationForm";
   }
   
//	@RequestMapping("listView.cl")
//	public String classListView(Model model) {
//
//		ArrayList<Onedayclass> list = OnedayclassService.selectOnedayclassList();
//
//		model.addAttribute("list",list);
//		
//		return "user/subscribe/subscribe_ListView";
//	}
   
   // 예약 정보
	@RequestMapping("resInsert.cl")
	public String insertClassRes(OnedayClassAdmin oa, HttpSession session, Model model) {
		
		System.out.println(oa);
			
		int result = onedayClassService.insertClassRes(oa);
		
		if(result > 0) { 
			
			// 성공시 ~~~ 페이지로 url 재요청
			// session.setAttribute("alertMsg", "성공적으로 장바구니가 추가되었습니다.");
			return "user/onedayclass/class_ReservationForm";
			
		} else {
			
			return "redirect:/";
		}

	}
	
}	
