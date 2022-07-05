package com.kh.iblossom.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.notice.model.vo.Notice;

// 이걸 뺴먹으시면 안돼요~
@Repository
public class NoticeDao {

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}

}
