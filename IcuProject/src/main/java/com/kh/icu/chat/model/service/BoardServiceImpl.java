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
	
}
