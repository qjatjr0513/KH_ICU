package com.kh.icu.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.icu.board.model.service.BoardService;
import com.kh.icu.board.model.vo.Board;
import com.kh.icu.member.model.vo.Member;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model,
							 @RequestParam Map<String, Object> paramMap) {
		
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
	
	@RequestMapping("/enrollForm.bo")
	public String boardEnrollForm(Model model,
									@RequestParam(value="mode", required =false, defaultValue = "insert") String mode,
									@RequestParam(value="bno", required =false, defaultValue = "0") int bno) {
		
		if(mode.equals("update")) {
			
			Board b = boardService.selectBoard(bno);
			
			model.addAttribute("b", b);
		}
		
		
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("/insert.bo")
	public String insertBoard(Board b, HttpSession session, Model model,
								@RequestParam(value="mode", required=false, defaultValue="insert") String mode) {
		int result =0;
		if(mode.equals("insert")) {
			result = boardService.insertBoard(b);
		}else {
			result = boardService.updateBoard(b);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:../board/list.bo";
		} else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detail.bo/{boardNo}")
	public ModelAndView selectBoard(@PathVariable("boardNo") int boardNo,
									HttpSession session,
									ModelAndView mv
									) {
		Board b = boardService.selectBoard(boardNo);
		
		if(b != null) {
			// 상세조회 성공
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			int memNo =0;
			if(loginUser != null) {
				memNo = loginUser.getMemNo();
			}
			
			int result = 0;
			result = boardService.increaseCount(boardNo);
			
			if(result > 0) {
				// 성공적으로 조회수 증가
				b.setCount(b.getCount()+1);
			}
			mv.addObject("b", b);
			mv.setViewName("board/boardDetailView");
			
			
		}else {
			// 상세조회 실패
			mv.addObject("errorMsg", "게시글 조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
