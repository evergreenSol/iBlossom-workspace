package com.kh.iblossom.qna.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.qna.model.vo.Qna;

@Repository
public class QnaDao {
	
	public ArrayList<Qna> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList", null, rowBounds);
	
	}
	
	public ArrayList<Qna> selectMyQna(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		// return (ArrayList)sqlSession.selectList("qnaMapper.selectMyQna", userNo);
		
		return list;
		
	}

	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		
		return sqlSession.insert("qnaMapper.insertQna", q);
	}
	
	
	// 답변작성
	public int insertAnswer(SqlSessionTemplate sqlSession, Qna q) {
		
		return sqlSession.insert("qnaMapper.insertAnswer", q);
	}

	public Qna selectQna(SqlSessionTemplate sqlSession, int qnaNo) {
		
		return sqlSession.selectOne("qnaMapper.selectQna", qnaNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("qnaMapper.selectListCount");
	}
	

}