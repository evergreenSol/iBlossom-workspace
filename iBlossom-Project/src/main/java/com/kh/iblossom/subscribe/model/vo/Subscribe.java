package com.kh.iblossom.subscribe.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Subscribe {
	
	private int subscribeNo;
	private int subProductNo;
	private int userNo;
	private int subLevel;
	private String subReceiverUser;
	private String subReceiverPhone;
	private Date deliverAt;
	private String deliverTo;
	private String deliverStatus;
	private String receiptId;
	private Date subDate;
}
