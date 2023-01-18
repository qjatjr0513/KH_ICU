package com.kh.icu.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.common.model.vo.Reply;

public interface BoardService {
	
	public Map<String, Object> selectList(int currentPage);
	
	public int selectListCount();
	
	public Map<String, Object> searchSelectList(Map<String, Object> paramMap);
	
	public int selectSearchListCount(Map<String,Object> paramMap);
	
	public Board selectBoard(int bno);
	
	public int insertBoard(Board b);
	
	public int updateBoard(Board b);
	
	public int increaseCount(int bno);
	
	public ArrayList<Reply> selectReplyList(int bno);
	
	public int insertReply(Reply r);
	
	public int deleteBoard(int boardNo);
	
	
	
	
	
	
	
	
	
	
	
}
