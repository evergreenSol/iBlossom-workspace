package com.kh.iblossom.order.model.vo;

import lombok.Data;

@Data
public class DetailOrder {

	private int dorderNo; // DORDER_NO NUMBER PRIMARY KEY,
	private int orderNo; // ORDER_NO NUMBER NOT NULL,
	private int productNo; // PRODUCT_NO NUMBER NOT NULL,  		
	private int onePrice; // ONE_PRICE NUMBER NOT NULL,
	private int oneQuantity; // ONE_QUANTITY NUMBER NOT NULL,

}
