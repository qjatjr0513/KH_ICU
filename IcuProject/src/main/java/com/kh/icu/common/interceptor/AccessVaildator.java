package com.kh.icu.common.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.icu.member.model.vo.Member;

public class AccessVaildator implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies.
		String requestUrl = request.getRequestURL().substring(request.getContextPath().length());
		
		// 권한 체크
		String role = getGrade(request.getSession());
		
		// 로그인 안한 사용자
		if(role == null) {// 권한이 없음
			
			try {
				request.setAttribute("errorMsg", "1");
				request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		
		// 관리자인 경우
		if(requestUrl.indexOf("admin") > -1 && !role.equals("A")) {
			try {
				request.setAttribute("errorMsg", "2");
				request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		// 모두 통과했을때
	    return true;
	}
	
	public String getGrade(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return null;
		}
		
		return loginUser.getRole();
	}
}
