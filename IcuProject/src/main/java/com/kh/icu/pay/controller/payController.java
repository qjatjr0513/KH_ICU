package com.kh.icu.pay.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.service.PayService;
import com.kh.icu.pay.model.vo.Pay;

@Controller
public class payController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private AlramHandler alramHandler;
	
	@RequestMapping("accountOfPayment.pe")
	@ResponseBody
	public int accountOfPayment(HttpSession session,
								Pay p, int paNo, String payment, int price,
								PartyJoin pj,
								RedirectAttributes redirectAttributes) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		p.setPaNo(paNo);
		p.setPayment(payment);
		p.setPrice(price);
		p.setPayMemNo(loginUser.getMemNo());
		
		pj.setMemNo(loginUser.getMemNo());
		pj.setPaNo(paNo);
	
		int result = payService.accountOfPayment(p);
		System.out.println("*****result : "+result); 
		if(result == 1) {
			
			partyService.joinPartyMember(pj);
//			redirectAttributes.addFlashAttribute("flag","showAlert");
		}
		
		return result;

	}
	
	
	
	
	
	@RequestMapping("payManageListForm.pe")
	public String payManageListForm(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model,
			 					  @RequestParam Map<String, Object> paramMap){
		
		Map<String, Object> map = new HashMap();
        
	    map = payService.selectPayManageList(currentPage);
	         
	    model.addAttribute("map", map);
		
		return "pay/payManageList";
	}
	
	@RequestMapping("remitConfirm.pe")
	public String remitConfirm(int payNo, HttpSession session, @RequestParam("paName") int paName, 
								@RequestParam("paMemNickName") String paMemNickName) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int result = payService.remitConfirm(payNo);
		System.out.println("payNo :" + payNo);
		
		
		int sendId = loginUser.getMemNo();
		String receiveNickname = paMemNickName;
		int receiveId = paName;
		String message = "pay,"+ sendId + "," + receiveNickname + "," + receiveId + "," + payNo;
		System.out.println(message);
		TextMessage msg = new TextMessage(message);
		Map<String, WebSocketSession> userSessions = new HashMap<>();
		WebSocketSession boardWriterSession = userSessions.get(receiveNickname);
		
		
		try {
			alramHandler.handleTextMessage(boardWriterSession, msg);
			boardWriterSession.sendMessage(msg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		
		return "redirect:payManageListForm.pe";
		
	}
	
	@RequestMapping("myPayListForm.pe")
	public String myPayListForm(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model,
			 					  @RequestParam Map<String, Object> paramMap,
			 					  HttpSession session,
			 					  Pay p){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		p.setPayMemNo(loginUser.getMemNo());
		
		Map<String, Object> map = new HashMap();
        
	    map = payService.selectMyPayList(currentPage, p);
	         
	    model.addAttribute("map", map);
		
		return "pay/myPayList";
	}
	
	
	
}
