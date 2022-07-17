package com.kh.iblossom.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.notice.model.dao.NoticeDao;
import com.kh.iblossom.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Notice> selectList() {
		
		return noticeDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectAdminList() {
		
		return noticeDao.selectAdminList(sqlSession);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectAdminNotice(int noticeNo) {
	
		return noticeDao.selectAdminNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}

}
