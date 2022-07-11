package com.kh.iblossom.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public int countEmail(String email) {
		return memberDao.countEmail(sqlSession, email);
	}
	
	@Override
	public int countUserId(String userId) {
		return memberDao.countUserId(sqlSession, userId);
	}
	
	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(sqlSession, member);
	}
	
	@Override
	public int updateMember(Member m) {
		

		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(int userNo) {

		return memberDao.deleteMember(sqlSession, userNo);
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

	@Override
	public int updateGrLevel() {
		return memberDao.updateGrLevel(sqlSession);
	}



	@Override
	public String sendEmail(HashMap<String, String> map) throws Exception {
		
		
		return memberDao.selectEmail(sqlSession, map);
	}

	@Override
	public String selectId(String email) {

		return memberDao.selectId(sqlSession, email);
	}

	// 회원 상세조회
//	   @Override
//	   public Member selectMember(int userNo) {
//	      return memberDao.selectMember(sqlSession, userNo);
//	   }
	


	
}
