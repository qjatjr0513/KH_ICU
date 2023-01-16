package com.kh.icu.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.icu.member.model.service.MemberService;
import com.kh.icu.member.model.vo.Member;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	private BCryptPasswordEncoder bcryptPasswordEncoder; // 암호화
	
	
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	  
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("login.me")
	public String loginForm() {
		return "member/memberLoginForm";
	}
	
	@RequestMapping("agreeForm.me")
	public String agreeForm() {
		return "member/memberAgreeForm";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		System.out.println("암호화 전 비밀번호 : "+ m.getMemPwd());
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		// 암호화된 비밀번호 Memeber m에 넣음
		m.setMemPwd(encPwd);
		
		System.out.println("암호화 후 비밀버호 : "+m.getMemPwd());
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공");
			return "common/main";
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("idCheck.me")
	@ResponseBody
	public int idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		return result;
	}
	
	@RequestMapping("nickCheck.me")
	@ResponseBody
	public int nickCheck(String checkNick) {
		int result = memberService.nickCheck(checkNick);
		return result;
	}
	

	
	
	  
	@RequestMapping("find.me")
	public String find() {
		return "member/memberFindForm";
	}
}
