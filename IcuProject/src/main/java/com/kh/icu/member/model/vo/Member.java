package com.kh.icu.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {

	private int memNo;
	private String tableCd;
	private String memId;
	private String memPwd;
	private String memNickname;
	private String memName;
	private String phone;
	private String birthday;
	private Date enrollDate;
	private Date modifyDate;
	private String role;
	private String status;
	private String bStates;
}
