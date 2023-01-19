package com.kh.icu.content.model.service;

import java.util.ArrayList;

import com.kh.icu.content.model.vo.Coment;
import com.kh.icu.content.model.vo.Content;

public interface ContentService {
	//public Map<String, Object> selectList();
	public ArrayList<Content> selectList();
	public Content selectContent(int conNo);
	public ArrayList<String> selectGenre(int conNo);
	public ArrayList<Coment> selectReview(int conNo);
}