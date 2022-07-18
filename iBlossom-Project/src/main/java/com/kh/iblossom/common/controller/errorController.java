package com.kh.iblossom.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class errorController {

	@RequestMapping("error")
	public String error() {
		
		return "common/error";
	}
	
}
