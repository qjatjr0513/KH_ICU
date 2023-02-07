package com.kh.icu.chat.model.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatMessage {
	
	private int cmNo;
	private int memNo;
	private int chatRoomNo;
	private String message;
	private Timestamp createDate;
	private String memNickname;
	

}
