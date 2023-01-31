package com.kh.icu.chat.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.chat.model.dao.ChatDao;
import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.chat.model.vo.ChatRoom;
import com.kh.icu.common.Utils;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	// 채팅방 목록 조회
	@Override
	public List<ChatRoom> selectChatRoomList(){
		return chatDao.selectChatRoomList(sqlSession);
	}
	
	// 채팅방 만들기
	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		return chatDao.openChatRoom(sqlSession, chatRoom);
	}
	
	// 채팅 메세지 DB 저장
	public int insertMessage(ChatMessage cm) {
		System.out.println(cm);
		// 데이터를 db에 넣을때 개행문자 처리
		cm.setMessage(Utils.newLineHandling(cm.getMessage()));
		cm.setMessage(Utils.XSSHandling(cm.getMessage()));
		
		return chatDao.insertMessage(sqlSession, cm);
	}
	
	@Override
	public List<ChatMessage> selectChatMessage(ChatRoom join){
		
		
		// 채팅 메세지 목록 조회.
		return chatDao.selectChatMessage(sqlSession, join.getChatRoomNo());
	}
	
	@Override
	public int exitChatRoom(ChatRoom join) {
		
		// 채팅방 나가기 
		int result = chatDao.closeChatRoom(sqlSession, join);
		return result;
	}
	
	@Override
	public ChatRoom selectChatRoom(int memNo) {
		return chatDao.selectChatRoom(sqlSession, memNo);
	}
	
	
}
