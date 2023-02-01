package com.kh.icu.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.member.model.vo.Member;

@Repository
public class MemberDao {
   
	/**
	 * 회원가입
	 */
   public int insertMember(SqlSession sqlSession, Member m) {
      return sqlSession.insert("memberMapper.insertMember", m);
   }
   
	/**
	 * 아이디 중복검사
	 */
   public int idCheck(SqlSession sqlSession, String checkId) {
      return sqlSession.selectOne("memberMapper.idCheck", checkId);
   }
   
	/**
	 * 닉네임 중복검사
	 */
   public int nickCheck(SqlSession sqlSession, String checkNick) {
      return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
   }
   
	/**
	 * 로그인 멤버 객체 가져오기
	 */
   public Member loginMember(SqlSession sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.loginMember", m);   
   }
   
	/**
	 * 아이디 찾기
	 */
   public String findId(SqlSession sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.findId", m);
   }
   
	/**
	 * 가입된 멤버 Id가져오기
	 */
   public String selectId(SqlSession sqlSession, Member m) {
	   String result = sqlSession.selectOne("memberMapper.selectId", m);
	   System.out.println("아이디 : "+result);
	   
	   return result;
   }
   
   /*
    * public int findPwd(SqlSession sqlSession, String memPwd) { return
    * sqlSession.update("memberMapper.updatePwd", memPwd); }
    */
   
	/**
	 * 가입된 멤버 패스워드 가져오기
	 */
   public int findPwd(SqlSession sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.findPwd", m);
   }
   
	/**
	 * 비밀번호 변경
	 */
   public int updatePwd(SqlSession sqlSession, Member m) {
      return sqlSession.update("memberMapper.updatePwd", m);
   }
   
	/**
	 * 회원조회
	 */
   public Member selectMember(SqlSession sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.selectMember", m);
   }
	/**
	 * 이메일 조회
	 */   
   public String selectEmail(SqlSession sqlSession, Member m) {
	   String result = sqlSession.selectOne("memberMapper.selectEmail", m);
	   System.out.println("이메일 : "+result);
	   
      return result;
   }
   
	/**
	 * 카카오 로그인 정보 저장
	 */
   public void kakaoinsert(SqlSession sqlSession, HashMap<String, Object> userInfo) {
      sqlSession.insert("memberMapper.kakaoInsert",userInfo);
   }

	/**
	 * 카카오 로그인 정보 확인
	 */
   public Member findkakao(SqlSession sqlSession, HashMap<String, Object> userInfo) {
      System.out.println("RN:"+userInfo.get("nickname"));
      System.out.println("RE:"+userInfo.get("email"));
      System.out.println("RM:"+userInfo.get("name"));
      return sqlSession.selectOne("memberMapper.findKakao", userInfo);
   }
   
	/**
	 * 네이버 로그인 정보 확인
	 */
   public Member findMember(SqlSession sqlSession, Member m) {
      System.out.println("Member(findMember/Dao):"+m);
      Member result = sqlSession.selectOne("memberMapper.findMember", m);
      System.out.println("result :"+result);
      return result;
   }
   
	/**
	 * 네이버 로그인 정보 저장
	 */
   public int getUserInfoN(SqlSession sqlSession, Member m) {
      System.out.println(m.getMemNickname());
      return sqlSession.insert("memberMapper.getUserInfoN", m);
   }

	/**
	 * 프로필이미지 넣기
	 */
	public int insertImg(SqlSession sqlSession, Image image) {
		return sqlSession.insert("memberMapper.insertImg", image);
	}
	
	/**
	 * 프로필이미지 삭제
	 */
	public int deleteImg(SqlSession sqlSession, int fileNo) {
		return sqlSession.delete("memberMapper.deleteImg", fileNo);
	}
	
	/**
	 * 프로필이미지 가져오기
	 */
	public Image selectProfile(SqlSession sqlSession, int memNo) {
		Image profile = sqlSession.selectOne("memberMapper.selectProfile", memNo);
		
		return profile;
	}
	
	/**
	 * 회원정보수정
	 */
	public int updateMember(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	/**
	 * 프로필이미지 수정
	 */
	public int updateImg(SqlSession sqlSession, Image image) {
		return sqlSession.update("memberMapper.updateImg", image);
	}
	
	/**
	 * 회원탈퇴
	 */
	public int deleteMember(SqlSession sqlSession, String memId) {
		return sqlSession.update("memberMapper.deleteMember", memId);
	}
	
	/**
	 * 관리자 회원 리스트 개수
	 */
	public int selectMemListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemListCount");
	}
	
	/**
	 * 관리자 회원 리스트 조회
	 */
	public ArrayList<Member> selectMemList(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemList", null ,  rowBounds);
	}
	
	/**
	 * 관리자 블랙 리스트 개수
	 */
	public int selectBlackListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("memberMapper.selectBlackListCount");
	}
	
	/**
	 * 관리자 블랙 리스트 조회
	 */
	public ArrayList<Member> selectBlackList(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectBlackList", null ,  rowBounds);
	}
	
	/**
	 * 관리자 블랙 리스트 해제
	 */
	public int blackCancel(SqlSession sqlSession, int memNo) {
		
		int result = sqlSession.update("memberMapper.blackCancel", memNo);
		return result;
	}
	
}
