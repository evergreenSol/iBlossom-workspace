package com.kh.iblossom.onedayclass.contorller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iblossom.onedayclass.model.Service.OnedayClassService;

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
	public String classResForm() {

		return "user/onedayclass/class_ReservationForm";
	}
}
