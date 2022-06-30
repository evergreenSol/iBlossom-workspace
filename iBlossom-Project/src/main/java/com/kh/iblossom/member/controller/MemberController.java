package com.kh.iblossom.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping(value="mypage.me")
	public String MyPageMainView() {
		
		return "user/member/myPage_MainView";
		
	}
}
