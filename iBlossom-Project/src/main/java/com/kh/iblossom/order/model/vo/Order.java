package com.kh.iblossom.order.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {

	private int orderNo; // ORDER_NO NUMBER PRIMARY KEY,
	private int userNo; // USER_NO NUMBER NOT NULL,
	private int totalPrice; // TOTAL_PRICE NUMBER NOT NULL,
	private Date orderDate; // ORDER_DATE DATE DEFAULT SYSDATE,
	private Date receiveDate; // RECEIVE_DATE DATE DEFAULT SYSDATE,
	private String receiveUser; // RECEIVE_USER VARCHAR2(20) NOT NULL,		
	private String receivePhone; // RECEIVE_PHONE VARCHAR2(13) NOT NULL,	
	private String orderAddress; // ORDER_ADDRESS VARCHAR2(300) NOT NULL,
	private int postcode; // POSTCODE NUMBER NOT NULL,
	private String orderStatus; // ORDER_STATUS VARCHAR2(30) NOT NULL,		
	private String deliveryStatus; // DELIVERY_STATUS VARCHAR2(12) NOT NULL,		
	private String receiptId; // RECEIPT_ID VARCHAR2(32) NOT NULL,
}
