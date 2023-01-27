package com.kh.icu.party.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.party.model.dao.PartyDao;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyJoin;


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
	
	// 파티 찾기
	@Override
	public List<Party> findPartyForm() {
		return partyDao.findPartyForm(sqlSession);
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
	public int joinPartyMember(PartyJoin pj) {
		return partyDao.joinPartyMember(sqlSession, pj);
	}
	
	
}
