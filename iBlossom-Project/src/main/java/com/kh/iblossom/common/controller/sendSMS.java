package com.kh.iblossom.common.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class sendSMS {

	@ResponseBody
	@RequestMapping(value="sendOnedayClassMessage.do", produces="text/html; charset=UTF-8")
	 public String sendOnedayClassMessage(HttpSession session, OnedayClass o) {
		
	    String api_key = "NCSJGXUBBQAKRK1P";
	    String api_secret = "VMG2VLAJPBIAUAPIVNIHCPFOQKY8YZFE";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    String phone = ((Member)session.getAttribute("loginUser")).getPhone();
	    String userName  = 	((Member)session.getAttribute("loginUser")).getUserName();    
	    
	    phone = phone.replace("-", "");
	    
	    String classDate = o.getClassDate2();
	    String className = o.getClassName();
	    int price = o.getPrice();
	    
	    String text = "iBlossom 원데이 클래스 예약안내" + "\r\n" + "\r\n"
	    			+ "예약자명: " + userName + "\r\n"
	    			+ "예약일: " + classDate + "\r\n"
	    			+ "클래스명: " + className + "\r\n"
	    			+ "결제금액: " + price + "원" + "\r\n"
	    			+ "장소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 iBlossom"
	    			+ "\r\n" + "\r\n"
	    			+ "© iBlossom | Time To Blossom ";
	    
	    System.out.println(phone);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);
	    params.put("from", "01052735545");
	    params.put("type", "LMS");
	    params.put("text", text);
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	    return "0";
	 }
}
