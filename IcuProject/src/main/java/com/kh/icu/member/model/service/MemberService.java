package com.kh.icu.member.model.service;

import com.kh.icu.member.model.vo.Member;

public interface MemberService {
	
	public int insertMember(Member m); // 회원가입
	
	public int idCheck(String checkId);
	
	public int nickCheck(String checkNick);

	public Member loginMember(Member m);

}
