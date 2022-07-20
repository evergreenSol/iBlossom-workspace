package com.kh.iblossom.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iblossom.member.model.service.MemberService;
import com.kh.iblossom.member.model.vo.Member;

@Controller
public class sendAuthEmail {
	
	private int authKey;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	// 난수 발생 메소드해서 ~ 했다치고 authKey에 대입
	public void randomKey() {
		authKey =  (int)(Math.random() * 900000 + 99999);
	}

	@ResponseBody
	@RequestMapping(value="sendEmail.do", produces="text/html; charset=UTF-8")
	public String sendEmail(HttpServletRequest request, HttpServletResponse response) throws Exception{
	        
			randomKey();
			
		//메일 관련 정보 
	        String host = "smtp.naver.com"; 
	        final String username = "craft0427"; //네이버 이메일 주소중 @ naver.com 앞주소만 작성
	        final String password = "solsol0618@"; //네이버 이메일 비밀번호를 작성
	        int port=587;                      //네이버 STMP 포트 번호
	        
	        // 메일 내용
	        
//	        String recipient = "*******@naver.com"; //메일을 발송할 이메일 주소를 기재해 줍니다.
//	        String subject = "이메일 발송시 제목";    //메일 발송시 제목을 작성
//	        String body = "이름: 홍길동입니다. \n\n"; //메일 발송시 내용 작성

	        String recipient = request.getParameter("recipient");
	        String subject = request.getParameter("subject");
	        String body = request.getParameter("body") + authKey 
	        			+ "\r\n"
	        			+ "\r\n" + "서울특별시 영등포구 선유동2로 57 이레빌딩 19층 iBlossom"
	        		    + "\r\n" + "Tel: 010-5273-5545 / Email: craft0427@naver.com"
	        			+ "\r\n" + "© iBlossom | Time To Blossom ";
	        
	        
	        System.out.println(recipient);
	        System.out.println(subject);
	        System.out.println(body);
	        
	        Properties props = System.getProperties();
	       
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "false");
	        props.put("mail.smtp.ssl.trust", host);

	 
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
	            String un=username;
	            String pw=password; 
	            protected PasswordAuthentication getPasswordAuthentication() { 
	                return new PasswordAuthentication(un, pw); 
	            } 
	        });
	        session.setDebug(true); //for debug 
	        
	        Message mimeMessage = new MimeMessage(session); 
	        mimeMessage.setFrom(new InternetAddress("craft0427@naver.com")); 
	        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	        mimeMessage.setSubject(subject); 
	        mimeMessage.setText(body); 
	        Transport.send(mimeMessage);
	        
	        String result = String.valueOf(authKey);
	        
	        return result;
	    }
	
	@ResponseBody
	@RequestMapping(value="sendPw.do", produces="text/html; charset=UTF-8")
	public String sendPw(HttpServletRequest request, HttpServletResponse response) throws Exception{
	        
			randomKey();
			HashMap<String, String> map = new HashMap<>();
			
			String encPwd = bCryptPasswordEncoder.encode(String.valueOf(authKey));
			map.put("userId",request.getParameter("Id"));
			map.put("userPw", encPwd);
			String mail = memberService.sendEmail(map);
			System.out.println(mail);
			if(mail == null) {
				String result = "false";
				return result;
			}
		//메일 관련 정보 
	        String host = "smtp.naver.com"; 
	        final String username = "craft0427"; //네이버 이메일 주소중 @ naver.com 앞주소만 작성
	        final String password = "solsol0618@"; //네이버 이메일 비밀번호를 작성
	        int port=587;                      //네이버 STMP 포트 번호
	        
	        // 메일 내용
	        
//	        String recipient = "*******@naver.com"; //메일을 발송할 이메일 주소를 기재해 줍니다.
//	        String subject = "이메일 발송시 제목";    //메일 발송시 제목을 작성
//	        String body = "이름: 홍길동입니다. \n\n"; //메일 발송시 내용 작성

	        String recipient = mail;
	        String subject = request.getParameter("subject");
	        String body = request.getParameter("body") + authKey + request.getParameter("endBody")
	        		+ "\r\n"  
	        		+ "\r\n" + "로그인 후 반드시 마이페이지에서 비밀번호를 변경해주세요"
	        		+ "\r\n"
        			+ "\r\n" + "서울특별시 영등포구 선유동2로 57 이레빌딩 19층 iBlossom"
        		    + "\r\n" + "Tel: 010-5273-5545 / Email: craft0427@naver.com"
        			+ "\r\n" 
        		    + "© iBlossom | Time To Blossom ";
	        System.out.println(recipient);
	        System.out.println(subject);
	        System.out.println(body);
	        
	        Properties props = System.getProperties();
	       
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "false");
	        props.put("mail.smtp.ssl.trust", host);

	 
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
	            String un=username;
	            String pw=password; 
	            protected PasswordAuthentication getPasswordAuthentication() { 
	                return new PasswordAuthentication(un, pw); 
	            } 
	        });
	        session.setDebug(true); //for debug 
	        
	        Message mimeMessage = new MimeMessage(session); 
	        mimeMessage.setFrom(new InternetAddress("craft0427@naver.com")); 
	        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	        mimeMessage.setSubject(subject); 
	        mimeMessage.setText(body); 
	        Transport.send(mimeMessage);
	        
	        String result = "true";
	        
	        return result;
	    }
	
	@ResponseBody
	@RequestMapping(value="sendId.do", produces="text/html; charset=UTF-8")
	public String sendId(HttpServletRequest request, HttpServletResponse response) throws Exception{
	        
			String email = request.getParameter("recipient");//"wjdgp1156@naver.com";
			System.out.println(email);
			String userId = memberService.selectId(email);
			
		//메일 관련 정보 
	        String host = "smtp.naver.com"; 
	        final String username = "craft0427"; //네이버 이메일 주소중 @ naver.com 앞주소만 작성
	        final String password = "solsol0618@"; //네이버 이메일 비밀번호를 작성
	        int port=587;                      //네이버 STMP 포트 번호
	        
	        // 메일 내용
	        
//	        String recipient = "*******@naver.com"; //메일을 발송할 이메일 주소를 기재해 줍니다.
//	        String subject = "이메일 발송시 제목";    //메일 발송시 제목을 작성
//	        String body = "이름: 홍길동입니다. \n\n"; //메일 발송시 내용 작성

	        String recipient = request.getParameter("recipient"); // "wjdgp1156@naver.com";
	        String subject = request.getParameter("subject");
	        String body = request.getParameter("body") + userId + request.getParameter("endBody")
				        + "\r\n" 
						+ "\r\n" + "서울특별시 영등포구 선유동2로 57 이레빌딩 19층 iBlossom"
					    + "\r\n" + "Tel: 010-5273-5545 / Email: craft0427@naver.com"
						+ "\r\n" + "© iBlossom | Time To Blossom ";
	        
	        System.out.println(recipient);
	        System.out.println(subject);
	        System.out.println(body);
	        
	        Properties props = System.getProperties();
	       
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "false");
	        props.put("mail.smtp.ssl.trust", host);

	 
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
	            String un=username;
	            String pw=password; 
	            protected PasswordAuthentication getPasswordAuthentication() { 
	                return new PasswordAuthentication(un, pw); 
	            } 
	        });
	        session.setDebug(true); //for debug 
	        
	        Message mimeMessage = new MimeMessage(session); 
	        mimeMessage.setFrom(new InternetAddress("craft0427@naver.com")); 
	        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	        mimeMessage.setSubject(subject); 
	        mimeMessage.setText(body); 
	        Transport.send(mimeMessage);
	        
	        String result = "true";
	        
	        return result;
	    }
}
