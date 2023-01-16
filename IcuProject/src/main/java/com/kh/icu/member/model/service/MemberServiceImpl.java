package com.kh.icu.member.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.icu.member.model.dao.MemberDao;
import com.kh.icu.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao;
	
	private SqlSession sqlSession;
	
	public MemberServiceImpl(MemberDao memberDao, SqlSession sqlSession) {
		this.memberDao = memberDao;
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}
	
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}
}
