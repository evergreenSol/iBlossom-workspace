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
	
	public ArrayList<Qna> selectMyQnaList(SqlSessionTemplate sqlSession, int userNo) {

		return (ArrayList)sqlSession.selectList("qnaMapper.selectMyQnaList", userNo);
	}

	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		
		return sqlSession.insert("qnaMapper.insertQna", q);
	}
	
	
	// 답변작성
	public int updateAnswer(SqlSessionTemplate sqlSession, Qna q) {
		
		return sqlSession.update("qnaMapper.updateAnswer", q);
	}

	public Qna selectQna(SqlSessionTemplate sqlSession, int qnaNo) {
		
		return sqlSession.selectOne("qnaMapper.selectQna", qnaNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("qnaMapper.selectListCount");
	}

	public Qna selectAdminQna(SqlSessionTemplate sqlSession, int qnaNo) {
		
		return sqlSession.selectOne("qnaMapper.selectAdminQna", qnaNo);
	}
	

}