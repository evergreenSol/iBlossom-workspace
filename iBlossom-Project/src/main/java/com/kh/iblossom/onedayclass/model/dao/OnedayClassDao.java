package com.kh.iblossom.onedayclass.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;


@Repository
public class OnedayClassDao {

	public int insertClassRes(SqlSessionTemplate sqlSession, OnedayClassAdmin oa) {
		
		return sqlSession.insert("onedayclassMapper.insertClassRes", oa);
	}

	public ArrayList<OnedayClass> selectClassList(SqlSessionTemplate sqlSession) {
		
		 return (ArrayList)sqlSession.selectList("onedayclassMapper.selectClassList"); 
	}
	
	public OnedayClass selectOnedayClass(SqlSessionTemplate sqlSession, int classNo) {
		
		return sqlSession.selectOne("onedayclassMapper.selectOnedayClass", classNo);
	}

	public int updateClassCap(SqlSessionTemplate sqlSession, int classNo) {
		
		return sqlSession.update("onedayclassMapper.updateClassCap", classNo);
	}
}
