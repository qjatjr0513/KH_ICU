package com.kh.icu.common.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	private int replyNo;
	private String tableCode;
	private int replyWriter;
	private int refTno;
	private String replyContent;
	private Date createDate;
	private String status;
}
