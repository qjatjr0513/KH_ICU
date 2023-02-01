package com.kh.icu.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.common.model.vo.Alarm;
import com.kh.icu.common.model.vo.Reply;

public interface BoardService {
	
	/**
	 * 자유게시판 리스트 조회 + 페이징처리
	 */
	public Map<String, Object> selectList(int currentPage);
	
	/**
	 * 게시글 리스트 개수 카운트
	 */
	public int selectListCount();
	
	/**
	 * 게시글 검색후 리스트 조회(페이징처리 paramMap에 포함)
	 */
	public Map<String, Object> searchSelectList(Map<String, Object> paramMap);
	
	/**
	 * 게시글 검색후 개수 카운트
	 */
	public int selectSearchListCount(Map<String,Object> paramMap);
	
	
	/**
	 * 게시글 선택후 상세페이지
	 */
	public Board selectBoard(int bno);
	
	/**
	 * 게시글 작성하기
	 */
	public int insertBoard(Board b);
	
	/**
	 * 게시글 수정하기
	 */
	public int updateBoard(Board b);
	
	/**
	 * 게시글 조회수 증가
	 */
	public int increaseCount(int bno);
	
	/**
	 * 게시글 댓글 리스트 조회
	 */
	public ArrayList<Reply> selectReplyList(int bno);
	
	/**
	 * 게시글 댓글 작성하기
	 */
	public int insertReply(Reply r);
	
	/**
	 * 게시글 삭제하기
	 */
	public int deleteBoard(int boardNo);
	
	/**
	 * 게시글 댓글 삭제하기
	 */
	public int deleteReply(int rno);
	
	public int insertBoardAlarm(Alarm a);
	
	
	
	
	
	
	
}
