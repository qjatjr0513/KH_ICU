package com.kh.icu.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.model.vo.Alarm;
import com.kh.icu.common.model.vo.Reply;

@Repository
public class BoardDao {
	
	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null ,  rowBounds);
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
	
	public Board selectBoard(SqlSession sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}
	
	public int insertBoard(SqlSession sqlSession, Board b) {
		int result = sqlSession.insert("boardMapper.insertBoard", b);
		if(result > 0) {
			result = b.getBoardNo();
		}
		return result;
	}
	
	public int updateBoard(SqlSession sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.updateBoard", b);
	}
	
	public int increaseCount(SqlSession sqlSession, int bno) {
		
		return sqlSession.update("boardMapper.increaseCount", bno);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", bno);
	}
	
	public int insertReply(SqlSession sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	public int deleteBoard(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	public int deleteReply(SqlSession sqlSession, int rno) {
		return sqlSession.update("boardMapper.deleteReply", rno);
	}
	
	public int insertBoardAlarm(SqlSession sqlSession, Alarm a) {
		return sqlSession.insert("boardMapper.insertBoardAlarm", a);
	}
	
	
	
}
