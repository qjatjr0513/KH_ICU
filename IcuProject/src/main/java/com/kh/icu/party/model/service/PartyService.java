package com.kh.icu.party.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.vo.Pay;

public interface PartyService {
	
	public int getPrice(String ottNo);
	
	public int insertParty(Party p);
	
	public List<Party> findPartyForm();
	
	public List<Party> searchParty(HashMap<String, Object> map);
	
	public Party partyDetailForm(int paNo);
	
	public List<PartyJoin> partyJoinMem(int paNo);
	
	public int joinPartyMember(PartyJoin pj);
	

}
