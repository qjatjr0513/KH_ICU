package com.kh.icu.content.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
}