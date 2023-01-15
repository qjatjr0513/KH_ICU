package com.kh.icu.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
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
	public String main() {
		return "common/main";
	}
	
	@RequestMapping("find.me")
	public String find() {
		return "member/memberFindForm";
	}
}
