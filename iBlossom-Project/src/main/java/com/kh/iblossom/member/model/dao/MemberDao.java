package com.kh.iblossom.member.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

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
   
   public String selectEmail(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
	   	sqlSession.update("memberMapper.updatePwd",map);
	
	      return sqlSession.selectOne("memberMapper.selectEmail",map);
	   }
	   // 회원 상세조회
//	 public Member selectProduct(SqlSessionTemplate sqlSession, int productNo) {
//
//		      return sqlSession.selectOne("productMapper.selectProduct", productNo);
//	}
   

	
	//회원 정보 조회-사용자 ID 해당하는 정보 가져오기

	public Member readMember(SqlSessionTemplate sqlSession, String userId) throws Exception {
		//테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동
		Member member = sqlSession.selectOne("member.readMember", userId);
		return member;
	}

	public String selectId(SqlSessionTemplate sqlSession, String email) {
		System.out.println(email);
		return sqlSession.selectOne("memberMapper.selectId", email);
	}
	
}
