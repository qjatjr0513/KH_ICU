package com.kh.icu.chat.model.service;

import java.util.Map;

public interface BoardService {
	
	public Map<String, Object> selectList(int currentPage);
	
	public int selectListCount();
	
	public Map<String, Object> searchSelectList(Map<String, Object> paramMap);
	
	public int selectSearchListCount(Map<String,Object> paramMap);
}
