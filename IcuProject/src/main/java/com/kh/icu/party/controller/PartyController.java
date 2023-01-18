package com.kh.icu.party.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartyController {
	
	@RequestMapping("partyEnroll.py")
	public String partyEnrollForm() {
		return "party/partyEnrollForm";
	}
	
	@RequestMapping("findParty.py")
	public String findPartyForm() {
		return "party/findPartyForm";
	}
	
	@RequestMapping("partyDetail.py")
	public String partyDetailForm() {
		return "party/partyDetailForm";
	}
}
