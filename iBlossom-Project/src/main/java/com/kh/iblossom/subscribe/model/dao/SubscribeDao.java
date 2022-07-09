package com.kh.iblossom.subscribe.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.subscribe.model.vo.SubProduct;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDao {
	
	// 구독용 상품 리스트 조회
	public ArrayList<SubProduct> selectSubProductList(SqlSessionTemplate sqlSession) {
	
	  return (ArrayList)sqlSession.selectList("subscribeMapper.selectSubProductList"); 
	 }
	 
	// 구독용 상품 추가
	public int insertSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {

		return sqlSession.insert("subscribeMapper.insertSubProduct", sp);
	}

	// 구독용 상품 삭제
	public int deleteSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.delete("subscribeMapper.deleteSubProduct", spno);
		
	}

	// 구독용 상품 단일 조회
	public SubProduct selectSubProduct(SqlSessionTemplate sqlSession, int spno) {
		
		return sqlSession.selectOne("subscribeMapper.selectSubProduct", spno);
	}

	// 구독용 상품 수정
	public int updateSubProduct(SqlSessionTemplate sqlSession, SubProduct sp) {
		
		return sqlSession.update("subscribeMapper.updateSubProduct", sp);
	}

	// 구독 추가
	public int insertSubscribe(SqlSessionTemplate sqlSession, Subscribe s) {
		 
		return sqlSession.insert("subscribeMapper.insertSubscribe", s);
	}
	
	// 마이페이지 구독조회
	public ArrayList<Subscribe> selectMySubscribe(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("subscribeMapper.selectMySubscribe", userNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("subscribeMapper.selectListCount");
	}
	
	public ArrayList<Subscribe> selectSubMembertList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("subscribeMapper.selectSubMemberList", null, rowBounds); 
	}

	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("subscribeMapper.selectSearchCount", map);
	}

	public ArrayList<Subscribe> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("subscribeMapper.selectSearchList", map, rowBounds);
	}

}
