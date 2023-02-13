package com.kh.icu.content.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.common.template.Pagination;
import com.kh.icu.content.model.dao.ContentDao;
import com.kh.icu.content.model.vo.Coment;
import com.kh.icu.content.model.vo.Content;

@Service
public class ContentServiceImpl implements ContentService{
	private ContentDao contentDao;
	private SqlSession sqlSession;
	private Pagination pagination;
	
	public ContentServiceImpl(ContentDao contentDao, SqlSession sqlSession, Pagination pagination) {
		this.contentDao = contentDao;
		this.sqlSession = sqlSession;
		this.pagination = pagination;
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
	public ArrayList<String> selectOtt(int conNo){
		ArrayList<String> list = contentDao.selectOtt(sqlSession, conNo);
		return list;
	}
	
	@Override
	public ArrayList<Coment> selectReview(int conNo){
		ArrayList<Coment> list = contentDao.selectReview(sqlSession, conNo);
		return list;
	}
	
	@Override
	public int insertReview(Coment c) {
		
		// 1) XSS, 개행문자처리
		c.setCmtContent(Utils.XSSHandling(c.getCmtContent()));
		c.setCmtContent(Utils.newLineHandling(c.getCmtContent()));
		
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
	public int updateContent(Content c) {
		return contentDao.updateContent(sqlSession, c);
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
	public int deleteGenre(Map<String, Object> map) {
		return contentDao.deleteGenre(sqlSession, map);
	}
	
	@Override
	public int deleteOtt(Map<String, Object> map) {
		return contentDao.deleteOtt(sqlSession, map);
	}
	
	@Override
	public int insertImg(Image image) {
		return contentDao.insertImg(sqlSession, image);
	}
	
	@Override
	public int updateImg(Image image) {
		return contentDao.updateImg(sqlSession, image);
	}
	
	@Override
	public int selectConNo() {
		return contentDao.selectConNo(sqlSession);
	}
	
	@Override
	public int deleteContent(int conNo) {
		return contentDao.deleteContent(sqlSession, conNo);
	}
	
	@Override
	public ArrayList<Content> recommendContents(){
		return contentDao.recommendContents(sqlSession);
	}

	@Override
	public ArrayList<Content> searchByKeyword(Map<String, Object> map){
		return contentDao.searchByKeyword(sqlSession, map);
	}
	
	@Override
	public int selectListCount() {
		return contentDao.selectListCount(sqlSession);
	}
	
	@Override
	public Map<String, Object> getWrittenContent(int currentPage){
		Map<String, Object> map = new HashMap();
		
		int listCount = selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
					
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Content> list = contentDao.getWrittenContent(sqlSession, pi);
		map.put("list", list);
		
		return map;
	}
	
	@Override
	public ArrayList<String> getWrittenContentOtt(int conNo){
		return contentDao.getWrittenContentOtt(sqlSession, conNo);
	}
	
	@Override
	public ArrayList<Content> autoSearch(Map<String, Object> map){
		ArrayList<Content> list = contentDao.autoSearch(sqlSession, map);
		return list;
	}
	
	@Override
	public int deleteReview(int cmtNo) {
		return contentDao.deleteReview(sqlSession, cmtNo);
	}
}