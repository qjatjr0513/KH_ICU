package com.kh.icu.board.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.board.model.service.BoardService;
import com.kh.icu.board.model.vo.Board;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.service.AlarmService;
import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.member.model.vo.Member;

@Controller
public class BoardController {
   
   @Autowired
   private BoardService boardService;
   
   @Autowired
   private AlarmService alarmService;
   
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   /**
    * 자유게시판 리스트 조회
    */
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
   
   /**
    * 게시글 등록페이지 이동
    */
   @RequestMapping("/enrollForm")
   public String boardEnrollForm(Model model,
                           @RequestParam(value="mode", required =false, defaultValue = "insert") String mode,
                           @RequestParam(value="bno", required =false, defaultValue = "0") int bno) {

      if(mode.equals("update")) {
         
         Board b = boardService.selectBoard(bno);
         
     	// 개행문자가 <br>태그로 치환되어있는 상태
		// textarea에 출력할 것이기 때문에 \n으로 변경해줌.
         b.setBoardContent(Utils.newLineClear(b.getBoardContent()));
         
         model.addAttribute("b", b);
      }
      
      
      return "board/boardEnrollForm";
   }
   
   /**
    * 게시글 등록하기
    */
   @RequestMapping("/insert")
   public String insertBoard(Board b, HttpSession session, Model model,
                        @RequestParam(value="mode", required=false, defaultValue="insert") String mode,
                        RedirectAttributes redirectAttributes) {
      int result =0;
      Member loginUser = (Member)session.getAttribute("loginUser");	
      
      if(mode.equals("insert")) {
         result = boardService.insertBoard(b);
      }else {
         result = boardService.updateBoard(b);
      }
      
      if(result > 0) {
    	 redirectAttributes.addFlashAttribute("flag","showAlert2");
    	 if(loginUser.getRole().equals("A")) {
    		 return "redirect:admin/noticeList.bo";
    	 }
    	 else {
    		 return "redirect:list.bo";
    	 }
      } else {
    	 redirectAttributes.addFlashAttribute("flag","showAlert3");
    	 if(loginUser.getRole().equals("A")) {
     		 return "redirect:admin/noticeList.bo";
     	 }
     	 else {
     		 return "redirect:list.bo";
     	 }
      }
      
   }
   
   /**
    * 게시글 번호에 따라 게시글 상세페이지
    */
   @RequestMapping("detail/{boardNo}")
   public ModelAndView selectBoard(@PathVariable("boardNo") int boardNo,
                           HttpSession session,
                           ModelAndView mv,
                           @RequestParam(value="mesNo", required=false, defaultValue="0") int mesNo,
                           RedirectAttributes redirectAttributes) {
      Board b = boardService.selectBoard(boardNo);
      ArrayList<Reply> list = boardService.selectReplyList(boardNo);
      
     
      
      if(b != null) {
         // 상세조회 성공
         Member loginUser = (Member)session.getAttribute("loginUser");
         
         // 알림 조회 상태 변경
         int result2 = alarmService.readAlarm(mesNo);
        
         
         
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
         mv.addObject("list", list );
         mv.setViewName("board/boardDetailView");
         
         
      }else {
         // 상세조회 실패
    	 redirectAttributes.addFlashAttribute("flag","showAlert4");
         mv.setViewName("redirect:list.bo");
      }
      
      return mv;
   }
   
    
   /**
    * 게시글 댓글 등록
    */
   @RequestMapping("insertReply.bo")
   @ResponseBody
   public String insertReply(Reply r, HttpSession session) {
      System.out.println(r);
      Member m = (Member)session.getAttribute("loginUser");
      if(m != null) {
    	  String memNo = Integer.toString(m.getMemNo());
         r.setReplyWriter(memNo);
//         r.setTableCd(b.getTableCd());
      }
      if(r.getReplyContent() == "") {
         return "0";
      }else {
         int result = boardService.insertReply(r);
         
         if( result > 0) {
            
            return "1";
         } else {

            return "0";
         }
      }
   }
   
   /**
    * 게시글 삭제
    */
   @RequestMapping("delete")
   public String deleteBoard(@RequestParam(value="bno", required =false, defaultValue = "0") int boardNo,
                       HttpSession session, Model model,
                       RedirectAttributes redirectAttributes) {
	  Member loginUser = (Member)session.getAttribute("loginUser");
      int result = boardService.deleteBoard(boardNo);
      
      if(result > 0) {
    	  redirectAttributes.addFlashAttribute("flag","showAlert1");
    	  if(loginUser.getRole().equals("A")) {
     		 return "redirect:admin/noticeList.bo";
     	 }
     	 else {
     		 return "redirect:list.bo";
     	 }
      } else {
    	  redirectAttributes.addFlashAttribute("flag","showAlert5");
    	  if(loginUser.getRole().equals("A")) {
      		 return "redirect:admin/noticeList.bo";
      	 }
      	 else {
      		 return "redirect:list.bo";
      	 }
      }
   }
   
   /**
    * 게시글 댓글 삭제
    */
   @RequestMapping("deleteReply.bo")
   public String deleteReply(@RequestParam("rno") int rno, @RequestParam("boardNo") int boardNo,
		                     HttpSession session, Model model,
		                     RedirectAttributes redirectAttributes) {
	   int result = boardService.deleteReply(rno);
	   
	   if(result > 0) {
		   redirectAttributes.addFlashAttribute("flag","showAlert1");
	         return "redirect:detail/"+boardNo;
	      } else {
	    	  redirectAttributes.addFlashAttribute("flag","showAlert2");
	         return "redirect:detail/"+boardNo;
	      }
	   
	   
   }
   
}