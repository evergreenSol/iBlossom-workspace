package com.kh.iblossom.onedayclass.contorller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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


   @RequestMapping("ResForm.cl")
   public String classResForm(int classNo, Model model) {
	   
      // System.out.println(classNo);
      
      OnedayClass oc = onedayClassService.selectOnedayClass(classNo);
      
      // System.out.println(oc);
      
      model.addAttribute("oc", oc); // date -> classNo
      
      return "user/onedayclass/class_ReservationForm";
   }
   

	@RequestMapping("classDetail.cl")
	public String classListView(Model model) {

		ArrayList<OnedayClass> list = onedayClassService.selectClassList();
		
		// System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "user/onedayclass/class_DetailView";
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
	
}	
