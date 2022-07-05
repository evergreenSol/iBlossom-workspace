package com.kh.iblossom.onedayclass.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.onedayclass.model.dao.OnedayClassDao;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

@Service
public class OnedayClassServiceImpl implements OnedayClassService {
	
	@Autowired
	private OnedayClassDao onedayclassDao;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<OnedayClass> selectMyOnedayClass(int userNo) {
		
		return onedayclassDao.selectMyOnedayClass(sqlSession, userNo);
	}

}
