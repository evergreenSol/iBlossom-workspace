package com.kh.iblossom.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

public interface MemberService {
	
	// 회원가입
	Member login(Member m);
	
	int countEmail(String email);
	
	int countUserId(String userId);
	
	int insertMember(Member m);

	int updateMember(Member m);
	
	int deleteMember(int userNo);
	
   // 멤버 리스트 조회 + 페이징 처리
   // 멤버 총 개수 조회
   int selectListCount();
   // 멤버 리스트 조회
   ArrayList<Member> selectList(PageInfo pi);
   
	
	// 이메일 발송
	public String sendEmail(HashMap<String, String> map) throws Exception;

	String selectId(String email);
	


   int updateGrLevel();

   int updateSubPurchase(HashMap<String, Integer> map);
   
   int refundPurchase(HashMap<String, Integer> map);



	
}
