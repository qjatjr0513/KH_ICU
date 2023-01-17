package com.kh.icu.content.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Content {
	private int conNo;
	private String tableCd;
	private String conKTitle;
	private String conETitle;
	private String conCategory;
	private String conDate;
	private String conAge;
	private String conInfo;
	private String conPreview;
	private String conDirector;
	private String conActor;
	private String conSynop;
	private Date enrollDate;
	private String status;
}
