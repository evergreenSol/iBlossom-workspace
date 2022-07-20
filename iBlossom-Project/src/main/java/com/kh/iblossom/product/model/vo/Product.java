package com.kh.iblossom.product.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {
	
	//필드부
	private int productNo;			//PRODUCT_NO
	private String categoryName;	//	CATEGORY_NAME
    private String flowerName;		//	FLOWER_NAME
	private int price;				//	PRICE
	private String thumbNail;		//	THUMBNAIL
    private String contentPhoto;	//	CONTENT_PHOTO
	private String flowerInfo;		//	FLOWER_INFO
	private Date enrollDate;	   	//	ENROLL_DATE
	private String tag;				//	TAG
	private String status;			//	STATUS
	
}
