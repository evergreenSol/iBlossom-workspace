package com.kh.iblossom.qna.model.service;

import java.util.ArrayList;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.qna.model.vo.Qna;

public interface QnaService {

	ArrayList<Qna> selectMyQnaList(int userNo);

	ArrayList<Qna> selectList(PageInfo pi);
	
	int insertQna(Qna q);

	int insertAnswer(Qna q);

	Qna selectQna(int qnaNo);

	int selectListCount();

}
