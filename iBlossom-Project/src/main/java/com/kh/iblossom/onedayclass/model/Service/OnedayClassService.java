package com.kh.iblossom.onedayclass.model.Service;

import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;

public interface OnedayClassService {
	
	// 예약 정보 추가
	int insertClassRes(OnedayClassAdmin oa);
}
