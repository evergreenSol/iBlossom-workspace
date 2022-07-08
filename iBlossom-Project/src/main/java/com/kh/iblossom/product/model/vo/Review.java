package com.kh.iblossom.product.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {

private int reviewNo;			//	REVIEW_NO
private String reviewTitle;		//	REVIEW_TITLE
private String reviewContent;	//	REVIEW_CONTENT
private String reviewPhoto;		//	REVIEW_PHOTO
private Date createDate;		//	CREATE_DATE
private String reviewStatus;	//	REVIEW_STATUS
private int orderNo;			//	ORDER_NO
private int userNo;				//	USER_NO
private int productNo;		//	PRODUCT_NO
}
