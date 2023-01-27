package com.kh.icu.party.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyJoin;

@Repository
public class PartyDao {
	
	// ott가격 표시
	public int getPrice(SqlSession sqlSession, String ottNo) {
		return sqlSession.selectOne("partyMapper.getPrice", ottNo);
	}
	
	// 파티 만들기
	public int insertParty(SqlSession sqlSession, Party p) {
		return sqlSession.insert("partyMapper.insertParty", p);
	}

	// 파티 찾기
	public List<Party> findPartyForm(SqlSession sqlSession) {
		return sqlSession.selectList("partyMapper.findPartyForm");
	}
	
	// 파티 디테일
	public Party partyDetailForm(SqlSession sqlSession, int paNo) {
		return sqlSession.selectOne("partyMapper.partyDetailForm", paNo);
	}
	
	// 참여인원 조회
	public List<PartyJoin> partyJoinMem(SqlSession sqlSession, int paNo) {
		return sqlSession.selectList("partyMapper.partyJoinMem", paNo);
	}
	
	// 파티 참여하기 
	public int joinPartyMember (SqlSession sqlSession, PartyJoin pj) {
		return sqlSession.insert("partyMapper.joinPartyMember", pj);
		
	}
	
	
	
}
