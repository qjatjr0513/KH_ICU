package com.kh.icu.common.socket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class AlarmHandler extends TextWebSocketHandler {
	
	//로그인중인 유저
	Map<String, WebSocketSession> loginUser = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		// 접속한 유저의 httpsession을 조회해서 id 얻어오기
		String senderId = getMemberId(session);
		if(senderId != null) {
			log(senderId+"연결됨");
			loginUser.put(senderId, session);
		}
	}
	
	// 클라이언트가 Data 전송시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String senderId = getMemberId(session);
		
		//특정 유저에게 보내기
		
		String msg = message.getPayload();
		if(msg !=null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			if(msg != null && strs.length == 4) {
				String type = strs[0];
				String target = strs[1];
				String content = strs[2];
				String url = strs[3];
				WebSocketSession targetSession = loginUser.get(target); //메세지를 받을 세션 조회 
				
				// 실시간 접속시
				if(targetSession != null) {
					// ex : 신청이 들어왔습니다.
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+url+"'>[<b>"+type+"</b>]"+content+"</a>");
					targetSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		String senderId = getMemberId(session);
		if(senderId != null) { // 로그인 값이 있는 경우
			log(senderId + "연결 종료됨");
			loginUser.remove(senderId);
			loginUser.remove(session);
	
		}
	}
	
	//로그 메세지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg );
	}
	
	// 웹소켓에 id 가져오기
	// 접속한 유저의 http세션을 조회하여 id 얻어오기
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String m_id = (String) httpSession.get("m_id"); // 세션에 저장된 m_id 기준으로 조회
		return m_id == null ? null : m_id;
	}
}
