package com.kh.icu.pay.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Pay {
	private int payNo;
	private int paNo;
	private int payMemNo;
	private String payment;
	private int price;
	private Date payDate;
	private String remitStatus;
	
	private int paName;
	private String memName;
	private String memNickName;
	private String paMemNickName;
	private String ottName;
	private String account;
	private String paTitle;
}
