package com.kh.icu.content.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.icu.common.model.vo.Image;
import com.kh.icu.content.model.vo.Coment;
import com.kh.icu.content.model.vo.Content;

public interface ContentService {
	//public Map<String, Object> selectList();
	public ArrayList<Content> selectList();
	public Content selectContent(int conNo);
	public ArrayList<String> selectGenre(int conNo);
	public ArrayList<Coment> selectReview(int conNo);
	public int insertReview(Coment c);
	public double selectStar(int conNo);
	public ArrayList<Content> searchContentCategory(Map<String, ArrayList<String>> map);
	public int insertContent(Content c);
	public int insertGenre(Map<String, Object> map);
	public int insertOtt(Map<String, Object> map);
	public int insertImg(Image image);
	public int selectConNo(String conKTitle);
}