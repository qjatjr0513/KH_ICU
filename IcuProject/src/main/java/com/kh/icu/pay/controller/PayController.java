package com.kh.icu.pay.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kh.icu.common.model.service.AlarmService;
import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.PartyJoin;
import com.kh.icu.pay.model.service.PayService;
import com.kh.icu.pay.model.vo.Deposit;
import com.kh.icu.pay.model.vo.Pay;

@Controller
@ServerEndpoint(value="/alram")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private AlramHandler alramHandler;
	
	
	@RequestMapping("accountOfPayment.pe")
	@ResponseBody
	public int accountOfPayment(HttpSession session,
								Pay p, int paNo, String payment, int price,
								PartyJoin pj) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		p.setPaNo(paNo);
		p.setPayment(payment);
		p.setPrice(price);
		p.setPayMemNo(loginUser.getMemNo());
		
		pj.setMemNo(loginUser.getMemNo());
		pj.setPaNo(paNo);
	
		int result = payService.accountOfPayment(p);
		System.out.println("*****result : "+result); 
		if(result > 0) {
			
			partyService.joinPartyMember(pj);
		}
		
		return result;

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
	
	@RequestMapping("depositListForm.pe")
	public String depositListForm(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model,
			  @RequestParam Map<String, Object> paramMap,
			  HttpSession session,
			  Deposit d, @RequestParam(value="mesNo", required=false, defaultValue="0") int mesNo){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		d.setRecNo(loginUser.getMemNo());
		
		Map<String, Object> map = new HashMap();
		
		map = payService.selectMydepList(currentPage, d);
		
		// 알림 조회 상태 변경
        int result = alarmService.readAlarm(mesNo);
		
		model.addAttribute("map", map);
		
		return "pay/memberDepositList";
	}
	
	
	
}
