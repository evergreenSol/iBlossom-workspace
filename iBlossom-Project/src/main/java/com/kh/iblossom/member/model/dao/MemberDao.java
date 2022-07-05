package com.kh.iblossom.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member updateMember(SqlSessionTemplate sqlSession, Member m) {
		
//		return sqlSession.update("memberMapper.updateMember", m);
		return m;
		
	}
	
	

}
