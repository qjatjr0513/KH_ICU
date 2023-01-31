package com.kh.icu.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.common.model.vo.Reply;
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
	
	// 파티 찾기 (리스트 & 검색)
	@Override
	public List<Party> findParty(HashMap<String, Object> map){
		return partyDao.findParty(sqlSession, map);
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
	
	// 댓글 불러오기 (리스트)
	@Override
	public ArrayList<Reply> selectReplyList(int paNo) {
		return partyDao.selectReplyList(sqlSession, paNo);
	}

	// 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return partyDao.insertReply(sqlSession, r);
	}
	
	@Override
	public List<Party> partyList(){
		return partyDao.partyList(sqlSession);
	}

	// 댓글 삭제 
	@Override
	public int deleteReply(int rno) {
		return partyDao.deleteReply(sqlSession, rno);
	}
	
	@Override
	public int endParty(int paNo) {
		return partyDao.endParty(sqlSession, paNo);
	}
	
	
}
