package com.kh.icu.member.model.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import com.kh.icu.member.model.vo.Member;
import com.kh.icu.member.model.vo.Sns;

public interface MemberService {
	
	public int insertMember(Member m); // 회원가입
	
	public int idCheck(String checkId);
	
	public int nickCheck(String checkNick);

	public Member loginMember(Member m);
	
	public String getAccessToken(String authorize_code);
	
	public Member getUserInfo(String access_Token);
	
	public void kakaoLogout(String access_Token);
	
	public String findId(Member m);
	
//	public int findPwd(Member m);
	
	//이메일발송
	public void sendEmail(Member m, String div) throws Exception;

	//비밀번호찾기
	public void findPwd(HttpServletResponse response, Member m) throws Exception;
	
	// 회원 조회
	public Member findMember(Member m);
	
	/* public int findPwd(String memPwd); */
	
	/* public int getUserInfoN(Member m); */
}
