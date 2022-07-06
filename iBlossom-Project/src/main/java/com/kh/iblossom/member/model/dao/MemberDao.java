package com.kh.iblossom.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.member.model.vo.Member;

@Repository
public class MemberDao {
	
	
	public int countUserId(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.countUserId", userId);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member updateMember(SqlSessionTemplate sqlSession, Member m) {
		
//		return sqlSession.update("memberMapper.updateMember", m);
		return m;
		
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		
//		return sqlSession.update("memberMapper.deleteMember", userNo);
		return 1;
	}
	
	
	

}
