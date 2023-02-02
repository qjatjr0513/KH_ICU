package com.kh.icu.content.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Coment {
	private int cmtNo;
	private String cmtWriter;
	private int conNo;
	private String cmtContent;
	private int cmtStar;
	private Date createDate;
	private String status;
	private String memNickname;
	private String changeName;
	private String filePath;
}
