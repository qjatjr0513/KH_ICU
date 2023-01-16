package com.kh.icu.chat.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.board.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", rowBounds);
	}
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> searchSelectList(SqlSession sqlSession, Map<String, Object> paramMap){
		
		int offset = (((PageInfo)paramMap.get("pi")).getCurrentPage() -1) *((PageInfo)paramMap.get("pi")).getBoardLimit();
		int limit = ((PageInfo)paramMap.get("pi")).getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchSelectList", paramMap, rowBounds);
	}
	
	public int selectSearchListCount(SqlSession sqlSession,Map<String,Object> paramMap) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount");
	}
	
	
}
