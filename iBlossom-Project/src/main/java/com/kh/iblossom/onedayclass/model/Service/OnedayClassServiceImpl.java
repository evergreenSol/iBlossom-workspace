package com.kh.iblossom.onedayclass.model.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.cart.model.dao.CartDao;
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
	


}
