package com.kh.icu.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyEvaluate;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.vo.Pay;

public interface PartyService {
	
	public int getPrice(String ottNo);
	
	public int insertParty(Party p);
	
	public List<Party> findPartyForm();
	
	public List<Party> findParty(HashMap<String, Object> map);
	
	public Party partyDetailForm(int paNo);
	
	public List<PartyJoin> partyJoinMem(int paNo);
	
	public List<PartyJoin> partyMem(int paNo);
	
	public int joinPartyMember(PartyJoin pj);

	public ArrayList<Reply> selectReplyList(int paNo);

	public int insertReply(Reply r);
	
	public List<Party> partyList();
	
	
	public int endParty(int paNo);

	public int deleteReply(int rno);
	
	// 관리자 페이지
	public List<Party> currentPartyList();
	public List<Party> endPartyList();
	
	// 사용자 마이페이지
	public List<Party> memCurrentPartyListI(int memNo);
	public List<Party> memCurrentPartyListO(int memNo);
	public List<Party> memEndPartyListI(int memNo);
	public List<Party> memEndPartyListO(int memNo);
	
	public int checkPartyEvaluate(PartyEvaluate pe);
	
	public int partyLikeEvaluate(PartyEvaluate pe);
	
	public int partyBadEvaluate(PartyEvaluate pe);

	public int blackCheck(PartyEvaluate pe);
	
	
	
	
	
	
	
	
}
