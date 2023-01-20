package com.kh.icu.party.model.service;

import java.util.List;

import com.kh.icu.party.model.vo.Party;

public interface PartyService {
	
	public int getPrice(String ottNo);
	
	public int insertParty(Party p);
	
	public List<Object> findPartyForm();

}
