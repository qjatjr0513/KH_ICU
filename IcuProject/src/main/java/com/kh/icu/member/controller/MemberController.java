package com.kh.icu.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.icu.member.model.service.MemberService;
import com.kh.icu.member.model.service.NaverLoginBO;
import com.kh.icu.member.model.vo.Member;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	private BCryptPasswordEncoder bcryptPasswordEncoder; // 암호화
	
	@Autowired
	private HttpSession session;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	  
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("loginForm.me")
	public String loginForm(Model model, HttpSession session) {
		
		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		/* 인증요청문 확인 */
		System.out.println("네이버:" + naverAuthUrl);
		/* 객체 바인딩 */
		model.addAttribute("url", naverAuthUrl);
		
		return "member/memberLoginForm";
	}
	
	@RequestMapping("agreeForm.me")
	public String agreeForm() {
		return "member/memberAgreeForm";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model, String checkId, String checkNick) {
		int result1 = memberService.idCheck(checkId);
		
		int result2 = memberService.nickCheck(checkNick);
		
		System.out.println("암호화 전 비밀번호 : "+ m.getMemPwd());
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		// 암호화된 비밀번호 Memeber m에 넣음
		m.setMemPwd(encPwd);
		
		System.out.println("암호화 후 비밀버호 : "+m.getMemPwd());
		

		if(result1 == 0 && result2 == 0) {
			System.out.println(result1+", "+result2);
			int result3 = memberService.insertMember(m);
			
			if(result3 > 0) {
				session.setAttribute("alertMsg", "회원가입 성공");
				return "member/memberLoginForm";
			}else {
				model.addAttribute("errorMsg", "회원가입 실패");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	

	// 닉네임 아이디 검사
	@RequestMapping("idCheck.me")
	@ResponseBody
	public int idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		return result;
	}
	

	// 닉네임 중복 검사

	@RequestMapping("nickCheck.me")
	@ResponseBody
	public int nickCheck(String checkNick) {
		int result = memberService.nickCheck(checkNick);
		return result;
	}
	
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

	//로그인
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			return "common/main";
		}else {
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		}
	}

	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "home";
	}	
	
	  
	@RequestMapping("find.me")
	public String find() {
		return "member/memberFindForm";
	}
	

	
	
	@RequestMapping(value="/kakaoLogin")
    public String login(@RequestParam("code") String code, HttpSession session) {
		System.out.println("code : " + code);

        String access_Token = memberService.getAccessToken(code);
        System.out.println("access_Token : " + access_Token);
        
        Member userInfo = memberService.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);

        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.getMemId() != null) {
            session.setAttribute("userId", userInfo.getMemId());
            session.setAttribute("userNick", userInfo.getMemNickname());
            session.setAttribute("access_Token", access_Token);
        }

        return "common/main";
    }
	
	
	@RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        String access_Token = (String)session.getAttribute("access_Token");
        String oauthToken = (String)session.getAttribute("signIn");

        if(access_Token != null && !"".equals(access_Token)){
            memberService.kakaoLogout(access_Token);
            session.removeAttribute("access_Token");
            session.removeAttribute("userId");
            session.removeAttribute("userNick");
        }else{
            System.out.println("access_Token is null");
            //return "redirect:/";
        }
        
        if(oauthToken != null && !"".equals(oauthToken)){
            //memberService.naverLogout(oauthToken);
            session.removeAttribute("signIn");
            session.removeAttribute("userId");
            session.removeAttribute("userNick");
        }else{
            System.out.println("oauthToken is null");
            //return "redirect:/";
        }
        
        //return "index";
        return "redirect:/";
    }
	
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/navercallback", method = { RequestMethod.GET, RequestMethod.POST })
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
		
		System.out.println("email : "+ email);
		System.out.println("name : "+ name);
        
		
		m.setMemId(email);
		m.setMemName(name);
		
		Member userInfo = memberService.findMember(m);
		
		if (userInfo.getMemId() != null) {
            session.setAttribute("userId", userInfo.getMemId());
            session.setAttribute("userNick", userInfo.getMemNickname());
            session.setAttribute("signIn", apiResult);
        }

		System.out.println("getMemNickname : "+ m.getMemNickname());
        
		return "common/main";
	}


}
