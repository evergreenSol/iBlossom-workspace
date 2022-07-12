package com.kh.iblossom.qna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.qna.model.dao.QnaDao;
import com.kh.iblossom.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Qna> selectList(PageInfo pi) {

		return qnaDao.selectList(sqlSession, pi);
	}

	@Override
	public ArrayList<Qna> selectMyQna(int userNo) {
		
		return qnaDao.selectMyQna(sqlSession, userNo);
	}


	@Override
	public int insertQna(Qna q) {
		
		return qnaDao.insertQna(sqlSession, q);
	}


	@Override
	public int insertAnswer(Qna q) {
		
		return qnaDao.insertAnswer(sqlSession, q);
	}

	@Override
	public Qna selectQna(int qnaNo) {

		return qnaDao.selectQna(sqlSession, qnaNo);
	}

	@Override
	public int selectListCount() {

		return qnaDao.selectListCount(sqlSession);
	}

}
