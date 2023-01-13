package com.kh.icu.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SnsLogin {
	private int memNo;
	private String snsId;
	private String snsType;
	private String snsProfile;
	private Date snsConnectDate;
	private String status;
}
