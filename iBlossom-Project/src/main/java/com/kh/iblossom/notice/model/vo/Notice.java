package com.kh.iblossom.notice.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
}
