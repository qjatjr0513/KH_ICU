package com.kh.icu.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.chat.model.service.ChatService;
import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.chat.model.vo.ChatRoom;
import com.kh.icu.member.model.vo.Member;

@Controller
@SessionAttributes({"loginUser", "chatRoomNo"})
// model에 추가된 값의 key와 SessionAttribute 어노테이션에 작성된 키값이 같으면 해당 값을 session scope에 자동으로 이동시켜줌.
public class ChattingController {
	
	@Autowired
	private ChatService chatservice;
	
	// 채팅방 목록 조회
	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(Model model) {
		List<ChatRoom> crList = chatservice.selectChatRoomList();
		model.addAttribute("chatRoomList", crList);
		return "chat/chatRoomList";
	}
	
	// 채팅방 만들기
	@PostMapping("chat/openChatRoom")
	public String openChatRoom(@ModelAttribute("loginUser") Member loginUser, 
			                   Model model, 
			                   ChatRoom room, 
			                   RedirectAttributes ra) {
		room.setMemNo(loginUser.getMemNo());
		
		int chatRoomNo = chatservice.openChatRoom(room);
		String path = "redirect:/chat/";
		
		if(chatRoomNo > 0) {
			System.out.println("채팅방 만들기 성공");
			path += "chatRoomList";
		}else {
			model.addAttribute("errorMsg", "채팅방 만들기 실패");
			return "common/errorPage";
		}
		return path;
	}
	
	// 채팅방 입장
	@GetMapping("/chat/room/{chatRoomNo}")
	public String joinChatRoom(@ModelAttribute("loginUser") Member loginUser,
			                   Model model, 
			                   @PathVariable("chatRoomNo") int chatRoomNo,
			                   ChatRoom join,
			                   RedirectAttributes ra) {
		join.setMemNo(loginUser.getMemNo());
		List<ChatMessage> list = chatservice.selectChatMessage(join);
		
		model.addAttribute("list", list);
		model.addAttribute("chatRoomNo", chatRoomNo);
		
		return "chat/chatRoom";
	}
	
	// 채팅방 나가기
	@GetMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(@ModelAttribute("loginUesr") Member loginUser, 
			                ChatRoom join) {
		join.setMemNo(loginUser.getMemNo());
		return chatservice.exitChatRoom(join);
	}
}
