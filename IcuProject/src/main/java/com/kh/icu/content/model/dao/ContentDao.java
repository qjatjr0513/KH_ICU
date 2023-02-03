package com.kh.icu.content.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.content.model.vo.Coment;
import com.kh.icu.content.model.vo.Content;

@Repository
public class ContentDao {
	
	public ArrayList<Content> selectList(SqlSession sqlSession){
		ArrayList<Content> list = (ArrayList)sqlSession.selectList("contentMapper.selectList");
		return list;
	}
	
	public Content selectContent(SqlSession sqlSession, int conNo) {
		return sqlSession.selectOne("contentMapper.selectContent", conNo);
	}
	
	public ArrayList<String> selectGenre(SqlSession sqlSession, int conNo){
		return (ArrayList)sqlSession.selectList("contentMapper.selectGenre", conNo);
	}
	
	public ArrayList<String> selectOtt(SqlSession sqlSession, int conNo){
		return (ArrayList)sqlSession.selectList("contentMapper.selectOtt", conNo);
	}
	
	public ArrayList<Coment> selectReview(SqlSession sqlSession, int conNo){
		return (ArrayList)sqlSession.selectList("contentMapper.selectReview", conNo);
	}
	
	public int insertReview(SqlSession sqlSession, Coment c) {
		return sqlSession.insert("contentMapper.insertReview", c);
	}
	
	public double selectStar(SqlSession sqlSession, int conNo) {
		return sqlSession.selectOne("contentMapper.selectStar", conNo);
	}
	
	public ArrayList<Content> searchContentCategory(SqlSession sqlSession, Map<String, ArrayList<String>> map){
		return (ArrayList)sqlSession.selectList("contentMapper.selectContentCategory", map);
	}
	
	public ArrayList<Content> searchContentTwoCategory(SqlSession sqlSession, ArrayList<String> category1, ArrayList<String> category2){
		Map<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		map.put("category1", category1);
		map.put("category2", category2);
		
		return (ArrayList)sqlSession.selectList("contentMapper.selectContentTwoCategory"); 
	}
	
	public int insertContent(SqlSession sqlSession, Content c) {
		return sqlSession.insert("contentMapper.insertContent", c);
	}
	
	public int updateContent(SqlSession sqlSession, Content c) {
		return sqlSession.update("contentMapper.updateContent", c);
	}
	
	public int insertGenre(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.insert("contentMapper.insertGenre", map);
	}
	
	public int insertOtt(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.insert("contentMapper.insertOtt", map);
	}
	
	public int deleteGenre(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.delete("contentMapper.deleteGenre", map);
	}
	
	public int deleteOtt(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.delete("contentMapper.deleteOtt", map);
	}
	
	public int insertImg(SqlSession sqlSession, Image image) {
		return sqlSession.insert("contentMapper.insertImg", image);
	}
	
	public int updateImg(SqlSession sqlSession, Image image) {
		return sqlSession.update("contentMapper.updateImg", image);
	}
	
	public int selectConNo(SqlSession sqlSession) {
		return sqlSession.selectOne("contentMapper.selectConNo");
	}
	
	public int deleteContent(SqlSession sqlSession, int conNo) {
		return sqlSession.update("contentMapper.deleteContent", conNo);
	}
	
	public ArrayList<Content> recommendContents(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("contentMapper.recommendContents");
	}
	
	public ArrayList<Content> searchByKeyword(SqlSession sqlSession, Map<String, Object> map){
		return (ArrayList) sqlSession.selectList("contentMapper.searchByKeyword", map);
	}
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("contentMapper.selectListCount");
	}
	
	public ArrayList<Content> getWrittenContent(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("contentMapper.getWrittenContent", null ,  rowBounds);
	}
	
	public ArrayList<String> getWrittenContentOtt(SqlSession sqlSession, int conNo){
		return (ArrayList)sqlSession.selectList("contentMapper.getWrittenContentOtt", conNo);
	}
}