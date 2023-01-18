package com.kh.icu.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.icu.member.model.dao.MemberDao;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.member.model.vo.Sns;

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
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		return loginUser;
	}
	
	@Override
	public String findId(Member m) {
		String memberId= memberDao.findId(sqlSession, m);	
		return memberId ;
	}
	
	//카카오 토큰 발급
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
	
	// 카카오 정보확인
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
	
	
	
	// 카카오 로그아웃
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
	
	//네이버 정보확인
	@Override
	public Member findMember(Member m) {
		Member result = memberDao.findMember(sqlSession, m);
		
        // 저장되어있는지 확인
        if(result == null) {
            //result null 이면 정보가 저장 안되어있는거라서 저보를 저장.
        	memberDao.getUserInfoN(sqlSession, m);
            //저장하기위해 repository 로 이동
            return memberDao.findMember(sqlSession, m);
            // 정보 저장후 컨트롤러에 정보를 보냄
            //result 를 리턴으로 보내면 null 이 리턴되므로 위코드를 사용.
        }else {
            return result;
            //정보가 있으므로 result 를 리턴함
        }
	};
	
	//네이버 정보저장
	/*
	 * @Override public int getUserInfoN(Member m) { String nickname =
	 * randomRangeN(100000, 999999); m.setMemNickname(nickname);
	 * System.out.println(nickname);
	 * 
	 * int result = memberDao.getUserInfoN(sqlSession, m);
	 * System.out.println(result); return result;
	 * 
	 * };
	 */
	
	// 닉네임 랜덤생성 (naver)
	public static String randomRangeN(int n1, int n2) {
		double num = (((Math.random() * (n2 - n1 + 1)) + n1));
	    return (String) "N"+(int)(Math.floor(num));
	  }
	
	// 닉네임 랜덤생성(kakao)
	public static String randomRange(int n1, int n2) {
		double num = (((Math.random() * (n2 - n1 + 1)) + n1));
	    return (String) "K"+(int)(Math.floor(num));
	  }
	
}
