package com.kh.icu.content.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.icu.content.model.service.ContentService;
import com.kh.icu.content.model.vo.Content;

@Controller
public class ContentController {
	private ContentService contentService;
	
	public ContentController(ContentService contentService) {
		this.contentService = contentService;
	}
	
	@RequestMapping("contentList.co")
	public String contentList(HttpSession session, Model model) {
		//Map<String, Object> list = contentService.selectList();
		ArrayList<Content> list2 = contentService.selectList();
//		System.out.println("====================");
//		System.out.println("list : "+list2);
//		System.out.println("====================");
		
		model.addAttribute("list", list2);
		
		return "content/contentMainPage";
	}
	
	@RequestMapping("content/detail/{conNo}")
	public String contentDetail(@PathVariable("conNo") int conNo, HttpSession session, Model model) {
		Content c = contentService.selectContent(conNo);
		model.addAttribute("content", c);
		System.out.println(c);
		return "content/contentDetail";
	}
	
}