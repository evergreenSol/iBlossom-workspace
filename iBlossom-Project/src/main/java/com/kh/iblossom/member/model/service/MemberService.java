package com.kh.iblossom.member.model.service;

import java.util.ArrayList;

import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

public interface MemberService {

	
	Member updateMember(Member m);
	
	int deleteMember(int userNo);
	
}
