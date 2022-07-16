package com.kh.iblossom.notice.model.service;

import java.util.ArrayList;

import com.kh.iblossom.notice.model.vo.Notice;

public interface NoticeService {
	
	ArrayList<Notice> selectList();

	ArrayList<Notice> selectAdminList();

	int insertNotice(Notice n);

	Notice selectAdminNotice(int noticeNo);

	int updateNotice(Notice n);

	int deleteNotice(int noticeNo);

	int selectListCount();

}
