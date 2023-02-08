package com.kh.icu.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.common.template.Pagination;
import com.kh.icu.member.model.dao.MemberDao;
import com.kh.icu.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
   
   private MemberDao memberDao;
   
   private SqlSession sqlSession;
   private Pagination pagination;
   
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   public MemberServiceImpl(MemberDao memberDao, SqlSession sqlSession, BCryptPasswordEncoder bcryptPasswordEncoder, Pagination pagination) {
      this.memberDao = memberDao;
      this.sqlSession = sqlSession;
      this.bcryptPasswordEncoder = bcryptPasswordEncoder;
      this.pagination = pagination;
   }
   
   /**
    * 회원가입
    */
   @Override
   public int insertMember(Member m) {
      return memberDao.insertMember(sqlSession, m);
   }
   
   /**
    * 아이디 중복확인
    */
   @Override
   public int idCheck(String checkId) {
      return memberDao.idCheck(sqlSession, checkId);
   }
   
   /**
    * 닉네임 중복확인
    */
   @Override
   public int nickCheck(String checkNick) {
      return memberDao.nickCheck(sqlSession, checkNick);
   }
   
   /**
    * 로그인한 멤버객체 가져오기
    */
   @Override
   public Member loginMember(Member m) {
      Member loginUser = memberDao.loginMember(sqlSession, m);
      
      return loginUser;
   }
   
   /**
    * 아이디찾기
    */
   @Override
   public String findId(Member m) {
      String memberId= memberDao.findId(sqlSession, m);   
      return memberId ;
   }
   
//   @Override
//   public int findPwd(Member m) {
//      int result = memberDao.findPwd(sqlSession, m);
//      return result;
//   }
   
   @Autowired
   private JavaMailSender mailSender;
   
   /**
    * 이메일로 비밀번호찾기
    */
   @Override
   public void sendEmail(Member m, String div) throws Exception {

      // 보내는 사람 EMail, 제목, 내용
      String fromEmail = "icu18780@gmail.com";
      String subject = "";
      String msg = "";

      if(div.equals("findpw")) {
         subject = "ICU 임시 비밀번호 입니다.";
         msg += m.getMemId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
         msg += "임시 비밀번호 : ";
         msg += m.getMemPwd();
      }

      // 받는 사람 E-Mail 주소
      String mail = m.getEmail();
      try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(message,
               true, "UTF-8");

         messageHelper.setFrom(fromEmail); // 보내는사람 생략하면 정상작동을 안함
         messageHelper.setTo(mail); // 받는사람 이메일
         messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
         messageHelper.setText(msg); // 메일 내용

         mailSender.send(message);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   /**
    * 비밀번호찾기
    */
   @Override
   public int findPwd(HttpServletResponse response, Member m) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      System.out.println("?????????????????"+m);
      
      // 가입된 아이디가 없으면
      if(memberDao.selectId(sqlSession, m) == null) {
         return 0;
      }
      // 가입된 이메일이 아니면
      else if(memberDao.selectEmail(sqlSession, m) == null) {
         return 1;
      }else {
         // 임시 비밀번호 생성
         String pwd = "";
         for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
            
            
         }
         m.setMemPwd(pwd);
         sendEmail(m, "findpw");
         String encPwd = bcryptPasswordEncoder.encode(pwd);
         m.setMemPwd(encPwd);
         // 비밀번호 변경
         memberDao.updatePwd(sqlSession, m);
         // 비밀번호 변경 메일 발송
         return 2;
         
      }
   }
   
   /**
    * 카카오 토큰 발급
    */
   @Override
   public String getAccessToken (String authorize_code) {
      String access_Token = "";
      String refresh_Token = "";
      String reqURL = "https://kauth.kakao.com/oauth/token";

      try {
         URL url = new URL(reqURL);
            
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
         conn.setRequestMethod("POST");
         conn.setDoOutput(true);
         // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
         StringBuilder sb = new StringBuilder();
         sb.append("grant_type=authorization_code");
            
         sb.append("&client_id=faf6b25930399b2135403b6474fb775f"); //본인이 발급받은 key
         sb.append("&redirect_uri=http://localhost:8088/icu/kakaoLogin"); // 본인이 설정한 주소
            
         sb.append("&code=" + authorize_code);
         bw.write(sb.toString());
         bw.flush();
            
         // 결과 코드가 200이라면 성공
         int responseCode = conn.getResponseCode();
         System.out.println("responseCode : " + responseCode);
            
         // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         String line = "";
         String result = "";
            
         while ((line = br.readLine()) != null) {
            result += line;
         }
         System.out.println("response body : " + result);
            
         // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
         JsonParser parser = new JsonParser();
         JsonElement element = parser.parse(result);
            
         access_Token = element.getAsJsonObject().get("access_token").getAsString();
         refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
         System.out.println("access_token : " + access_Token);
         System.out.println("refresh_token : " + refresh_Token);
            
         br.close();
         bw.close();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return access_Token;
   }
   
   /**
    * 카카오 정보 확인
    */
   @Override
   public Member getUserInfo(String access_Token) {

      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
      HashMap<String, Object> userInfo = new HashMap<String, Object>();
      
      // 닉네임 숫자 범위
      String nickName = randomRange(100000, 999999);
      
      String reqURL = "https://kapi.kakao.com/v2/user/me";
      try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("GET");

         // 요청에 필요한 Header에 포함될 내용
         conn.setRequestProperty("Authorization", "Bearer " + access_Token);

         int responseCode = conn.getResponseCode();
         System.out.println("responseCode : " + responseCode);

         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

         String line = "";
         String result = "";

         while ((line = br.readLine()) != null) {
            result += line;
         }
         System.out.println("response body : " + result);

         JsonParser parser = new JsonParser();
         JsonElement element = parser.parse(result);

         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

         String name = properties.getAsJsonObject().get("nickname").getAsString();
         String email = kakao_account.getAsJsonObject().get("email").getAsString();

         userInfo.put("name", name);
         userInfo.put("email", email);
         userInfo.put("nickName", nickName);

      } catch (IOException e) {
         e.printStackTrace();
      }
      
      
      
      Member result = memberDao.findkakao(sqlSession, userInfo); 
        // 저장되어있는지 확인
        System.out.println("S :" + result);
        System.out.println(userInfo);
        if(result == null) {
            //result null 이면 정보가 저장 안되어있는거라서 저보를 저장.
            memberDao.kakaoinsert(sqlSession,userInfo);
            //저장하기위해 repository 로 이동
            return memberDao.findkakao(sqlSession, userInfo);
            // 정보 저장후 컨트롤러에 정보를 보냄
            //result 를 리턴으로 보내면 null 이 리턴되므로 위코드를 사용.
        }else {
            return result;
            //정보가 있으므로 result 를 리턴함
        }
   }

//   // 카카오 정보확인
//   @Override
//   public Member getUserInfo(String access_Token) {
//
//      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
//      HashMap<String, Object> userInfo = new HashMap<String, Object>();
//      
//      // 닉네임 숫자 범위
//      String nickName = randomRange(100000, 999999);
//      
//      String reqURL = "https://kapi.kakao.com/v2/user/me";
//      try {
//         URL url = new URL(reqURL);
//         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//         conn.setRequestMethod("GET");
//
//         // 요청에 필요한 Header에 포함될 내용
//         conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//
//         int responseCode = conn.getResponseCode();
//         System.out.println("responseCode : " + responseCode);
//
//         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//         String line = "";
//         String result = "";
//
//         while ((line = br.readLine()) != null) {
//            result += line;
//         }
//         System.out.println("response body : " + result);
//
//         JsonParser parser = new JsonParser();
//         JsonElement element = parser.parse(result);
//
//         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//
//         String name = properties.getAsJsonObject().get("nickname").getAsString();
//         String email = kakao_account.getAsJsonObject().get("email").getAsString();
//
//         userInfo.put("name", name);
//         userInfo.put("email", email);
//         userInfo.put("nickName", nickName);
//
//      } catch (IOException e) {
//         e.printStackTrace();
//      }
//      
//      
//      
//      Member result = memberDao.findkakao(sqlSession, userInfo); 
//        // 저장되어있는지 확인
//        System.out.println("S :" + result);
//        System.out.println(userInfo);
//        if(result == null) {
//            //result null 이면 정보가 저장 안되어있는거라서 저보를 저장.
//            memberDao.kakaoinsert(sqlSession,userInfo);
//            //저장하기위해 repository 로 이동
//            return memberDao.findkakao(sqlSession, userInfo);
//            // 정보 저장후 컨트롤러에 정보를 보냄
//            //result 를 리턴으로 보내면 null 이 리턴되므로 위코드를 사용.
//        }else {
//            return result;
//            //정보가 있으므로 result 를 리턴함
//        }
//   }
   
   /**
    * 카카오계정 로그아웃
    */
   @Override
   public void kakaoLogout(String access_Token) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
   }
   
   /**
    * 회원조회
    */   
   @Override
   public Member findMember(Member m) {
      Member result = memberDao.findMember(sqlSession, m);
      
        // 저장되어있는지 확인
        if(result == null) {
            //result null 이면 정보가 저장 안되어있는거라서 저보를 저장.
           memberDao.getUserInfo(sqlSession, m);
            //저장하기위해 repository 로 이동
            return memberDao.findMember(sqlSession, m);
            // 정보 저장후 컨트롤러에 정보를 보냄
            //result 를 리턴으로 보내면 null 이 리턴되므로 위코드를 사용.
        }else {
            return result;
            //정보가 있으므로 result 를 리턴함
        }
   };
   
//   //네이버 정보저장
//   
//     @Override 
//     public int getUserInfo(Member m) { 
//	    String nickname = randomRangeN(100000, 999999); m.setMemNickname(nickname);
//	    System.out.println(nickname);
//	     
//	    int result = memberDao.getUserInfo(sqlSession, m);
//	    System.out.println(result); return result;    
//     };
    
   

   // 닉네임 랜덤생성(kakao)
   public static String randomRange(int n1, int n2) {
      double num = (((Math.random() * (n2 - n1 + 1)) + n1));
       return (String) "K"+(int)(Math.floor(num));
     }
   
   /**
    * 프로필이미지 가져오기
    */

   @Override
   public Image selectProfile(int memNo) {
	   Image profile = memberDao.selectProfile(sqlSession, memNo);
	   System.out.println("서비스ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ"+profile);
	   return profile;
   }
	
	/**
	 * 프로필이미지 넣기 
	 */
	@Transactional(rollbackFor = {Exception.class}) // 모든종류의 예외에 대해서 발생시 rollback시킴
	@Override
	public int insertImg(Image image){
		
		int result = memberDao.insertImg(sqlSession, image);
		
		return result;
	}
	
	/**
	 * 프로필이미지 삭제
	 */
	@Override
	public int deleteImg(int fileNo) {
		
		int result = memberDao.deleteImg(sqlSession, fileNo);
		
		return result;
	}
	
    /**
     * 회원정보수정
     */
	@Override
	public int updateMember(Member m) {
		
		int updateMember = memberDao.updateMember(sqlSession, m);
		
		return updateMember;
	}
	
	/**
	 * 소셜 로그인 닉네임 수정
	 */
	@Override
	public int updateMemberNick(Member m) {
		
		int updateMember = memberDao.updateMemberNick(sqlSession, m);
		
		return updateMember;
	}

	/**
	 * 프로필이미지 수정
	 */
	@Override
	public int updateImg(Image image){
		
		int result = memberDao.updateImg(sqlSession, image);
		
		return result;
	}
	/**
	 * 회원탈퇴
	 */
	@Override
	public int deleteMember(String memId) {
		
		int result = memberDao.deleteMember(sqlSession, memId);
		
		return result;
	}
	
	/**
	 * 관리자 회원 리스트 개수 
	 */
	@Override
	public int selectMemListCount() {
		return memberDao.selectMemListCount(sqlSession);
	}
	
	/**
	 * 관리자 회원 리스트 조회
	 */
	@Override
	public Map<String, Object> selectMemList(int currentPage){
		
		Map<String, Object> map = new HashMap();
		
		// 1. 페이징처리
		int listCount = selectMemListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
					
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Member> list = memberDao.selectMemList(sqlSession, pi);
		map.put("list", list);
		
		return map;
	}
	
	/**
	 * 관리자 블랙 리스트 개수
	 */
	@Override
	public int selectBlackListCount() {
		return memberDao.selectBlackListCount(sqlSession);
	}
	
	/**
	 * 관리자 블랙 리스트 조회
	 */
	@Override
	public Map<String, Object> selectBlackList(int currentPage){
		
		Map<String, Object> map = new HashMap();
		
		// 1. 페이징처리
		int listCount = selectBlackListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Member> list = memberDao.selectBlackList(sqlSession, pi);
		map.put("list", list);
		
		return map;
	}
	
	/**
	 * 관리자 블랙 리스트 해제
	 */
	@Override
	public int blackCancel(int memNo) {
		
		int result = memberDao.blackCancel(sqlSession, memNo);
		
		return result;
		
	}
	
	
	
	

}
