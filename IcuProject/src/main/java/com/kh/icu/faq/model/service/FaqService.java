package com.kh.icu.faq.model.service;

import java.util.Map;

import com.kh.icu.faq.model.vo.Faq;

public interface FaqService {

	public Map<String, Object> selectList(int currentPage);
	
	public int selectListCount();
	
	public int insertFaq(Faq f);
	
	public int updateFaq(Faq f);
	
	
}
