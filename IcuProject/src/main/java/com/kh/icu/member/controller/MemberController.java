package com.kh.icu.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Image;
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
	
	@RequestMapping("findPwd.me")
	@ResponseBody
	public void findPwd(String id, String email, HttpServletResponse response) throws Exception {
		Member m = new Member();
		m.setMemId(id);
		m.setEmail(email);
		memberService.findPwd(response, m);
	}
	
	//로그인
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {// 로그인 성공
			if(loginUser.getMemId().equals("admin")) {
				session.setAttribute("loginUser", loginUser);
				return "admin/memberListForm";
			}else {
				session.setAttribute("loginUser", loginUser);
				return "common/main";				
			}
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
        	session.setAttribute("loginUser", userInfo);
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
            session.removeAttribute("loginUser");
        }else{
            System.out.println("access_Token is null");
            //return "redirect:/";
        }
        
        if(oauthToken != null && !"".equals(oauthToken)){
            //memberService.naverLogout(oauthToken);
            session.removeAttribute("signIn");
            session.removeAttribute("loginUser");
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
			session.setAttribute("loginUser", userInfo);
            session.setAttribute("signIn", apiResult);
        }

		System.out.println("getMemNickname : "+ m.getMemNickname());
        
		return "common/main";
	}
	@RequestMapping("myPage.me")
	public String myPage(Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String profile = memberService.selectProfile(m);
		System.out.println(m);
		if(profile != "") {
			model.addAttribute("profile", profile);
			return "member/myPage";			
		}else {
			return "common/errorPage";
		}
	}
	
	@PostMapping("insertImg.me")
	public String insertImg(Image image,
							MultipartFile upfile, // 일반게시판 첨부파일
							HttpSession session,
							Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
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
			
			image.setOriginName(upfile.getOriginalFilename());
			image.setChangeName("/resources/profileImg/" + changeName) ;
			
			}
		int result = memberService.insertImg(image);
		
		if(result > 0) {
			
			loginUser.setImage(image);
			session.setAttribute("loginUser", loginUser);
			return "redirect:myPage.me";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping("updateImg.me")
	public String updateImg(Image image,
							MultipartFile upfile, 
							HttpSession session,
							Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String webPath = "/resources/profileImg/";
		String serverFolderPath  = session.getServletContext().getRealPath(webPath);
		
		if(loginUser != null) {
			int memNo = loginUser.getMemNo();
			System.out.println("memNo : " + memNo);
			image.setRefTno(memNo);
		}
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String savePath = session.getServletContext().getRealPath("/resources/profileImg/");
			String changeName = Utils.saveFile(upfile, savePath);
			image.setOriginName(upfile.getOriginalFilename());
			image.setChangeName("/resources/profileImg/" + changeName) ;
			
			if(upfile.getName() != null && !upfile.getName().equals("") ) {
				File path = new File(application.getRealPath("/resources/profileImg"));
				new File(path+upfile.getOriginalFilename()).delete();
			}
		}
		int result = memberService.updateImg(image, webPath, serverFolderPath);
		
		if(result > 0) {
			return "redirect:myPage.me";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}

	
	@RequestMapping("memUpdateForm.me")
	public String memberUpdateForm() {
		return "member/memberUpdateForm";
	}
	
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
          
          return "redirect:/";
       } else {
          // 3. 업데이트 실패시 -> 에러메세지 추가, 에러페이지 이동
          model.addAttribute("errorMsg","회원정보수정 실패");
          return "common/errorPage";
       }
	}
	
	@RequestMapping("memDeleteForm.me")
	public String memberDeleteForm() {
		return "member/memberDeleteForm";
	}
	
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

