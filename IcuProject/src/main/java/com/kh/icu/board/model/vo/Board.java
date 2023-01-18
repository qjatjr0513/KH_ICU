package com.kh.icu.board.model.vo;

import java.sql.Date;

import com.kh.icu.member.model.vo.Member;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String tableCd;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private int count;
	private String status;
	
	private Member member;
	private int memNo;
	private String memNickname;
}
