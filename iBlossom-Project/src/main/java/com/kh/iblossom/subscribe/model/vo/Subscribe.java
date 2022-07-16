package com.kh.iblossom.subscribe.model.vo;

import java.util.Date;

import lombok.Data;

//정기구독 VO 
@Data
public class Subscribe {
	
	private int subscribeNo; // 구독번호
	private int subProductNo; // 구독한 상품 번호
	private int userNo; // 구독한 회원 번호
	private int subLevel; // 구독 기간 -> 1이면 정기구독
	private String subReceiverUser; // 수신인
	private String subReceiverPhone; // 수인인 전화번호
	private int subReceiverPostcode; // 수신인 우편번호
	//private Date deliverAt; // 배송일
	private String deliverAt;
	private String deliverTo; // 배송지
	private String deliverStatus; // 배송 상태
	private String receiptId; // 영수증 ID
	private String subDate; // 구독일
	private String userName; // 구독한 회원 이름
	private String userId; // 구독한 회원 ID
	private String grLevel; // 구독한 회원 등급
	private String subProductName; // 구독한 상품명
	private int subPrice; // 구독한 상품 가격
	private int count; // count
	private String subChangeName; // 구독한 상품 업로드된 사진 수정명
}
