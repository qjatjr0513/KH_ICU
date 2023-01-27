package com.kh.icu.party.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PartyJoin {
	private int paNo;
	private String memNo;
	private String memNickname;
	private Date joinDate;
}
