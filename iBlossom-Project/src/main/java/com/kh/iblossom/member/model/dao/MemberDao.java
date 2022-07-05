package com.kh.iblossom.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.member.model.vo.Member;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

@Repository
public class MemberDao {
	
	public Member updateMember(SqlSessionTemplate sqlSession, Member m) {
		
//		return sqlSession.update("memberMapper.updateMember", m);
		return m;
		
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		
//		return sqlSession.update("memberMapper.deleteMember", userNo);
		return 1;
	}
	
	
	

}
