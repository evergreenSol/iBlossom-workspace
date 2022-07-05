package com.kh.iblossom.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.qna.model.vo.Qna;

@Repository
public class QnaDao {
	
	public ArrayList<Qna> selectMyQna(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		// return (ArrayList)sqlSession.selectList("qnaMapper.selectMyQna", userNo);
		
		return list;
		
	}

}
