package com.kh.icu.member.model.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.kh.icu.common.model.vo.Image;
import com.kh.icu.member.model.vo.Member;

public interface MemberService {
   
   public int insertMember(Member m); // 회원가입
   
   public int idCheck(String checkId);
   
   public int nickCheck(String checkNick);

   public Member loginMember(Member m);
   
   public String getAccessToken(String authorize_code);
   
   public Member getUserInfo(String access_Token);
   
   public void kakaoLogout(String access_Token);
   
   public String findId(Member m);
   
//   public int findPwd(Member m);
   
   //이메일발송
   public void sendEmail(Member m, String div) throws Exception;

   //비밀번호찾기
   public int findPwd(HttpServletResponse response, Member m) throws Exception;
   
   // 회원 조회
   public Member findMember(Member m);
   
   /* public int findPwd(String memPwd); */
   
   /* public int getUserInfoN(Member m); */

    public String selectProfile(Member m);
	
	public int updateMember(Member m);

	public int insertImg(Image image);

	
	public int updateImg(Image image, String webPath, String serverFolderPath);
	
	public int deleteMember(String memId);
	
	
	public Map<String, Object> selectMemList(int currentPage);
	
	public int selectMemListCount();
	
	
	
	
	
	
	
	
}
