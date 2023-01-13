package com.kh.icu.coment.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Coment {
	private int cmtNo;
	private int cmtWriter;
	private int conNo;
	private String cmtContent;
	private int cmtStar;
	private Date createDate;
	private String status;
}
