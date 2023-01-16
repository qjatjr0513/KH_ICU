package com.kh.icu.content.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.icu.content.model.service.ContentService;

@Controller
public class ContentController {
	private ContentService cService;
	
	@RequestMapping("contentList.co")
	public String contentList() {
		return "content/contentMainPage";
	}
	
}