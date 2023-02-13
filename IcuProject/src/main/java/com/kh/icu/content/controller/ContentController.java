package com.kh.icu.content.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.content.model.service.ContentService;
import com.kh.icu.content.model.vo.Coment;
import com.kh.icu.content.model.vo.Content;
import com.kh.icu.member.controller.MemberController;
import com.kh.icu.member.model.vo.Member;

@Controller
public class ContentController {
	private ContentService contentService;

	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);
	
	public ContentController(ContentService contentService) {
		this.contentService = contentService;
	}
	
	@Autowired
	private ServletContext application;
	
	
	@RequestMapping("contentList.co")
	public String contentList(HttpSession session, Model model) {
		//Map<String, Object> list = contentService.selectList();
		ArrayList<Content> list2 = contentService.selectList();
//		System.out.println("====================");
//		System.out.println("list : "+list2);
//		System.out.println("====================");
		double cmtStar = 0.0;
		
		for(int i = 0; i < list2.size(); i++) {
			try {
				cmtStar = contentService.selectStar(list2.get(i).getConNo());
			}
			catch(NullPointerException e) {
				cmtStar = 0.0;
			}
			list2.get(i).setCmtStar(cmtStar);
		}
		
		for(int i = 0; i < list2.size(); i++) {
			if(list2.get(i).getFilePath() == null) {
				list2.get(i).setFilePath("");
			}
		}
		model.addAttribute("list", list2);
		return "content/contentMainPage";
	}
	
	@RequestMapping("/detail")
	public String contentDetail(@RequestParam(value = "conNo") int conNo
			, HttpSession session, Model model) {
		Content c = contentService.selectContent(conNo);
		Member loginUser = (Member)session.getAttribute("loginUser");		
		int memNo =0;
		String memId = "";
		if(loginUser != null) {
			memNo = loginUser.getMemNo();
			memId = loginUser.getMemId();
		}
		
		ArrayList<String> genre = new ArrayList<String>();
		genre = contentService.selectGenre(conNo);

		model.addAttribute("content", c);
		model.addAttribute("genre", genre);
		model.addAttribute("memNo", memNo);
		model.addAttribute("memId", memId);
		
		return "content/contentDetail";
	}
	
	@RequestMapping("/comment.co")
	@ResponseBody
	public String selectReview(int conNo) {
		ArrayList<Coment> list = contentService.selectReview(conNo);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getFilePath() == null && list.get(i).getChangeName() == null) {
				list.get(i).setFilePath("");
				list.get(i).setChangeName("");
				
			}
		}
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
			@RequestParam(value="age[]") ArrayList<String> age,
			@RequestParam(value="ott[]") ArrayList<String> ott,
			@RequestParam(value="category[]") ArrayList<String> category) {
		ArrayList<Content> list = new ArrayList<Content>();
		Gson gson = new GsonBuilder().create();
		
		genre.remove(0);
		age.remove(0);
		ott.remove(0);
		category.remove(0);
		
		Map<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		map.put("genre", genre);
		map.put("age", age);
		map.put("ott", ott);
		map.put("category", category);
		
		System.out.println(map);

		list = contentService.searchContentCategory(map);
		
		double cmtStar = 0.0;
		
		for(int i = 0; i < list.size(); i++) {
			try {
				cmtStar = contentService.selectStar(list.get(i).getConNo());
			}
			catch(NullPointerException e) {
				cmtStar = 0.0;
			}
			list.get(i).setCmtStar(cmtStar);
		}
		
		String result = gson.toJson(list);
		System.out.println(list);
		//System.out.println(genre);
		//System.out.println(age);
		return result;
	}
	
	
	
	@RequestMapping("/searchByKeyword.co")
	public String searchByKeyword(@RequestParam(value = "searchNo") int searchNo,
								@RequestParam(value = "keyword") String keyword,
								HttpSession session, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		double cmtStar = 0.0;
		
		map.put("searchNo", searchNo);
		map.put("keyword", keyword);
		
		ArrayList<Content> list = contentService.searchByKeyword(map);
		
		for(int i = 0; i < list.size(); i++) {
			try {
				cmtStar = contentService.selectStar(list.get(i).getConNo());
			}
			catch(NullPointerException e) {
				cmtStar = 0.0;
			}
			list.get(i).setCmtStar(cmtStar);
		}
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getFilePath() == null) {
				list.get(i).setFilePath("");
			}
		}
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "content/searchContent";
	}
	
	@RequestMapping("/autoSearch.co")
	@ResponseBody
	public String autoSearch(HttpServletRequest request, HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		String selectOption = request.getParameter("selectOption");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selectOption", selectOption);
		map.put("keyword", keyword);
		
		ArrayList<Content> list = contentService.autoSearch(map);
		
		double cmtStar = 0.0;
		
		for(int i = 0; i < list.size(); i++) {
			try {
				cmtStar = contentService.selectStar(list.get(i).getConNo());
			}
			catch(NullPointerException e) {
				cmtStar = 0.0;
			}
			list.get(i).setCmtStar(cmtStar);
		}
		
		Gson gson = new GsonBuilder().create();
		String result = gson.toJson(list);
		
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping("/commentDelete.co")
	@ResponseBody
	public int deleteReview(int cmtNo) {
		
		int result = contentService.deleteReview(cmtNo);
		
		System.out.println(result);
		return result;
	}
}