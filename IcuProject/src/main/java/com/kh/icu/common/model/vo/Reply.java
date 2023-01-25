package com.kh.icu.common.model.vo;

import java.sql.Date;

import com.kh.icu.member.model.vo.Member;

import lombok.Data;

@Data
public class Reply {
	private int replyNo;
	private String tableCd;
	private String replyWriter;
	private int refTno;
	private String replyContent;
	private Date createDate;
	private String status;
	private Member member;
}
