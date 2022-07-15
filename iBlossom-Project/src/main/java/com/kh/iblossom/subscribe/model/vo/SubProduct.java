package com.kh.iblossom.subscribe.model.vo;

import lombok.Data;

// 정기구독 상품 VO 
@Data
public class SubProduct {
	private int subProductNo; // 구독 상품 번호
	private String subProductName; // 구독 상품 이름
	private int subPrice; // 구독 상품 가격
	private String subProductDescription; // 구독 상품 상세 설명 혹은 캐치문구
	private String subOriginName; // 사진 업로드용 원본명
	private String subChangeName; // 사진 업로드용 수정명
}
