package com.kh.iblossom.member.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
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
	private String enrollDate;
	private String status;
	private int purchase;
	private String grLevel;
	
}
