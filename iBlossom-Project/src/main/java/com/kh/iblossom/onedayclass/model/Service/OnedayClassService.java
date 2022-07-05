package com.kh.iblossom.onedayclass.model.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.onedayclass.model.dao.OnedayClassDao;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

public interface OnedayClassService {
	
	ArrayList<OnedayClass> selectMyOnedayClass(int userNo);
}
