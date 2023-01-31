package com.kh.icu.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet Filter implementation class InitFilter
 */
public class InitFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(InitFilter.class);
	
    /**
     * Default constructor. 
     */
    public InitFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		logger.info("초기화 필터 종료");
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// application 내장 객체 얻어오기
		ServletContext application = ((HttpServletRequest) request).getSession().getServletContext();
		
		// 모든 영역에서 spring을 사용하려고함.
		// application scope - session scope - request scope - page scope
		String contextPath = ((HttpServletRequest) request).getContextPath(); //spring
		
		application.setAttribute("contextPath", contextPath);
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		logger.info("초기화 필터 생성");
		// TODO Auto-generated method stub
	}

}
