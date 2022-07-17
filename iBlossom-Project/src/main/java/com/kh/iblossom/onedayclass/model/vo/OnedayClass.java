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
public class OnedayClass {
	
//    CLASS_NO NUMBER PRIMARY KEY,
//    CLASS_NAME VARCHAR2(90) NOT NULL,
//    PRICE NUMBER NOT NULL,
//    CLASS_DATE VARCHAR2(90) NOT NULL,
//    CAP_NO NUMBER NOT NULL, 정원
//    RES_NUM NUMBER NOT NULL, 신청인원
//    CLASS_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (CLASS_STATUS IN ('Y', 'N'))
	
	private int classNo;
	private String className;
	private int price;
	private Date classDate;
	private int capNo;
	private int resNum;
	private String classStatus;
	
}
