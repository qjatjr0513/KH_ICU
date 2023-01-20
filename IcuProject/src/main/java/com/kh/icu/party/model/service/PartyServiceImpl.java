package com.kh.icu.party.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.party.model.dao.PartyDao;
import com.kh.icu.party.model.vo.Party;


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

	@Override
	public int insertParty(Party p) {
		System.out.println("dao");
		int result = partyDao.insertParty(sqlSession, p);
		System.out.println("dao result : " + result);
		return result;
	}
	
	@Override
	public List<Object> findPartyForm() {
		return partyDao.findPartyForm(sqlSession);
	};
	
}
