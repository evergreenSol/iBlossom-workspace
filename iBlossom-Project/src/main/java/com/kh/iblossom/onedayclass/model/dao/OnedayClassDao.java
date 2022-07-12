package com.kh.iblossom.onedayclass.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;


@Repository
public class OnedayClassDao {

	public int insertClassRes(SqlSessionTemplate sqlSession, OnedayClassAdmin oa) {
		
		return sqlSession.insert("onedayclassMapper.insertClassRes", oa);
	}


	
}
