package com.kh.iblossom.qna.model.service;

import java.util.ArrayList;

import com.kh.iblossom.qna.model.vo.Qna;

public interface QnaService {


//	ArrayList<Qna> selectList();

	ArrayList<Qna> selectMyQna(int userNo);

	int insertQna(Qna q);

	
}
