package com.kh.iblossom.onedayclass.model.dao;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.onedayclass.model.vo.OnedayClass;

@Repository
public class OnedayClassDao {

	public ArrayList<OnedayClass> selectMyOnedayClass(SqlSessionTemplate sqlSession, int userNo) {
		
		ArrayList<OnedayClass> list = new ArrayList<OnedayClass>();
		// return (ArrayList)sqlSession.selectList("onedayclassMapper.selectOnedayClass", userNo);
		return list;
	}
	
}
