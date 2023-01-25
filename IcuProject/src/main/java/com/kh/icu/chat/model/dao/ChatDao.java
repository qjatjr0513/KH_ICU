package com.kh.icu.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	//채팅방 목록 조회
	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession){
		return sqlSession.selectList("chattingMapper.selectChatRoomList");
	}
	
	//채팅방 참여
	public int openChatRoom(SqlSession sqlSession, ChatRoom chatRoom) {
		int result = sqlSession.insert("chattingMapper.openChatRoom", chatRoom);
		
		if(result > 0) {
			return chatRoom.getChatRoomNo();
		}else {
			return 0;
		}
	}
	
	// 채팅 메세지 DB 삽입
	public int insertMessage(SqlSession sqlSession, ChatMessage cm) {
		System.out.println(cm);
		return sqlSession.insert("chattingMapper.insertMessage", cm);
	}

	
	//채팅메세지 목록 조회
	public List<ChatMessage> selectChatMessage(SqlSession sqlSession, int chatRoomNo){
		return sqlSession.selectList("chattingMapper.selectChatList", chatRoomNo);
	}
	
	//채팅방 나가기
	public int closeChatRoom(SqlSession sqlSession, ChatRoom join) {
		return sqlSession.update("chattingMapper.closeChatRoom", join);
	}
}
