package com.kh.icu.common.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.icu.common.interceptor.SessionNames;
import com.kh.icu.member.model.vo.Member;

public class AlramHandler extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<>(); 
	
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		System.out.println("afterConnection : "+ session);
		sessions.add(session); // 접속된 유저들을 sessions에 모두 담는다.
		
		// 접속한 유저의 httpsession을 조회해서 id 얻어오기
		String senderId = getMemberId(session);
		
		userSessions.put(senderId, session);
	}
	
	// 클라이언트가 Data 전송시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage:" + session + " : "+ message);
		String senderId = getMemberId(session);
//		for(WebSocketSession sess : sessions) { // 세션에 접속된 모든 사람들에게 메세지 전송
//			sess.sendMessage(new TextMessage(senderId+ ":" + message.getPayload())); //실제로 보낸 내용 : message.getPayload()
//		}
		
		//특정 유저에게 보내기
		//protocol: cmd, 댓글 작성자, 게시글 작성자, bno (ex: reply, user2, user1, 234)
		String msg = message.getPayload();
		
		System.out.println("전달된 메세지 : " + message.getPayload());
		
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			System.out.println(strs);
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				if("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage("<a href='/icu/detail.bo/"+ bno +"'>"+replyWriter +"님이 게시글에 댓글을 달았습니다!"+"</a>");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnection : "+ session + ":"+status);
		
		String senderId = getMemberId(session);
		if(senderId != null) { // 로그인 값이 있는 경우
			log(senderId + "연결 종료됨");
			/*
			 * loginUser.remove(senderId); loginUser.remove(session);
			 */
	
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
		Member loginUser = (Member)httpSession.get(SessionNames.LOGIN);
		if(null == loginUser) {
			return session.getId();
		}else {
			return loginUser.getMemNickname();
		}
	}
}
