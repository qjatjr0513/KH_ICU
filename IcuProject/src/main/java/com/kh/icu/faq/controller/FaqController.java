package com.kh.icu.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.common.Utils;
import com.kh.icu.faq.model.service.FaqService;
import com.kh.icu.faq.model.vo.Faq;
import com.kh.icu.member.model.vo.Member;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqservice;
	@RequestMapping("faq.fq")
	public String faq(Model model) {
		List<Faq> list = faqservice.selectFaqList(); 
		
		model.addAttribute("list", list);
		
		return "faq/faqForm";
	}
	
	
	
}
