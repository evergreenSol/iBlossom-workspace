package com.kh.iblossom.member.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member login(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}	
	
	public int countEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.countEmail", email);
	}

	public int countUserId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.countUserId", userId);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
	
	// 회원리스트 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {

      return sqlSession.selectOne("memberMapper.selectListCount");
	}

   public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

      int limit = pi.getBoardLimit();
      int offset = (pi.getCurrentPage() - 1) * limit;

      RowBounds rowBounds = new RowBounds(offset, limit);

      return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
   }
   
   // 등급 업데이트 메소드
   public int updateGrLevel(SqlSessionTemplate sqlSession) {
	   return sqlSession.update("memberMapper.updateGrLevel", null);
   }
	   
	   // 회원 상세조회
//	 public Member selectProduct(SqlSessionTemplate sqlSession, int productNo) {
//
//		      return sqlSession.selectOne("productMapper.selectProduct", productNo);
//	}
	
}
