package com.kh.icu.chat.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.icu.chat.model.dao.BoardDao;
import com.kh.icu.common.template.Pagination;

@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardDao boardDao;
	private SqlSession sqlSession;
	private Pagination pagination;
	
	public BoardServiceImpl(BoardDao boardDao, SqlSession sqlSession, Pagination pagination) {
		this.boardDao = boardDao;
		this.sqlSession = sqlSession;
		this.pagination = pagination;
	}
	
	
}
