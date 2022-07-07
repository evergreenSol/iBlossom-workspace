package com.kh.iblossom.member.model.service;

import java.util.ArrayList;

import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

public interface MemberService {
	
	// 회원가입
	Member login(Member m);
	
	int countUserId(String userId);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(int userNo);



	
}
