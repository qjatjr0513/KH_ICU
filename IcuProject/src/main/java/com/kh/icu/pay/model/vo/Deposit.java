package com.kh.icu.pay.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Deposit {
	private int depNo;
	private int paNo;
	private int recNo;
	private int sendNo;
	private int depPrice;
	private Date depDate;
	private String paTitle;
	private String memNickname;
	private String ottName;
}
