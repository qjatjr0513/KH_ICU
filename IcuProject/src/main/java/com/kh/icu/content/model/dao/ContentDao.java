package com.kh.icu.content.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
	public int insertGenre(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.insert("contentMapper.insertGenre", map);
	}
	
	public int insertOtt(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.insert("contentMapper.insertOtt", map);
	}
	
	public int insertImg(SqlSession sqlSession, Image image) {
		return sqlSession.insert("contentMapper.insertImg", image);
	}
	
	public int selectConNo(SqlSession sqlSession) {
		return sqlSession.selectOne("contentMapper.selectConNo");
	}

}