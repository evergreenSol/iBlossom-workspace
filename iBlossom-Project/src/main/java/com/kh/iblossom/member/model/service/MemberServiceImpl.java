package com.kh.iblossom.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.member.model.dao.MemberDao;
import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(int userNo) {

		return memberDao.deleteMember(sqlSession, userNo);
	}

	
}
