package com.kh.icu.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.member.model.service.GoogleLoginBo;
import com.kh.icu.member.model.service.MemberService;
import com.kh.icu.member.model.service.NaverLoginBO;
import com.kh.icu.member.model.service.kakaoLoginBO;
import com.kh.icu.member.model.vo.Member;

import lombok.Value;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; // 암호화
	
	@Autowired
	private AlramHandler alramHandler;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	/* KakaoLogin */
	@Autowired
	private kakaoLoginBO kakaoLoginBO;
	
	/* GoogleLogin */
	@Autowired
	private GoogleLoginBo googleLoginBo;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private ServletContext application;
	  
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	/**
	 * 로그인 페이지
	 */
	@RequestMapping("loginForm.me")
	public String loginForm(Model model, HttpSession session) {
		
		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		/* 인증요청문 확인 */
		System.out.println("네이버:" + naverAuthUrl);
		/* 객체 바인딩 */
		model.addAttribute("url", naverAuthUrl);
		
		/* 카카오 URL */
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		System.out.println("카카오:" + kakaoAuthUrl);		
		model.addAttribute("urlKakao", kakaoAuthUrl);
		
		/* 구글 URL */
		String googleAuthUrl = googleLoginBo.getAuthorizationUrl(session);
		System.out.println("구글:" + googleAuthUrl);		
		model.addAttribute("urlGoogle", googleAuthUrl);
		
		return "member/memberLoginForm";
	}
	
	/**
	 * 약관 동의 페이지
	 */
	@RequestMapping("agreeForm.me")
	public String agreeForm() {
		return "member/memberAgreeForm";
	}
	/**
	 * 회원가입페이지 이동
	 */
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping("insert.me")
	public void insertMember(Member m, HttpSession session, Model model, String checkId, String checkNick, RedirectAttributes redirectAttributes) {
		int result1 = memberService.idCheck(checkId);
		
		int result2 = memberService.nickCheck(checkNick);
		
		System.out.println("암호화 전 비밀번호 : "+ m.getMemPwd());
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		// 암호화된 비밀번호 Memeber m에 넣음
		m.setMemPwd(encPwd);
		
		System.out.println("암호화 후 비밀번호 : "+m.getMemPwd());
		

		if(result1 == 0 && result2 == 0) {
			System.out.println(result1+", "+result2);
			int result3 = memberService.insertMember(m);
			
			if(result3 == 0) {
				redirectAttributes.addFlashAttribute("flag","showAlert");
			}
		}else {
			redirectAttributes.addFlashAttribute("flag","showAlert");
		}
	}
	
	/**
	 * 닉네임 아이디 검사
	 */
	@RequestMapping("idCheck.me")
	@ResponseBody
	public int idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		return result;
	}
	
	/**
	 * 닉네임중복검사
	 */
	@RequestMapping("nickCheck.me")
	@ResponseBody
	public int nickCheck(String checkNick) {
		int result = memberService.nickCheck(checkNick);
		return result;
	}
	
	/**
	 * 아이디 찾기
	 */
	@RequestMapping("findId.me")
	@ResponseBody
	public String findId(String memName, String phone, Model model) {
		Member m = new Member();
		m.setMemName(memName);
		m.setPhone(phone);
		String memberId = memberService.findId(m);

		model.addAttribute("memberId", memberId);
		return memberId;
	}
	
	/**
	 * 비밀번호 찾기
	 */
	@RequestMapping("findPwd.me")
	@ResponseBody
	public int findPwd(String id, String email, HttpServletResponse response) throws Exception {
		Member m = new Member();
		m.setMemId(id);
		m.setEmail(email);
		int result = memberService.findPwd(response, m);
		return result;
	}
	
	/**
	 * 로그인
	 */
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		Member loginUser = memberService.loginMember(m);
		int memNo = loginUser.getMemNo();
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {// 로그인 성공
			Image profile = memberService.selectProfile(memNo);

			if(loginUser.getRole().equals("A")) {
				session.setAttribute("loginUser", loginUser);

				return "redirect:admin/memListForm.me";

			}else {
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("profile", profile);
				return "redirect:main";				
			}
		}else {
			redirectAttributes.addFlashAttribute("flag","showAlert");
			return "redirect:loginForm.me";
		}
	}
	
	/**
	 * 로그아웃
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		session.removeAttribute("profile");
		return "home";
	}	
	
	/**
	 * 아이디, 비밀번호 찾기 페이지
	 */
	@RequestMapping("find.me")
	public String find() {
		return "member/memberFindForm";
	}
	

	
	@RequestMapping(value="logout")
    public String logout(HttpSession session) {
        String access_Token = (String)session.getAttribute("access_Token");
        String oauthToken = (String)session.getAttribute("signIn");

        if(access_Token != null && !"".equals(access_Token)){
            memberService.kakaoLogout(access_Token);
            session.removeAttribute("access_Token");
            session.removeAttribute("loginUser");
            session.removeAttribute("profile");
        }else{
            System.out.println("access_Token is null");
            //return "redirect:/";
        }
        
        if(oauthToken != null && !"".equals(oauthToken)){
            //memberService.naverLogout(oauthToken);
            session.removeAttribute("signIn");
            session.removeAttribute("loginUser");
            session.removeAttribute("profile");
        }else{
            System.out.println("oauthToken is null");
        }
        
        return "redirect:/";
    }
	
	
	
	/**
	 * 네이버 로그인 성공시 callback호출 메소드
	 */ 
	@RequestMapping(value = "navercallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackNaver(Member m, Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("로그인 성공 callbackNaver");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
		System.out.println("oauthToken : "+oauthToken);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println("apiResult : "+ apiResult);
	    
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");	
		
		System.out.println("response_obj : "+response_obj);
		
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("nickname");
		String nickname = randomRangeN(100000, 999999); 
		System.out.println("email : "+ email);
		System.out.println("name : "+ name);
        
		
		m.setMemId(nickname);
		m.setEmail(email);
		m.setMemName(name);
		m.setSnsType("N");
		m.setMemNickname(nickname);
		
		Member userInfo = memberService.findMember(m);
		
		int memNo = userInfo.getMemNo();
		Image profile = memberService.selectProfile(memNo);
		
		if (userInfo.getMemId() != null) {
			session.setAttribute("loginUser", userInfo);
            session.setAttribute("signIn", apiResult);
            session.setAttribute("profile", profile);
            session.setAttribute("oauthToken", oauthToken);
        }

		System.out.println("getMemNickname : "+ m.getMemNickname());
        
		return "redirect:main";
	}
	

	/**
	 * 마이페이지
	 */
	// 카카오 로그인 성공시 callback
	@RequestMapping(value = "kakaoLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackKakao(Member m, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
			throws Exception {
		System.out.println("로그인 성공 callbackKako");
		System.out.println("code : "+code );
		System.out.println("state : "+state);
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state);	
		
		// 로그인 사용자 정보를 읽어온다
		apiResult = kakaoLoginBO.getUserProfile(oauthToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");	
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj2.get("nickname");
		String nickname = randomRangeK(100000, 999999);
		
		// 세션에 사용자 정보 등록
		m.setMemId(nickname);
		m.setEmail(email);
		m.setMemName(name);
		m.setMemNickname(nickname);
		m.setSnsType("K");
		
		Member userInfo = memberService.findMember(m);
		
		int memNo = userInfo.getMemNo();
		Image profile = memberService.selectProfile(memNo);
		
		if (userInfo.getMemId() != null) {
			session.setAttribute("loginUser", userInfo);
            session.setAttribute("signIn", apiResult);
            session.setAttribute("profile", profile);
            session.setAttribute("oauthToken", oauthToken);
        }

		return "redirect:main";
	}
	
	//	구글 로그인 callback
	@RequestMapping(value = "/googleCallback",method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Member m, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		System.out.println("구글 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = googleLoginBo.getAccessToken(session, code, state);
		System.out.println(oauthToken.toString());
		apiResult = googleLoginBo.getUserProfile(oauthToken);
		System.out.println(apiResult);
		JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject)parser.parse(apiResult);
        
        
        
        System.out.println(jsonObject.toString());
        String email=(String) jsonObject.get("email");
        
        String nickname = randomRangeG(100000, 999999);
          
     // 세션에 사용자 정보 등록
 		m.setMemId(nickname);
 		m.setEmail(email);
 		m.setMemName(email);
 		m.setMemNickname(nickname);
 		m.setSnsType("G");
 		
 		Member userInfo = memberService.findMember(m);
 		
 		int memNo = userInfo.getMemNo();
 		Image profile = memberService.selectProfile(memNo);
 		
 		if (userInfo.getMemId() != null) {
 			session.setAttribute("loginUser", userInfo);
             session.setAttribute("signIn", apiResult);
             session.setAttribute("profile", profile);
             session.setAttribute("oauthToken", oauthToken);
         }

 		return "redirect:main";
        
	}
	
	
	// 닉네임 랜덤생성 (naver)
	public static String randomRangeN(int n1, int n2) {
		double num = (((Math.random() * (n2 - n1 + 1)) + n1));
		return (String) "N"+(int)(Math.floor(num));
	}
	
	// 닉네임 랜덤생성(kakao)
	public static String randomRangeK(int n1, int n2) {
		double num = (((Math.random() * (n2 - n1 + 1)) + n1));
		return (String) "K"+(int)(Math.floor(num));
	}
	
	// 닉네임 랜덤생성(google)
		public static String randomRangeG(int n1, int n2) {
			double num = (((Math.random() * (n2 - n1 + 1)) + n1));
			return (String) "G"+(int)(Math.floor(num));
		}
	
	//SNS 로그인 회원탈퇴
	@GetMapping("remove")
	public String removeNaver(HttpSession session, HttpServletRequest request, Model model,
			                  @RequestParam(value="mode", defaultValue= "naver") String mode) {
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		OAuth2AccessToken oauthToken = (OAuth2AccessToken) session.getAttribute("oauthToken");
		String apiUrl = "";
		if(mode.equals("naver")) {
			apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+NaverLoginBO.CLIENT_ID+
					"&client_secret="+NaverLoginBO.CLIENT_SECRET+"&access_token="+oauthToken.getAccessToken()+"&service_provider=NAVER";
			try {
				String res = requestToServer(apiUrl);
				model.addAttribute("res", res); //결과값 찍어주는용
				int result = memberService.deleteMember(memId);
				if(result > 0) {
					session.invalidate();				
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(mode.equals("kakao")){
			String access_Token = oauthToken.getAccessToken();

			apiUrl = "https://kapi.kakao.com/v1/user/unlink";
			
			unlink(apiUrl, access_Token);
			int result = memberService.deleteMember(memId);
			if(result > 0) {
				session.invalidate();			
			}
		}else if(mode.equals("google")) {
			apiUrl = "https://oauth2.googleapis.com/revoke?token="+oauthToken.getAccessToken();
			int result = memberService.deleteMember(memId);
			
			if(result > 0) {
				session.invalidate();			
			}
		}
		
	    return "redirect:/";
	}

	
	//카카오 회원탈퇴 서버연결
	public void unlink(String apiURL, String access_Token) {
	    try {
	        URL url = new URL(apiURL);
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
	        e.printStackTrace();
	    }
	}
	
		
	//네이버 회원탈퇴 서버연결
	 private String requestToServer(String apiURL) throws IOException {
		    String headerStr = null;
		 
		    URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    System.out.println("header Str: " + headerStr);
		    con.setRequestProperty("Authorization", headerStr);

		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    System.out.println("responseCode="+responseCode);
		    if(responseCode == 200) { // 정상 호출
		      br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {  // 에러 발생
		      br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    String inputLine;
		    StringBuffer res = new StringBuffer();
		    while ((inputLine = br.readLine()) != null) {
		      res.append(inputLine);
		    }
		    br.close();
		    if(responseCode==200) {
		    	String new_res=res.toString().replaceAll("&#39;", "");
				 return new_res; 
		    } else {
		      return null;
		    }
		  }
	 

	@RequestMapping("myPage.me")
	public String myPage(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		
		Image profile = memberService.selectProfile(memNo);
		
		if(profile != null) {
			session.setAttribute("profile", profile);
		}
		return "member/myPage";				
		
	}
	
	/**
	 * 프로필사진 넣기
	 */
	@PostMapping("insertImg.me")
	public String insertImg(Image image,
							MultipartFile upfile, // 일반게시판 첨부파일
							HttpSession session,
							Model model,
							@RequestParam(value="mode", required=false, defaultValue= "insert") String mode) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Image profile = (Image) session.getAttribute("profile");
		
		String filePath = "/resources/profileImg";
		
		int result = 0;
		
		if(loginUser != null) {
			int memNo = loginUser.getMemNo();
			System.out.println("memNo : " + memNo);
			image.setRefTno(memNo);
		}
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String savePath = session.getServletContext().getRealPath("/resources/profileImg/");
			String changeName = Utils.saveFile(upfile, savePath);
		
			
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				logger.error(e.getMessage());
			}
					
			if(upfile.getName() != null && !upfile.getName().equals("") && profile != null ) {
				File path = new File(application.getRealPath("/resources/profileImg"));
				new File(path+profile.getChangeName()).delete();
			}
			
			image.setOriginName(upfile.getOriginalFilename());
			image.setChangeName("/"+changeName);
			image.setFilePath(filePath);
			
		}
		
		if(mode.equals("insert")) {
			result = memberService.insertImg(image);
		}else if(mode.equals("update")){
			result = memberService.updateImg(image); 
		}else if(mode.equals("delete")){
			result = memberService.deleteImg(profile.getFileNo());
		}
		
		
		if(result > 0 && !mode.equals("delete")) {
			loginUser.setImage(image);
			session.setAttribute("loginUser", loginUser);
			return "redirect:myPage.me";
		}
		else if(result > 0 && mode.equals("delete")) {			
			File path = new File(application.getRealPath("/resources/profileImg"));
			new File(path+profile.getChangeName()).delete();
			
			session.removeAttribute("profile");			
			return "redirect:myPage.me";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 프로필사진 삭제
	 */
	@RequestMapping("deleteImg.me")
	@ResponseBody
	public String deleteImg(int fileNo, HttpSession session, MultipartFile upfile) {
		
		Image profile = (Image) session.getAttribute("profile");
		
		int result = memberService.deleteImg(fileNo);
		
				
		
		if(result > 0) {
			File path = new File(application.getRealPath("/resources/profileImg"));
			new File(path+profile.getChangeName()).delete();
			
			session.removeAttribute("profile");
			
			return "1";
		} else {
			
			return "0";
		}
	
		
	}
	
	
	
	/**
	 * 회원정보수정 페이지
	 */
	@RequestMapping("memUpdateForm.me")
	public String memberUpdateForm() {
		return "member/memberUpdateForm";
	}
	
	/**
	 * 회원정보수정
	 */
	@RequestMapping("memUpdate.me")
    public String updateMember(Member m, HttpSession session, Model model) {
       // 1. 회원정보 업데이트
          
       // 암호화 작업
       String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
       
       // 암호화된 비밀번호 Memeber m에 넣음
       m.setMemPwd(encPwd);
    
       int result = memberService.updateMember(m);
             
       
       if(result > 0) {
          Member updateMem = memberService.loginMember(m);
          
          //업데이트 성공했으니 디비에 등록된 변경된 정보 가져오기
          session.setAttribute("loginUser", updateMem);
          session.setAttribute("alertMsg", "회원정보수정 성공!");
          
          return "redirect:myPage.me";
       } else {
          // 3. 업데이트 실패시 -> 에러메세지 추가, 에러페이지 이동
          model.addAttribute("errorMsg","회원정보수정 실패");
          return "common/errorPage";
       }
	}
	
	/**
	 * 소셜 로그인 닉네임 수정 
	 */
	@RequestMapping("memUpdateNick.me")
	public String updateMemberNick(Member m, HttpSession session, Model model) {
		// 1. 회원정보 업데이트
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setMemId(loginUser.getMemId());
		m.setEmail(loginUser.getEmail());
		m.setMemNo(loginUser.getMemNo());
		int result = memberService.updateMemberNick(m);
		
		
		if(result > 0) {
			Member updateMem = memberService.loginMember(m);
			System.out.println(updateMem);
			//업데이트 성공했으니 디비에 등록된 변경된 정보 가져오기
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "닉네임 변경 성공!");
			
			return "redirect:myPage.me";
		} else {
			// 3. 업데이트 실패시 -> 에러메세지 추가, 에러페이지 이동
			model.addAttribute("errorMsg","닉네임 변경 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 회원탈퇴페이지
	 */
	@RequestMapping("memDeleteForm.me")
	public String memberDeleteForm() {
		return "member/memberDeleteForm";
	}
	
	/**
	 * 회원탈퇴
	 */
	@RequestMapping("memDelete.me")
	public String deleteMember(String memPwd, HttpSession session, RedirectAttributes redirectAttributes) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) {
			
			int result = memberService.deleteMember(memId);
			if(result > 0) {
				
				redirectAttributes.addFlashAttribute("flag2","showAlert2");
				session.removeAttribute("loginUser");
				return "redirect:/";
				
			} else {
				
				redirectAttributes.addFlashAttribute("flag3","showAlert3");
				return "redirect:memDeleteForm.me";
				
			}
		} else {
			redirectAttributes.addFlashAttribute("flag","showAlert");
			
			return "redirect:memDeleteForm.me";
		}
		
	}
	
	
	
	
	
	
	
}

