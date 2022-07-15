package com.kh.iblossom.onedayclass.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.onedayclass.model.dao.OnedayClassDao;
import com.kh.iblossom.onedayclass.model.vo.OnedayClass;
import com.kh.iblossom.onedayclass.model.vo.OnedayClassAdmin;

@Service
public class OnedayClassServiceImpl implements OnedayClassService {

	@Autowired
	private OnedayClassDao onedayClassDao;	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertClassRes(OnedayClassAdmin oa) {
		
		return onedayClassDao.insertClassRes(sqlSession, oa);
	}

	@Override
	public ArrayList<OnedayClass> selectClassList() {

		return onedayClassDao.selectClassList(sqlSession);
	}

	@Override
	public OnedayClass selectOnedayClass(int classNo) {
		
		return onedayClassDao.selectOnedayClass(sqlSession, classNo);
	}

	@Override
	public int updateClassCap(int classNo) {
		
		return onedayClassDao.updateClassCap(sqlSession, classNo);
	}

	@Override
	public ArrayList<OnedayClass> selectAdminList() {
		
		return onedayClassDao.selectAdminList(sqlSession);
	}

	@Override
	public ArrayList<OnedayClassAdmin> selectResList(int classNo) {

		return onedayClassDao.selectResList(sqlSession, classNo);
	}

	@Override
	public int deleteClass(int classNo) {
		
		return onedayClassDao.deleteClass(sqlSession, classNo);
	}

	@Override
	public int insertClass(OnedayClass o) {
		
		return onedayClassDao.insertClass(sqlSession, o);
	}

//	@Override
//	public OnedayClassAdmin selectClassRes(int classNo) {
//		
//		return onedayClassDao.selectClassRes(sqlSession, classNo);
//	}
	


}
