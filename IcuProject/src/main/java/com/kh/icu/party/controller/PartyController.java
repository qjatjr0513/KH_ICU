package com.kh.icu.party.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.icu.party.model.service.PartyService;

@Controller
public class PartyController {
	@Autowired
	private PartyService partyService;
	
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
	
	// ott가격 표시
	@RequestMapping("/ottChoice")
	@ResponseBody
	public int getPrice(String ottNo) {
		int price = partyService.getPrice(ottNo);
		return price;
	}
	
	// 예상날짜 & 일일금액 & 예상금액 
//	@RequestMapping("/endDate")
//	@ResponseBody
//	public String endDate(Date endDate) {
//		System.out.println("endDate : "+endDate);
//
//		ArrayList <Object> list = new ArrayList <>();
//	
//	}
	
}
