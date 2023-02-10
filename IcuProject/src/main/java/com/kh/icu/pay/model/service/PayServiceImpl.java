package com.kh.icu.pay.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.template.Pagination;
import com.kh.icu.pay.model.dao.PayDao;
import com.kh.icu.pay.model.vo.Deposit;
import com.kh.icu.pay.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Pagination pagination;
	
	// 파티 결제
	@Override
	public int accountOfPayment(Pay p) {
		return payDao.accountOfPayment(sqlSession, p);
	}
	
	@Override
	public int selectPayManageListCount() {
		return payDao.selectPayManageListCount(sqlSession);
	}
	
	// 관리자페이지 결제 내역
	@Override
	public Map<String, Object> selectPayManageList(int currentPage){
		
		Map<String, Object> map = new HashMap();
		
		// 1. 페이징처리
		int listCount = selectPayManageListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Pay> list = payDao.selectPayManageList(sqlSession, pi);
		map.put("list", list);
		
		return map;
	}
	
	@Override
	public int remitConfirm(int payNo) {
		return payDao.remitConfirm(sqlSession, payNo);
	}
	
	@Override
	public int insertRemit(Deposit de) {
		return payDao.insertRemit(sqlSession, de);
	}
	
	@Override
	public int selectMyPayListCount(Pay p) {
		return payDao.selectMyPayListCount(sqlSession, p);
	}
	
	// 관리자페이지 결제 내역
	@Override
	public Map<String, Object> selectMyPayList(int currentPage, Pay p){
		
		Map<String, Object> map = new HashMap();
		
		// 1. 페이징처리
		int listCount = selectMyPayListCount(p);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Pay> list = payDao.selectMyPayList(sqlSession, pi, p);
		map.put("list", list);
		
		return map;
	}
	
	
}
