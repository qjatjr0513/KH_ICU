package com.kh.icu.member.model.service;

import java.util.HashMap;

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

}
