package com.kh.iblossom.qna.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Qna {
	
//	QNA_NO NUMBER PRIMARY KEY,
//    QNA_TITLE VARCHAR2(90) NOT NULL,
//    QNA_CONTENT VARCHAR2(3000) NOT NULL,
//    QNA_DATE DATE DEFAULT SYSDATE NOT NULL,
//    ANSWER VARCHAR2(3000),
//    ANSWER_DATE DATE DEFAULT SYSDATE,
//    ANSWER_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (ANSWER_STATUS IN ('Y', 'N')),
//    USER_NO NUMBER NOT NULL,
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String answer;
	private Date answerDate;
	private String answerStatus;
	private int userNo;
}
