package com.kh.icu.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.chat.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model,
							 @RequestParam Map<String, Object> paramMap) {
		
		ArrayList<Board> list = null;
		Map<String, Object> map = new HashMap();
		
		if(paramMap.get("condition") == null) { //검색 요청을 하지 않은 경우
			
			
			map = boardService.selectList(currentPage);
			
		}else { //검색 요청을 한 경우
			
			paramMap.put("cpage", currentPage);
			
			map = boardService.searchSelectList(paramMap);
		}
		model.addAttribute("map", map);
		
		return "board/boardListView";
	}
	
}
