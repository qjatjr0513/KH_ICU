package com.kh.icu.party.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;

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
	
	// 파티 만들기
	@RequestMapping("/insert.py")
	public String insertParty(Party p, HttpSession session, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		p.setPaName(memNo);
		
		
		System.out.println("p" + p);
		
		int result = partyService.insertParty(p);

		if(result > 0) {
			session.setAttribute("alertMsg", "파티 등록 성공");
			return "redirect:findParty.py";
		} else {
			model.addAttribute("errorMsg", "파티 등록 실패");
			return "common/errorPage";
		}
		
	}
	
//	@RequestMapping("/findParty.py")
//	public String findPartyForm(Model model,@RequestParam Map<String, Object> paramMap, int ottNo, int startMon, int endMon) {
//		
//		List<Object> map = partyService.findPartyForm();
//			
//		model.addAttribute("map", map);
//		
//		return "board/boardListView";
//	}
	
//	@RequestMapping("/SerchParty.py")
//	public String SerchParty(Model model,@RequestParam Map<String, Object> paramMap, int ottNo, int startMon, int endMon) {
//		
//		Map<String, Object> map = new HashMap();
//		
//		map = partyService.SerchParty();
//			
//		model.addAttribute("map", map);
//		
//		return "board/boardListView";
//	}
//	
	
}
