package com.kh.iblossom.member.model.service;

import java.util.ArrayList;

import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

public interface MemberService {

	int countUserId(String userId);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(int userNo);
	
}
