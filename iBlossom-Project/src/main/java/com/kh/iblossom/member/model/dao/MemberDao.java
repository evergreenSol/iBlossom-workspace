package com.kh.iblossom.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member login(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	
	public int countUserId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.countUserId", userId);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		
		System.out.println(m);
		
		int result = sqlSession.update("memberMapper.updateMember", m);
		
		System.out.println(result);
		
		return result;
		
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		
//		return sqlSession.update("memberMapper.deleteMember", userNo);
		return 1;

	}
	
}
