package com.kh.icu;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.icu.common.model.service.AlarmService;
import com.kh.icu.content.model.service.ContentService;
import com.kh.icu.content.model.vo.Content;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private ContentService contentService;
	
	public HomeController(ContentService contentService) {
		this.contentService = contentService;
	}
	
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("/")
	public String home(HttpSession session, Model model, HttpServletResponse res) {
		return "home";	
	}
	
	@RequestMapping("main")
	public String main(Model model, @RequestParam(value="mesNo", required=false, defaultValue="0") int mesNo) {
		ArrayList<Content> recommend = contentService.recommendContents();
		model.addAttribute("recommend", recommend);
		int result = alarmService.readAlarm(mesNo);
		
		
		return "common/main";
	}
	
}
