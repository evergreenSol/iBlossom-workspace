package com.kh.iblossom.onedayclass.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class OnedayClassAdmin {
	
//    RES_NO NUMBER PRIMARY KEY,
//    CLASS_NO NUMBER NOT NULL,
//    RES_NAME VARCHAR2(20) NOT NULL,
//    RES_PHONE VARCHAR2(13),
//    RES_EMAIL VARCHAR2(30) NOT NULL,
//    PAY_DATE DATE DEFAULT SYSDATE,
	
	private int resNo;
	private int classNo;
	private String resName;
	private String resPhone;
	private String resEmail;
	private Date payDate;
	private int userNo;
}
