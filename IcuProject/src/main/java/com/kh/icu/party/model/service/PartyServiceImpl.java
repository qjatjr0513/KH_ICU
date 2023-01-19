package com.kh.icu.party.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.party.model.dao.PartyDao;


@Service
public class PartyServiceImpl implements PartyService{
	
	@Autowired
	private PartyDao partyDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	// ott가격 표시
	public int getPrice(String ottNo) {
		System.out.print(ottNo);
		return partyDao.getPrice(sqlSession, ottNo);
	};

}
