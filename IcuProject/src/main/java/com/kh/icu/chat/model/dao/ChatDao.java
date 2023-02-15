package com.kh.icu.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.chat.model.vo.ChatMessage;
import com.kh.icu.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	//채팅방 목록 조회
	public ArrayList<ChatRoom> selectChatRoomList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("chattingMapper.selectChatRoomList", null , rowBounds);
	}
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("chattingMapper.selectListCount");
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
	
	public ChatRoom selectChatRoom(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("chattingMapper.selectChatRoom", memNo);
	}
}
