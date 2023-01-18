package com.kh.icu.member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.member.model.vo.Member;
import com.kh.icu.member.model.vo.Sns;

@Repository
public class MemberDao {
	
	public int insertMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int idCheck(SqlSession sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int nickCheck(SqlSession sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	public Member loginMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);	
	}
	
	public String findId(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}
	
	// 카카오 로그인 정보 저장
	public void kakaoinsert(SqlSession sqlSession, HashMap<String, Object> userInfo) {
		sqlSession.insert("memberMapper.kakaoInsert",userInfo);
	}

	// 카카오 로그인 정보 확인
	public Member findkakao(SqlSession sqlSession, HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		System.out.println("RM:"+userInfo.get("name"));
		return sqlSession.selectOne("memberMapper.findKakao", userInfo);
	}
	
	// 네이버 로그인 정보 확인
	public Member findMember(SqlSession sqlSession, Member m) {
		System.out.println("Member(findMember/Dao):"+m);
		Member result = sqlSession.selectOne("memberMapper.findMember", m);
		System.out.println("result :"+result);
		return result;
	};
	
	// 네이버 로그인 정보 저장
	public int getUserInfoN(SqlSession sqlSession, Member m) {
		System.out.println(m.getMemNickname());
		return sqlSession.insert("memberMapper.getUserInfoN", m);
	};
	
}
