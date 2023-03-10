package com.kh.icu.common.socket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.icu.board.model.service.BoardService;
import com.kh.icu.chat.model.service.ChatService;
import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.common.interceptor.SessionNames;
import com.kh.icu.common.model.vo.Alarm;
import com.kh.icu.member.model.vo.Member;

public class ChatHandler extends TextWebSocketHandler{
	
	
	 @Autowired
	 private ChatService chatService;
	 
	 private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	 
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session)throws Exception {
		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
      
      sessions.add(session);
	}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessions.remove(session);
	}

	// 클라이언트가 Data 전송시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		ObjectMapper objectMapper = new ObjectMapper();
	      
	    ChatMessage chatMessage = objectMapper.readValue(message.getPayload() , ChatMessage.class);
	    
	    int result = chatService.insertMessage(chatMessage);
	    if(result > 0) {
         // 같은방에 접속중인 클라이언트에게 전달받은 메세지를 보내기.
         for(WebSocketSession s : sessions) {
            
            // 반복을 진행중인 websocketsession안에 담겨있는 방번호.
			int chatRoomNo = (Integer) s.getAttributes().get("chatRoomNo");
			Member loginUser = (Member) s.getAttributes().get("loginUser");
			// 메세제에 담겨있는 채팅방 번호와 chatRoomNo가 같은지 비교
			if (chatMessage.getChatRoomNo() == chatRoomNo
					&& !loginUser.getMemNickname().equals(chatMessage.getMemNickname())) {
				// 같은방 클라이언트에게 JSON형식으로 메세지를 보냄.
				s.sendMessage(new TextMessage(new Gson().toJson(chatMessage)));

			}
         }
	    }

	  
	}
}
	
