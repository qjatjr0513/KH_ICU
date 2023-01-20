package com.kh.icu.content.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.icu.member.model.vo.Member;

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
		Member loginUser = (Member)session.getAttribute("loginUser");		
		int memNo =0;
		if(loginUser != null) {
			memNo = loginUser.getMemNo();
		}
		
		ArrayList<String> genre = new ArrayList<String>();
		genre = contentService.selectGenre(conNo);

		model.addAttribute("content", c);
		model.addAttribute("genre", genre);
		model.addAttribute("memNo", memNo);
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
	
	@RequestMapping("/commentInsert.co")
	@ResponseBody
	public int insertReview(int conNo, int memNo, String cmtContent, int cmtScore) {
		Coment c = new Coment();
		c.setConNo(conNo);
		c.setCmtWriter(Integer.toString(memNo));
		c.setCmtContent(cmtContent);
		c.setCmtStar(cmtScore);
		
		int result = contentService.insertReview(c);
		
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/starChange.co")
	@ResponseBody
	public double starChange(int conNo) {
		double cmtStarWidth = 0.0;
		
		try {
			cmtStarWidth = contentService.selectStar(conNo);
		}
		catch(NullPointerException e) {
			cmtStarWidth = 0.0;
		}
		
		return cmtStarWidth;
	}
	
	@RequestMapping("/searchContent.co")
	@ResponseBody
	public String searchContent(@RequestParam(value="genre[]") ArrayList<String> genre,
			@RequestParam(value="age[]") ArrayList<String> age) {
		ArrayList<Content> list = new ArrayList<Content>();
		Gson gson = new GsonBuilder().create();
		
		genre.remove(0);
		age.remove(0);
		
		Map<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		map.put("genre", genre);
		map.put("age", age);
		
		System.out.println(map);

		list = contentService.searchContentCategory(map);
		
		String result = gson.toJson(list);
		System.out.println(list);
		//System.out.println(genre);
		//System.out.println(age);
		return result;
	}
}