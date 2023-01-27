package com.kh.icu.party.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Party {
	private int paNo;
	private int paName;
	private String tableCd;
	private String ottName;
	private int ottNo;
	private String paTitle;
	private int crewNum;
	private String ottId;
	private String ottPwd;
	private Date startDate;
	private Date endDate;
	private int dayPrice;
	private int account;
	private int status;
	private int leftDate;
	private int joinNum;
	private int totalPrice;
	private String memNickname;
}
