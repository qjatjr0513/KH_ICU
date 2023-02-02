package com.kh.icu.party.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.vo.Pay;

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
	
	// 파티 찾기 (리스트 & 검색)
	@RequestMapping("/findParty.py")
	public ModelAndView findPartyForm(ModelAndView mav,
								HttpServletRequest req,
								@RequestParam(value="month", defaultValue="") String month) {
		String ottListarr [] = req.getParameterValues("ottList");
		String ottList = "";
		
		if(ottListarr != null) {
		 ottList = String.join(",",ottListarr);
		}
		

		System.out.println("***ottList" + ottList);
		System.out.println("***month" + month);
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("ottList", ottList);
		map.put("month", month);
		 
		List<Party> list = new ArrayList<>(); 
		
		list = partyService.findParty(map);
		
		mav.addObject("list", list);
		mav.setViewName("party/findPartyForm");
		System.out.println("***list(con/list)" + list);
		
		return mav;
	}
	
	// 파티 디테일
	@RequestMapping("partyDetail.py/{paNo}")
	public String partyDetailForm(Model model, @PathVariable("paNo") int paNo) {
		
		Party p = partyService.partyDetailForm(paNo);
		List<PartyJoin> pj = partyService.partyJoinMem(paNo);
	    ArrayList<Reply> list = partyService.selectReplyList(paNo);
		
		model.addAttribute("p", p);
		model.addAttribute("pj", pj);
		model.addAttribute("list", list);
		
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
	
    // 댓글 등록
    @RequestMapping("insertReply.pa")
    @ResponseBody
    public String insertReply(Reply r, HttpSession session) {
       System.out.println("***r : "+r);
       Member m = (Member)session.getAttribute("loginUser");
       if(m != null) {
     	  String memNo = Integer.toString(m.getMemNo());
          r.setReplyWriter(memNo);
       }
       if(r.getReplyContent() == "") {
          return "0";
       }else {
          int result = partyService.insertReply(r);
          
          if( result > 0) {
             return "1";
          } else { 
             return "0";
          }
       }
    }

    // 댓글 삭제하기
    @RequestMapping("deleteReply.py")
    public String deleteReply(@RequestParam("rno") int rno, @RequestParam("paNo") int paNo,
 		                     HttpSession session, Model model,
 		                     RedirectAttributes redirectAttributes) {
 	   int result = partyService.deleteReply(rno);
 	   
 	   if(result > 0) {
 		   redirectAttributes.addFlashAttribute("flag","showAlert");
 	         return "redirect:partyDetail.py/"+paNo;
 	      } else {
 	         model.addAttribute("errorMsg", "댓글 삭제 실패");
 	         return "common/errorPage";
 	      }
    }

    // 관리자페이지 - 진행중인 파티 
	@RequestMapping("current.py")
	public ModelAndView currentPartyList(ModelAndView mav) {
		
		List<Party> list = partyService.currentPartyList();
		
		mav.addObject("list", list);
		mav.setViewName("party/currentPartyListForm");
		System.out.println("***list(con/list)" + list);
		
		return mav;
	}
	
	// 관리자페이지 - 종료된 파티 
	@RequestMapping("end.py")
	public ModelAndView endPartyList(ModelAndView mav) {
		
		List<Party> list = partyService.endPartyList();
		
		mav.addObject("list", list);
		mav.setViewName("party/endPartyListForm");
		System.out.println("***list(con/list)" + list);
		
		return mav;
	}	
	
    // 사용자페이지 - 진행중인 파티 (내가 만든 / 내가 참여한)
	@RequestMapping("CurrentParty.py")
	public ModelAndView memCurrentPartyList(ModelAndView mav, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int memNo = m.getMemNo();
		System.out.println("****memNo" + memNo);
		
		// 내가 만든 파티 listI / 내가 참여한 파티 listO
		List<Party> listI = partyService.memCurrentPartyListI(memNo);
		List<Party> listO = partyService.memCurrentPartyListO(memNo);
		
		mav.addObject("listI", listI);
		mav.addObject("listO", listO);

		System.out.println("****listI" + listI);
		System.out.println("****listO" + listO);
		
		mav.setViewName("party/memberCurrentParty");
		
		return mav;
	}
	 
	// 사용자페이지 - 종료된 파티 (내가 만든 / 내가 참여한)
	@RequestMapping("LastParty.py")
	public ModelAndView memEndPartyList(ModelAndView mav, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int memNo = m.getMemNo();
		System.out.println("****memNo" + memNo);
		
		// 내가 만든 파티 listI / 내가 참여한 파티 listO
		List<Party> listI = partyService.memEndPartyListI(memNo);
		List<Party> listO = partyService.memEndPartyListO(memNo);
		
		mav.addObject("listI", listI);
		mav.addObject("listO", listO);

		System.out.println("****listI" + listI);
		System.out.println("****listO" + listO);
		
		mav.setViewName("party/memberLastParty");
		
		return mav;
	}

}
