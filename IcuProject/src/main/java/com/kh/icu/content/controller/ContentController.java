package com.kh.icu.content.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.icu.content.model.service.ContentService;
import com.kh.icu.content.model.vo.Coment;
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
	
	@RequestMapping("/detail")
	public String contentDetail(@RequestParam(value = "conNo") int conNo
			, HttpSession session, Model model) {
		Content c = contentService.selectContent(conNo);
		ArrayList<String> genre = new ArrayList<String>();
		genre = contentService.selectGenre(conNo);
		model.addAttribute("content", c);
		model.addAttribute("genre", genre);
		System.out.println(genre);
		return "content/contentDetail";
	}
	
	@RequestMapping("/comment.co")
	@ResponseBody
	public String selectReview(int conNo) {
		ArrayList<Coment> list = contentService.selectReview(conNo);
		Gson gson = new GsonBuilder().create();

		String result = gson.toJson(list);
		System.out.println(result);
		return result;
	}
	
}