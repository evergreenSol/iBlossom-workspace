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
	
	// 정원 업데이트
	int updateClassCap(int classNo);
	
	// 관리자페이지 클래스 리스트
	ArrayList<OnedayClass> selectAdminList();
	
	// 관리자페이지 클래스별 예약자 리스트
	ArrayList<OnedayClassAdmin> selectResList(int classNo);
	
	// 관리자페이지 클래스 삭제
	int deleteClass(int classNo);

	int insertClass(OnedayClass o);
	
	// OnedayClassAdmin selectClassRes(int classNo);
	
	// 마이페이지 원데이 클래스
	ArrayList<OnedayClass> selectMyOnedayClass(int userNo);
}
