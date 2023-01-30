package com.kh.icu.content.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.icu.common.model.vo.Image;
import com.kh.icu.content.model.dao.ContentDao;
import com.kh.icu.content.model.vo.Coment;
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
	
	@Override
	public ArrayList<String> selectGenre(int conNo) {
		ArrayList<String> list = contentDao.selectGenre(sqlSession, conNo);
		return list;
	}
	
	@Override
	public ArrayList<Coment> selectReview(int conNo){
		ArrayList<Coment> list = contentDao.selectReview(sqlSession, conNo);
		return list;
	}
	
	@Override
	public int insertReview(Coment c) {
		return contentDao.insertReview(sqlSession, c);
	}
	
	@Override
	public double selectStar(int conNo) {
		return contentDao.selectStar(sqlSession, conNo);
	}
	
	@Override
	public ArrayList<Content> searchContentCategory(Map<String, ArrayList<String>> map){
		ArrayList<Content> list = contentDao.searchContentCategory(sqlSession, map);
		return list;
	}
	
	@Override
	public int insertContent(Content c) {
		return contentDao.insertContent(sqlSession, c);
	}
	
	@Override
	public int insertGenre(Map<String, Object> map) {
		return contentDao.insertGenre(sqlSession, map);
	}
	
	@Override
	public int insertOtt(Map<String, Object> map) {
		return contentDao.insertOtt(sqlSession, map);
	}
	
	@Override
	public int insertImg(Image image) {
		return contentDao.insertImg(sqlSession, image);
	}
	
	@Override
	public int selectConNo() {
		return contentDao.selectConNo(sqlSession);
	}

}