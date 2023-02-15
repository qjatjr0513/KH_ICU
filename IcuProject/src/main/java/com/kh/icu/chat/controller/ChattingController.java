package com.kh.icu.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.chat.model.service.ChatService;
import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.chat.model.vo.ChatRoom;
import com.kh.icu.member.model.vo.Member;
import org.springframework.web.socket.WebSocketSession;

@Controller
@SessionAttributes({"loginUser", "chatRoomNo"})
// model에 추가된 값의 key와 SessionAttribute 어노테이션에 작성된 키값이 같으면 해당 값을 session scope에 자동으로 이동시켜줌.
public class ChattingController {
	
	@Autowired
	private ChatService chatservice;
	
	// 채팅방 목록 조회
	@GetMapping("/chat/chatRoomList.ad")
	public String selectChatRoomList(Model model, @RequestParam(value="cpage", defaultValue = "1") int currentPage,
			                         @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap();
		
		map = chatservice.selectChatRoomList(currentPage);
		
		model.addAttribute("map", map);
		return "chat/chatRoomList";
	}
	
	// 채팅방 만들기
	@PostMapping("chat/openChatRoom")
	@ResponseBody
	public int openChatRoom(int memNo, 
			                   ChatRoom room,
			                   Model model,
			                   RedirectAttributes ra, HttpSession session
								) throws Exception {
		 
		System.out.println("================"+memNo);
		room.setMemNo(memNo);
		
		int chatRoomNo = chatservice.openChatRoom(room);
//		String path = "redirect:/chat/";
		
		if(chatRoomNo > 0) {
			model.addAttribute("chatRoomNo", chatRoomNo);
			//session.setAttribute("chatRoomNo", chatRoomNo);
			System.out.println("채팅방 만들기 성공");
			
//			path += "chatRoomList";
			return chatRoomNo;
		}else {
			return 0;
		}
//		return path;
	}
	
	
	// 채팅방 입장
	@GetMapping("/chat/room/{chatRoomNo}")
	public String joinChatRoom(@ModelAttribute("loginUser") Member loginUser,
			                   Model model, 
			                   @PathVariable("chatRoomNo") int chatRoomNo,
			                   ChatRoom join,
			                   RedirectAttributes ra,
			                   HttpSession session) {
		join.setMemNo(loginUser.getMemNo());
		List<ChatMessage> list = chatservice.selectChatMessage(join);
		
		model.addAttribute("list", list);
		model.addAttribute("chatRoomNo", chatRoomNo);
		//session.setAttribute("chatRoomNo", chatRoomNo);
		
		return "chat/chatRoom";
	}
	
	// 채팅방 나가기
	@RequestMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(int memNo, int chatRoomNo, 
			                ChatRoom join) {
		join.setMemNo(memNo);
		join.setChatRoomNo(chatRoomNo);
		return chatservice.exitChatRoom(join);
	}
}
