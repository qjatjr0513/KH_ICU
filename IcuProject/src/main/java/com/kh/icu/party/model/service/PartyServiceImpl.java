package com.kh.icu.party.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.ott.model.vo.Ott;
import com.kh.icu.party.model.dao.PartyDao;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.vo.Pay;


@Service
public class PartyServiceImpl implements PartyService{
	
	@Autowired
	private PartyDao partyDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	// ott가격 표시
	public int getPrice(String ottNo) {
		return partyDao.getPrice(sqlSession, ottNo);
	};

	// 파티 만들기
	@Override
	public int insertParty(Party p) {
		return partyDao.insertParty(sqlSession, p);
	}
	
	// 파티 찾기 (리스트)
	@Override
	public List<Party> findPartyForm() {
		return partyDao.findPartyForm(sqlSession);
	};
	
	// 파티 검색 (리스트)
	@Override
	public List<Party> searchParty(HashMap<String, Object> map){
		return partyDao.searchParty(sqlSession, map);
	};
	
	// 파티 디테일
	@Override
	public Party partyDetailForm(int paNo){
		return partyDao.partyDetailForm(sqlSession, paNo);
	};
	
	// 파티 참여인원(정보)
	@Override
	public List<PartyJoin> partyJoinMem(int paNo){
		return partyDao.partyJoinMem(sqlSession, paNo);
	};
	
	// 파티 참여하기
	@Override
	public int joinPartyMember(PartyJoin pj) {
		return partyDao.joinPartyMember(sqlSession, pj);
	}
	
	
	
	
}
