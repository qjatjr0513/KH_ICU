package com.kh.icu.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.party.model.dao.PartyDao;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyEvaluate;
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
		
		// 1) XSS, 개행문자처리
		p.setPaTitle(Utils.XSSHandling(p.getPaTitle()));
		
		return partyDao.insertParty(sqlSession, p);
	}
	
	// 파티 찾기 (리스트)
	@Override
	public List<Party> findPartyForm(){
		return partyDao.findPartyForm(sqlSession);
	};
	
	// 파티 찾기 (검색)
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
	
	@Override
	public List<PartyJoin> partyMem(int paNo){
		return partyDao.partyMem(sqlSession, paNo);
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
		
		// 1) XSS, 개행문자처리
		r.setReplyContent(Utils.XSSHandling(r.getReplyContent()));
		r.setReplyContent(Utils.newLineHandling(r.getReplyContent()));
		
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
	
	// 관리자페이지 - 진행중인 파티 
	@Override
	public List<Party> currentPartyList(){
		return partyDao.currentPartyList(sqlSession);
	};
	
	// 관리자페이지 - 종료된 파티 
	@Override
	public List<Party> endPartyList(){
		return partyDao.endPartyList(sqlSession);
	};
	
	// 마이페이지 - 진행중인 파티  - 내가 만든 파티
	@Override
	public List<Party> memCurrentPartyListI(int memNo){
		return partyDao.memCurrentPartyListI(sqlSession, memNo);
	};
	
	// 마이페이지 - 진행중인 파티  - 내가 참여한 파티
	@Override
	public List<Party> memCurrentPartyListO(int memNo){
		return partyDao.memCurrentPartyListO(sqlSession, memNo);
	};
	
	// 마이페이지 - 종료된 파티  - 내가 만든 파티
	@Override
	public List<Party> memEndPartyListI(int memNo){
		return partyDao.memEndPartyListI(sqlSession, memNo);	
	};
	
	// 마이페이지 - 종료된 파티  - 내가 참여한 파티
	@Override
	public List<Party> memEndPartyListO(int memNo){
		return partyDao.memEndPartyListO(sqlSession, memNo);
	};
	
	@Override
	public int checkPartyEvaluate(PartyEvaluate pe) {
		return partyDao.checkPartyEvaluate(sqlSession, pe);
	}
	
	@Override
	public int partyLikeEvaluate(PartyEvaluate pe) {
		int result1 = partyDao.partyLikeEvaluate(sqlSession, pe);
		int result2 = partyDao.memberLikeEvaluate(sqlSession, pe);
		int result = result1 * result2;
		
		if(result > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@Override
	public int partyBadEvaluate(PartyEvaluate pe) {
		int result1 = partyDao.partyBadEvaluate(sqlSession, pe);
		int result2 = partyDao.memberBadEvaluate(sqlSession, pe);
		int result = result1 * result2;
		
		if(result > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@Override
	public int blackCheck(PartyEvaluate pe) {
		return partyDao.blackCheck(sqlSession, pe);
	}
	
	
	
	
}
