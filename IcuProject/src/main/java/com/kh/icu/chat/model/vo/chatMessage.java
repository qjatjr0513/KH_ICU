package com.kh.icu.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class chatMessage {
	
	private int cmNo;
	private int cmWriter;
	private int chatNo;
	private String message;
	private Date createDate;
	

}
