package com.kh.icu.board.model.service;

import java.util.Map;

import com.kh.icu.board.model.vo.Board;

public interface BoardService {
	
	public Map<String, Object> selectList(int currentPage);
	
	public int selectListCount();
	
	public Map<String, Object> searchSelectList(Map<String, Object> paramMap);
	
	public int selectSearchListCount(Map<String,Object> paramMap);
	
	public Board selectBoard(int bno);
	
	public int insertBoard(Board b);
	
	public int updateBoard(Board b);
	
	public int increaseCount(int bno);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
