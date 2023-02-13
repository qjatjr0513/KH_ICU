package com.kh.icu.party.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Date;
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
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.icu.common.model.service.AES256Util;
import com.kh.icu.common.model.service.AlarmService;
import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.party.model.vo.PartyEvaluate;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.vo.Pay;

@Controller
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private AlramHandler alramHandler;
	 
	@Autowired
    private AES256Util aes;
	
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
	public String insertParty(Party p, HttpSession session, RedirectAttributes redirectAttributes, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		p.setPaName(memNo);
		
		String pwd = p.getOttPwd();
		try {
			String enc = aes.encrypt(pwd);
			p.setOttPwd(enc);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		int result = partyService.insertParty(p);

		if(result > 0) {
			redirectAttributes.addFlashAttribute("flag","showAlert1"); // "파티가 등록되었습니다. "
			return "redirect:findPartyForm.py";
		}else {
			redirectAttributes.addFlashAttribute("flag","showAlert2"); // "파티 등록에 실패했습니다. "
			return "redirect:insert.py";
		}
		
	}
	
	// 파티 찾기 (리스트)
	@RequestMapping("/findPartyForm.py")
	public ModelAndView findPartyForm(ModelAndView mav) {
		
		List<Party> list = partyService.findPartyForm();
		
		mav.addObject("list", list);
		mav.setViewName("party/findPartyForm");
		
		return mav;
	}
	
	// 파티 찾기 (검색)
	@RequestMapping("/findParty.py")
	@ResponseBody
	public String findParty(@RequestParam(value="ottList[]", defaultValue="") String ottListarr,
							@RequestParam(value="month", defaultValue="") String month) {
		
		String ottList = "";
		
		if(ottListarr != null) {
			ottList = String.join(",",ottListarr);
		}
		
		System.out.println("***ottList" + ottList);
		System.out.println("***month" + month);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("ottList", ottList);
		map.put("month", month);
		 
		Gson gson = new GsonBuilder().create();
		List<Party> list = partyService.findParty(map);
		
		String result = gson.toJson(list);
		
		return result;
	}
	
	// 파티 디테일
	@RequestMapping("partyDetail.py/{paNo}")
	public String partyDetailForm(Model model, @PathVariable("paNo") int paNo,
			                      @RequestParam(value="mesNo", required=false, defaultValue="0") int mesNo) {
		
		Party p = partyService.partyDetailForm(paNo);
		List<PartyJoin> pj = partyService.partyJoinMem(paNo);
		List<PartyJoin> pjr = partyService.partyMem(paNo);
	    ArrayList<Reply> list = partyService.selectReplyList(paNo);
		
	    int result = alarmService.readAlarm(mesNo);
	    
		model.addAttribute("p", p);
		model.addAttribute("pj", pj);
		model.addAttribute("pjr", pjr);
		model.addAttribute("list", list);
		
		return "party/partyDetailForm";
	}
	
	// 파티 참여하기
	@RequestMapping("/joinPartyMember")
	public String joinPartyMember(Party p, int paNo, int crewNum, HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		
		int num = partyService.partyJoinMem(paNo).size();
		
		// 인원수 제한
		if(num < crewNum) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int logMemNo = loginUser.getMemNo();
			
			List<PartyJoin> pj1 = partyService.partyJoinMem(paNo);
			int i = 0;
			
			for(PartyJoin p1 : pj1) {
				i = p1.getMemNo();
	 		    for(int j=0; j<num; j++){
	 			    if(logMemNo == i) {
	 				    redirectAttributes.addFlashAttribute("flag1","showAlert1"); // "이미 가입한 파티입니다."
	 				    return "redirect:partyDetail.py/"+paNo;
	 			    }
	 		    }
			} 
			p = partyService.partyDetailForm(paNo);
			model.addAttribute("p", p); 
			return "party/partyJoinForm";
		}else {
			redirectAttributes.addFlashAttribute("flag2","showAlert2");  // "파티 정원이 찼습니다. 다른 파티를 찾아보세요."
			return "redirect:partyDetail.py/"+paNo;
		}
	}
	
    // 댓글 등록
    @RequestMapping("insertReply.py")
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
 		     redirectAttributes.addFlashAttribute("flag","showAlert"); // "댓글이 삭제되었습니다. "
 	         return "redirect:partyDetail.py/"+paNo;
 	      } else {
  		     redirectAttributes.addFlashAttribute("flag0","showAlert0"); // "댓글삭제 실패했습니다. 다시 시도해주세요. "
 	         return "redirect:partyDetail.py/"+paNo;
 	      }
    }


	
    // 사용자페이지 - 진행중인 파티 (내가 만든 / 내가 참여한)
	@RequestMapping("CurrentParty.py")
	public ModelAndView memCurrentPartyList(ModelAndView mav, HttpSession session) throws UnsupportedEncodingException, GeneralSecurityException {
		
		Member m = (Member)session.getAttribute("loginUser");
		Party p = new Party();
		int memNo = m.getMemNo();
		
		// 내가 만든 파티 listI / 내가 참여한 파티 listO
		List<Party> listI = partyService.memCurrentPartyListI(memNo);
		for(int i = 0; i< listI.size(); i++) {
			String ottPwd = aes.decrypt(listI.get(i).getOttPwd());
			listI.get(i).setOttPwd(ottPwd);

		}
		List<Party> listO = partyService.memCurrentPartyListO(memNo);
		for(int i = 0; i< listO.size(); i++) {
			String ottPwd = aes.decrypt(listO.get(i).getOttPwd());
			listO.get(i).setOttPwd(ottPwd);
	
		}
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
		
		// 내가 만든 파티 listI / 내가 참여한 파티 listO
		List<Party> listI = partyService.memEndPartyListI(memNo);
		List<Party> listO = partyService.memEndPartyListO(memNo);
		 
		mav.addObject("listI", listI);
		mav.addObject("listO", listO);

		mav.setViewName("party/memberLastParty");
		
		return mav;
	}
	
	/**
	 * 사용자페이지 파티장 평가
	 */
	@RequestMapping("partyLikeEvaluate.py")
	public String partyLikeEvaluate(PartyEvaluate pe, @RequestParam("paNo") int paNo, HttpSession session, RedirectAttributes redirectAttributes) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		pe.setMemNo(memNo);
		pe.setPaNo(paNo);
		System.out.println("******pe:"+pe);
		
		int cpe = partyService.checkPartyEvaluate(pe);
		System.out.println("******cpe : "+ cpe);
		int result = 0;
		if(cpe == 1) {
			redirectAttributes.addFlashAttribute("flag","showAlert"); // 이미 평가하셨습니다.
			return "redirect:LastParty.py";
		} else {
			result = partyService.partyLikeEvaluate(pe);
			
			System.out.println("******result : "+ result);
			if(result > 0 ) {
				redirectAttributes.addFlashAttribute("flag2","showAlert2"); // 좋아요 성공하셨습니다.
				return "redirect:LastParty.py";
			} else {
				redirectAttributes.addFlashAttribute("flag3","showAlert3"); // 좋아요 실패하셨습니다.
				return "redirect:LastParty.py";
			}
		}
		
	}
	
	/**
	 * 사용자페이지 파티장 평가
	 */
	@RequestMapping("partyBadEvaluate.py")
	public String partyBadEvaluate(PartyEvaluate pe, @RequestParam("paNo") int paNo, HttpSession session, RedirectAttributes redirectAttributes) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Party p = partyService.partyDetailForm(paNo);
		int memNo = loginUser.getMemNo();
		pe.setMemNo(memNo);
		pe.setPaNo(paNo);
		System.out.println("******pe:"+pe);
		
		int cpe = partyService.checkPartyEvaluate(pe);
		System.out.println("******cpe : "+ cpe);
		int result = 0;
		if(cpe == 1) {
			redirectAttributes.addFlashAttribute("flag","showAlert"); // 이미 평가하셨습니다.
			return "redirect:LastParty.py";
		} else {
			result = partyService.partyBadEvaluate(pe);
			System.out.println("******result : "+ result);
			if(result > 0 ) {
				redirectAttributes.addFlashAttribute("flag4","showAlert4"); // 싫어요에 성공하셨습니다.
				int result2 = partyService.blackCheck(pe);
				
				if(result2 > 0) {
					int sendId = 1;
					String sendNickname = "관리자";
					String receiveNickname = p.getMemNickname();
					int receiveId = p.getPaName();
					
					String message = "black,"+ sendId + "," + sendNickname + "," + receiveNickname + "," +receiveId + "," + paNo;
					
					//Map<String, WebSocketSession> userSessions = new HashMap<>();
					WebSocketSession receiveSession = Sessions.userSessions.get(receiveNickname);
					System.out.println(receiveSession);
					
					
					TextMessage msg = new TextMessage(message);
					
					try {
						alramHandler.handleTextMessage(receiveSession, msg);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}			
				}
					
				return "redirect:LastParty.py";
			} else {
				redirectAttributes.addFlashAttribute("flag5","showAlert5"); // 싫어요에 실패하셨습니다.
				return "redirect:LastParty.py";
			}
		}
		
	}
	
	
	
	
	
	

}
