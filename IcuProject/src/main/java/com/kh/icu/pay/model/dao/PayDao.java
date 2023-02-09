package com.kh.icu.pay.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.pay.model.vo.Deposit;
import com.kh.icu.pay.model.vo.Pay;

@Repository
public class PayDao {
	
	// 파티 결제
	public int accountOfPayment(SqlSession sqlSession, Pay p) {
		return sqlSession.insert("payMapper.accountOfPayment", p);
	}
		
	public int selectPayManageListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("payMapper.selectPayManageListCount");
	}
	
	public ArrayList<Pay> selectPayManageList(SqlSession sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("payMapper.selectPayManageList", null ,  rowBounds);
	}
	
	public int remitConfirm(SqlSession sqlSession, int payNo) {
		return sqlSession.update("payMapper.remitConfirm", payNo);
	}
	
	public int insertRemit(SqlSession sqlSession, Deposit de) {
		return sqlSession.update("payMapper.insertRemit", de);
	}
	
	public int selectMyPayListCount(SqlSession sqlSession, Pay p) {
		return sqlSession.selectOne("payMapper.selectMyPayListCount", p);
	}
	
	public ArrayList<Pay> selectMyPayList(SqlSession sqlSession, PageInfo pi, Pay p){
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("payMapper.selectMyPayList", p ,  rowBounds);
	}
}
