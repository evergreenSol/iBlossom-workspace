package com.kh.iblossom.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.member.model.dao.MemberDao;
import com.kh.iblossom.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int countUserId(String userId) {
		return memberDao.countUserId(sqlSession,userId);
	}
	
	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(sqlSession,member);
	}
	
	@Override
	public int updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(int userNo) {

		return 0;
	}
	
	@Override
	public Member login(Member m) {
		
		return memberDao.login(sqlSession, m);
	}



	
}
