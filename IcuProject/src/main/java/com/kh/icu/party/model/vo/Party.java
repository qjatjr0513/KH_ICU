package com.kh.icu.party.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Party {
	private int paNo;
	private int paName;
	private String tableCd;
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
}
