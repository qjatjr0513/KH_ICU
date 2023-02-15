package com.kh.icu.common.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.icu.board.model.service.BoardService;
import com.kh.icu.common.interceptor.SessionNames;
import com.kh.icu.common.model.service.AlarmService;
import com.kh.icu.common.model.vo.Alarm;
import com.kh.icu.member.model.service.MemberService;
import com.kh.icu.member.model.vo.Member;

@Component
public class AlramHandler extends TextWebSocketHandler {

	
	 @Autowired 
	 private AlarmService alarmService;
	 
	 
	 
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		Sessions.WSsessions.add(session); // 접속된 유저들을 sessions에 모두 담는다.
		
		// 접속한 유저의 httpsession을 조회해서 id 얻어오기
		String senderId = getMemberId(session);
		
		Sessions.userSessions.put(senderId, session);
	}
	
	// 클라이언트가 Data 전송시
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		//특정 유저에게 보내기
		//protocol: cmd, 댓글 작성자, 게시글 작성자, bno (ex: reply, user2, user1, 234)
		String msg = message.getPayload();
		
		
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				String cmd = strs[0];
				String sendId = strs[1];
				String sendNickname = strs[2];
				String receiveNickname = strs[3];
				String receiveId = strs[4];
				String refTno = strs[5];
				
				
				
				WebSocketSession receiveSession = Sessions.userSessions.get(receiveNickname);
				if("reply".equals(cmd) && !sendId.equals(receiveId)) {
					String content = "게시글에 댓글이 달렸습니다!";
					Alarm a = new Alarm();
					a.setMemNo(Integer.parseInt(receiveId));
					a.setSendMemNo(Integer.parseInt(sendId));
					a.setMesContent(content);
					a.setRefTno(Integer.parseInt(refTno));
					a.setTableCd("B");
									
					int result = alarmService.insertBoardAlarm(a);
					if(result > 0 && receiveSession != null) {
						TextMessage tmpMsg = new TextMessage("<a id='at' href='/icu/detail/"+ refTno +"'>"+content+"</a>");
						receiveSession.sendMessage(tmpMsg);						
					}
				}else if("party".equals(cmd) && !sendId.equals(receiveId)) {
					String content = "파티에 댓글이 달렸습니다!";
					Alarm a = new Alarm();
					a.setMemNo(Integer.parseInt(receiveId));
					a.setSendMemNo(Integer.parseInt(sendId));
					a.setMesContent(content);
					a.setRefTno(Integer.parseInt(refTno));
					a.setTableCd("P");
									
					int result = alarmService.insertBoardAlarm(a);
					if(result > 0 && receiveSession != null) {
						TextMessage tmpMsg = new TextMessage("<a id='at' href='/icu/partyDetail.py/"+ refTno +"'>"+content+"</a>");
						receiveSession.sendMessage(tmpMsg);						
					}
				}else if("pay".equals(cmd) && !sendId.equals(receiveId)) {
					String content = sendNickname+"님이 송금하였습니다!";
					Alarm a = new Alarm();
					a.setMemNo(Integer.parseInt(receiveId));
					a.setSendMemNo(Integer.parseInt(sendId));
					a.setMesContent(content);
					a.setRefTno(Integer.parseInt(refTno));
					a.setTableCd("A");
									
					int result = alarmService.insertBoardAlarm(a);
					if(result > 0 && receiveSession != null) {
						TextMessage tmpMsg = new TextMessage("<a id='at' href='/icu/depositListForm.pe'>"+content+"</a>");
						receiveSession.sendMessage(tmpMsg);						
					}
				}else if("endParty".equals(cmd) && !sendId.equals(receiveId)) {
					String content = "일주일 후 파티가 종료됩니다!";
					Alarm a = new Alarm();
					a.setMemNo(Integer.parseInt(receiveId));
					a.setSendMemNo(Integer.parseInt(sendId));
					a.setMesContent(content);
					a.setRefTno(Integer.parseInt(refTno));
					a.setTableCd("P");
									
					int result = alarmService.insertBoardAlarm(a);
					if(result > 0 && receiveSession != null) {
						TextMessage tmpMsg = new TextMessage("<a id='at' href='/icu/partyDetail.py/"+ refTno +"'>"+content+"</a>");
						receiveSession.sendMessage(tmpMsg);						
					}
				}else if("black".equals(cmd) && !sendId.equals(receiveId)) {
					String content = "블랙리스트로 변경되었습니다!";
					Alarm a = new Alarm();
					a.setMemNo(Integer.parseInt(receiveId));
					a.setSendMemNo(Integer.parseInt(sendId));
					a.setMesContent(content);
					a.setRefTno(Integer.parseInt(refTno));
					a.setTableCd("M");
									
					int result = alarmService.insertBoardAlarm(a);
					if(result > 0 && receiveSession != null) {
						TextMessage tmpMsg = new TextMessage("<a id='at' href=''>"+content+"</a>");
						receiveSession.sendMessage(tmpMsg);						
					}
				}else if("cancle".equals(cmd) && !sendId.equals(receiveId)) {
					String content = "블랙리스트가 해제되었습니다!";
					Alarm a = new Alarm();
					a.setMemNo(Integer.parseInt(receiveId));
					a.setSendMemNo(Integer.parseInt(sendId));
					a.setMesContent(content);
					a.setRefTno(Integer.parseInt(refTno));
					a.setTableCd("M");
									
					int result = alarmService.insertBoardAlarm(a);
					if(result > 0 && receiveSession != null) {
						TextMessage tmpMsg = new TextMessage("<a id='at' href=''>"+content+"</a>");
						receiveSession.sendMessage(tmpMsg);						
					}
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
			/*
			 * loginUser.remove(senderId); loginUser.remove(session);
			 */
	
		}
	}
	
	//로그 메세지
	private void log(String logmsg) {
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
