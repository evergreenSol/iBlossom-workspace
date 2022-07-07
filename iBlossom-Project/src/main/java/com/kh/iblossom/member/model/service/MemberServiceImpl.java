package com.kh.iblossom.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
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
		
//		return memberDao.updateMember(sqlSession,member);
		return 0;
	}

	@Override
	public int deleteMember(int userNo) {

		return 0;
	}
	
	@Override
	public Member login(Member m) {
		
		return memberDao.login(sqlSession, m);
	}
	
	@Override
	   public int selectListCount() {
	      
	      return memberDao.selectListCount(sqlSession);
	   }

	@Override
	   public ArrayList<Member> selectList(PageInfo pi) {

	      return memberDao.selectList(sqlSession, pi);
	   }

	// 회원 상세조회
//	   @Override
//	   public Member selectMember(int userNo) {
//	      return memberDao.selectMember(sqlSession, userNo);
//	   }

	
}
