package com.kh.iblossom.onedayclass.model.Service;

import java.util.ArrayList;

import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;

public interface OnedayClassService {
	
	// 예약 정보 추가
	int insertClassRes(OnedayClassAdmin oa);
	
	// 클래스 리스트
	ArrayList<OnedayClass> selectClassList();
	
	// 클래스 번호로 예약일 뽑기
	OnedayClass selectOnedayClass(int classNo);

	int updateClassCap(int classNo);
}
