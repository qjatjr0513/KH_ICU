package com.kh.icu.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.faq.model.vo.Faq;

@Repository
public class FaqDao {

	public ArrayList<Faq> selectList(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("faqMapper.selectList", rowBounds);
	}
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("faqMapper.selectListCount");
	}
	
	public int insertFaq(SqlSession sqlSession, Faq f) {
		return sqlSession.insert("faqMapper.insertFaq", f);
	}
	
	public int updateFaq(SqlSession sqlSession, Faq f) {
		return sqlSession.update("faqMapper.updateFaq", f);
	}
}
