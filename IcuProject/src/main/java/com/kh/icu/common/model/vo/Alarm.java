package com.kh.icu.common.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Alarm {
	private int mesNo;
	private int memNo;
	private String tableCd;
	private int sendMemNo;
	private String mesContent;
	private int refTno;
	private Date createDate;
	private String check;
}
