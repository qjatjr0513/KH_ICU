package com.kh.icu.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.template.Pagination;
import com.kh.icu.faq.model.dao.FaqDao;
import com.kh.icu.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDao faqDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Pagination pagination;
	
	@Override
	public Map<String, Object> selectList(int currentPage){
		Map<String, Object> map = new HashMap();
		
		// 1. 페이징처리
		int listCount = selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
					
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Faq> list = faqDao.selectList(sqlSession, pi);
		map.put("list", list);
		
		return map;
	}
	
	@Override
	public int selectListCount() {
		return faqDao.selectListCount(sqlSession);
	}
	
	@Override
	public int insertFaq(Faq f) {
		return faqDao.insertFaq(sqlSession, f);
	}
	
	@Override
	public int updateFaq(Faq f) {
		return faqDao.updateFaq(sqlSession, f);
	}
	
	@Override
	public Faq selectFaq(int fno) {
		return faqDao.selectFaq(sqlSession, fno);
	}
	
	@Override
	public int deleteFaq(int fno) {
		return faqDao.deleteFaq(sqlSession, fno);
	}
}
