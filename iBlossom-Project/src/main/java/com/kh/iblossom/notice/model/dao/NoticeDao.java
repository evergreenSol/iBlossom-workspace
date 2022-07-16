package com.kh.iblossom.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}

	public ArrayList<Notice> selectAdminList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectAdminList");
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public Notice selectAdminNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectAdminNotice", noticeNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.delete("noticeMapper.deleteNotice", noticeNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

}
