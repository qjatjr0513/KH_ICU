package com.kh.icu.member.model.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.kh.icu.common.model.vo.Image;
import com.kh.icu.member.model.vo.Member;

public interface MemberService {
   
   /**
    * 회원가입
    */
   public int insertMember(Member m);
   
   /**
    * 아이디 중복확인
    */
   public int idCheck(String checkId);

   /**
    * 닉네임 중복확인
    */
   public int nickCheck(String checkNick);
   
   /**
    * 로그인한 멤버객체 가져오기
    */
   public Member loginMember(Member m);
   
   /**
    * 카카오 토큰 발급
    */
   public String getAccessToken(String authorize_code);
   
   /**
    * 카카오 정보 확인
    */
   public Member getUserInfo(String access_Token);

   
   /**
    * 카카오계정 로그아웃
    */
   public void kakaoLogout(String access_Token);
   
   /**
    * 아이디찾기
    */
   public String findId(Member m);
   
   /**
    * 이메일로 비밀번호찾기
    */
   public void sendEmail(Member m, String div) throws Exception;
   
   /**
    * 비밀번호찾기
    */
   public int findPwd(HttpServletResponse response, Member m) throws Exception;
   
   /**
    * 회원조회
    */   
   public Member findMember(Member m);
   
   /**
    * 프로필 가져오기
    */
    public Image selectProfile(int memNo);
	
    /**
     * 회원정보수정
     */
	public int updateMember(Member m);
	
	/**
	 * 소셜 로그인 닉네임 수정
	 */
	public int updateMemberNick(Member m);
	
	/**
	 * 프로필이미지 넣기 
	 */
	public int insertImg(Image image);

	/**
	 * 프로필이미지 삭제
	 */
	public int deleteImg(int fileNo);
	
	/**
	 * 프로필이미지 수정
	 */
	public int updateImg(Image image);
	
	/**
	 * 프로필이미지 삭제
	 */
	public int deleteMember(String memId);
	
	/**
	 * 관리자 회원 리스트 조회
	 */
	public Map<String, Object> selectMemList(int currentPage);
	
	/**
	 * 관리자 회원 리스트 개수
	 */
	public int selectMemListCount();
	
	/**
	 * 관리자 블랙 리스트 조회
	 */
	public Map<String, Object> selectBlackList(int currentPage);
	
	/**
	 * 관리자 블랙 리스트 개수
	 */
	public int selectBlackListCount();
	
	/**
	 * 관리자 블랙 리스트 해제
	 */
	public int blackCancel(int memNo);
	
	
	
	
	
	
	
}
