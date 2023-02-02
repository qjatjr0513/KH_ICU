package com.kh.icu.party.model.vo;

import java.sql.Date;
import java.util.List;

import com.kh.icu.ott.model.vo.Ott;

import lombok.Data;

@Data
public class Party {
	private int paNo;
	private int paName;
	private String tableCd;
	private String ottName;
	private int ottNo;
	private String paTitle;
	private int crewNum;
	private String ottId;
	private String ottPwd;
	private Date startDate;
	private Date endDate;
	private int dayPrice;
	private Long account;
	private int status;
	private int leftDate;
	private int joinNum;
	private int totalPrice;
	private String memNickname;
	private int memNo;
	private List<Ott> ott;
	private String month;
	private String changeName;
	private String filePath;
	private int likeCount;
	private int badCount;
	
}
