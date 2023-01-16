package com.kh.icu.content.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {
	private int cmtNo;
	private int cmtWriter;
	private int conNo;
	private String cmtContent;
	private int cmtStar;
	private Date createDate;
	private String status;
}
