package com.kh.iblossom.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String email;
	private String address1;
	private String address2;
	private String address;
	private String postcode;
	private Date enrollDate;
	private String status;
	private int purchase;
	private String grLevel;
	
}
