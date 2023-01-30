package com.kh.icu.party.controller;

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

import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyJoin;

@Controller
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	@RequestMapping("partyEnroll.py")
	public String partyEnrollForm() {
		return "party/partyEnrollForm";
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
		
		int result = partyService.insertParty(p);

		if(result > 0) {
			return "redirect:findParty.py";
		} else {
			model.addAttribute("errorMsg", "파티 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 파티 찾기
	@RequestMapping("/findParty.py")
	public String findPartyForm(Model model,
								@RequestParam(value="ottList[]", defaultValue="") List<Integer> ottList,
								@RequestParam(value="month", defaultValue="") String month) {
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("ottList", ottList);
		map.put("month", month);
		
		System.out.println("***ottList" + ottList);
		System.out.println("***month" + month);
		
		List<Party> list = new ArrayList<>(); 
		
		list = partyService.searchParty(map);
		
		model.addAttribute("list", list);
		System.out.println("***list(con/list)" + list);
		
		return "party/findPartyForm";
	}
	
	// 파티 디테일
	@RequestMapping("partyDetail.py/{paNo}")
	public String partyDetailForm(Model model, @PathVariable("paNo") int paNo) {
		
		Party p = partyService.partyDetailForm(paNo);
		List<PartyJoin> pj = partyService.partyJoinMem(paNo);
		
		model.addAttribute("p", p);
		model.addAttribute("pj", pj);
		System.out.println("pj : "+ pj);
		
		return "party/partyDetailForm";
	}
	
	// 파티 참여하기
	@RequestMapping("/joinPartyMember")
	public String joinPartyMember(Party p, int paNo, HttpSession session, Model model) {
		
		System.out.println("*** paNo" + paNo);
		int num = partyService.partyJoinMem(paNo).size();
		System.out.println("*** num" + num);
		
		// 인원수 제한
		if(num < 3) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int logMemNo = loginUser.getMemNo();
			System.out.println("*** logMemNo" + logMemNo);
			
			List<PartyJoin> pj1 = partyService.partyJoinMem(paNo);
			System.out.println("*** pj1" + pj1);
			int i = 0;
			
			for(PartyJoin p1 : pj1) {
				i = p1.getMemNo();
				System.out.println("*** i - 1" + i);
	 		    for(int j=0; j<num; j++){
	 			    if(logMemNo == i) {
	 					System.out.println("*** i - 2" + i);
	 				    model.addAttribute("errorMsg", "이미 가입한 파티입니다.");
						return "common/errorPage";
	 			    } 
	 		    }
			} 
			 
			p = partyService.partyDetailForm(paNo);
			System.out.println("p" + p);
			model.addAttribute("p", p); 
			return "party/partyJoinForm";
			
		}else {
			model.addAttribute("errorMsg", "파티 정원이 찼습니다. 다른 파티를 찾아보세요.");
			return "common/errorPage";
		}
	}
	
	
	
}
