package com.kh.icu.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.chat.model.vo.ChatRoom;

public interface ChatService {
	
	public Map<String, Object> selectChatRoomList(int currentPage);
	
	public int selectListCount();
	
	public int openChatRoom(ChatRoom cr);
	
	public int insertMessage(ChatMessage cm);
	
	public List<ChatMessage> selectChatMessage(ChatRoom join);
	
	public int exitChatRoom(ChatRoom join);
	
	public ChatRoom selectChatRoom(int memNo);

}
