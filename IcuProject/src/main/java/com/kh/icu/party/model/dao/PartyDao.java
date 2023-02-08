package com.kh.icu.party.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyEvaluate;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.vo.Pay;

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
	
	// 파티 찾기 (리스트) 
	public List<Party> findPartyForm(SqlSession sqlSession) {
		return sqlSession.selectList("partyMapper.findPartyForm");
	}
	
	// 파티 찾기 (검색) 
	public List<Party> findParty(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("partyMapper.findParty", map);
	}
	
	// 파티 디테일
	public Party partyDetailForm(SqlSession sqlSession, int paNo) {
		return sqlSession.selectOne("partyMapper.partyDetailForm", paNo);
	}
	
	// 참여인원 조회
	public List<PartyJoin> partyJoinMem(SqlSession sqlSession, int paNo) {
		return sqlSession.selectList("partyMapper.partyJoinMem", paNo);
	}
	
	public List<PartyJoin> partyMem(SqlSession sqlSession, int paNo) {
		return sqlSession.selectList("partyMapper.partyMem", paNo);
	}
	
	// 파티 참여하기
	public int joinPartyMember(SqlSession sqlSession, PartyJoin pj) {
		return sqlSession.insert("partyMapper.joinPartyMember", pj);
	}
	
	// 댓글 불러오기 (리스트)
	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int paNo) {
		return (ArrayList)sqlSession.selectList("partyMapper.selectReply", paNo);
	}
	
	// 댓글 작성하기 
	public int insertReply(SqlSession sqlSession, Reply r) {
		return sqlSession.insert("partyMapper.insertReply", r);
	}

	public List<Party> partyList(SqlSession sqlSession){
		return sqlSession.selectList("partyMapper.partyList");
	}
	
	public List<Party> partyDateList(SqlSession sqlSession){
		return sqlSession.selectList("partyMapper.partyDateList");
	}
	
	public int endParty(SqlSession sqlSession, int paNo) {
		return sqlSession.update("partyMapper.endParty", paNo);
	}
	
	// 댓글 삭제하기 
	public int deleteReply(SqlSession sqlSession, int rno) {
		return sqlSession.update("partyMapper.deleteReply", rno);
	}
	
	// 관리자페이지 - 진행중인 파티 
	public List<Party> currentPartyList(SqlSession sqlSession){
		return sqlSession.selectList("partyMapper.currentPartyList");
	};
	
	// 관리자페이지 - 종료된 파티 
	public List<Party> endPartyList(SqlSession sqlSession){
		return sqlSession.selectList("partyMapper.endPartyList");
	};
	
	// 마이페이지 - 진행중인 파티  - 내가 만든 파티
	public List<Party> memCurrentPartyListI(SqlSession sqlSession, int memNo){
		return sqlSession.selectList("partyMapper.memCurrentPartyListI", memNo);
	};
	
	// 마이페이지 - 진행중인 파티  - 내가 참여한 파티
	public List<Party> memCurrentPartyListO(SqlSession sqlSession, int memNo){
		return sqlSession.selectList("partyMapper.memCurrentPartyListO", memNo);
	};
	
	// 마이페이지 - 종료된 파티  - 내가 만든 파티
	public List<Party> memEndPartyListI(SqlSession sqlSession, int memNo){
		return sqlSession.selectList("partyMapper.memEndPartyListI", memNo);
	};
	
	// 마이페이지 - 종료된 파티  - 내가 참여한 파티
	public List<Party> memEndPartyListO(SqlSession sqlSession, int memNo){
		return sqlSession.selectList("partyMapper.memEndPartyListO", memNo);
	};
	
	public int checkPartyEvaluate(SqlSession sqlSession, PartyEvaluate pe) {
		System.out.println("*****************pe: "+pe);
		int result = sqlSession.selectOne("partyMapper.checkPartyEvaluate", pe);
		System.out.println("**************result : "+result);
		return result;
	}
	
	public int partyLikeEvaluate(SqlSession sqlSession, PartyEvaluate pe) {
		return sqlSession.insert("partyMapper.partyLikeEvaluate", pe);
	}
	
	public int partyBadEvaluate(SqlSession sqlSession, PartyEvaluate pe) {
		return sqlSession.insert("partyMapper.partyBadEvaluate", pe);
	}
	
	public int blackCheck(SqlSession sqlSession, PartyEvaluate pe) {
		
		return sqlSession.update("partyMapper.blackCheck", pe);
	}
	
	public int memberLikeEvaluate(SqlSession sqlSession, PartyEvaluate pe) {
		return sqlSession.update("partyMapper.memberLikeEvaluate", pe);
	}
	
	public int memberBadEvaluate(SqlSession sqlSession, PartyEvaluate pe) {
		return sqlSession.update("partyMapper.memberBadEvaluate", pe);
	}
	
	
	
	
	
	
}
