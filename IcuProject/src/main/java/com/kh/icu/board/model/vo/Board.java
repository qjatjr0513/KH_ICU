package com.kh.icu.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String tableCD;
	private int boardWriter;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private int count;
	private String status;
}