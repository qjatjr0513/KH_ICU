package com.kh.icu.content.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.icu.content.model.dao.ContentDao;
import com.kh.icu.content.model.vo.Content;

@Service
public class ContentServiceImpl implements ContentService{
	private ContentDao contentDao;
	
	private SqlSession sqlSession;
	
	public ContentServiceImpl(ContentDao contentDao, SqlSession sqlSession) {
		this.contentDao = contentDao;
		this.sqlSession = sqlSession;
	}
	
//	@Override
//	public Map<String, Object> selectList(){
//		ArrayList<Content> list = contentDao.selectList(sqlSession);
//		Map<String, Object> map = new HashMap();
//		
//		map.put("list", list);
//		return map;
//	}
	
	@Override
	public ArrayList<Content> selectList() {
		ArrayList<Content> list = contentDao.selectList(sqlSession);
		return list;
	}
	
	@Override
	public Content selectContent(int conNo) {
		Content c = contentDao.selectContent(sqlSession, conNo);
		return c;
	}
}