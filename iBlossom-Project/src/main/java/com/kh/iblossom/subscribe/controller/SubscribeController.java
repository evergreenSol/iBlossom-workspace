package com.kh.iblossom.subscribe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubscribeController {

	@RequestMapping("subscribeListView.su")
	public String subscribeListView() { 
		
		return "subscribe/SubscribeListView";
	}
}
