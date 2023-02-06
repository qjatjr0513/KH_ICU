package com.kh.icu.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.icu.board.model.dao.BoardDao;
import com.kh.icu.board.model.vo.Board;
import com.kh.icu.board.model.vo.PageInfo;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Reply;
import com.kh.icu.common.template.Pagination;

@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardDao boardDao;
	private SqlSession sqlSession;
	private Pagination pagination;
	
	public BoardServiceImpl(BoardDao boardDao, SqlSession sqlSession, Pagination pagination) {
		this.boardDao = boardDao;
		this.sqlSession = sqlSession;
		this.pagination = pagination;
	}
	/**
	 * 게시글 리스트 개수 카운트
	 */
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}
	
	/**
	 * 자유게시판 리스트 조회 + 페이징처리
	 */	
	@Override
	public Map<String, Object> selectList(int currentPage){
		Map<String, Object> map = new HashMap();
		
		// 1. 페이징처리
		int listCount = selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
					
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
		
		ArrayList<Board> list = boardDao.selectList(sqlSession, pi);
		map.put("list", list);
		
		ArrayList<Board> notice = boardDao.selectNotice(sqlSession);
		map.put("notice", notice);
		
		return map;
	}
	
	/**
	 * 게시글 검색후 개수 카운트
	 */
	@Override
	public int selectSearchListCount(Map<String,Object> paramMap) {
		return boardDao.selectSearchListCount(sqlSession, paramMap);
	}
	
	/**
	 * 게시글 검색후 리스트 조회(페이징처리 paramMap에 포함)
	 */
	@Override
	public Map<String, Object> searchSelectList(Map<String, Object> paramMap){
		
		Map<String, Object> map = new HashMap();
		
		//1. 페이징 처리
		int listCount = selectSearchListCount(paramMap);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = pagination.getPageInfo(listCount, (Integer)paramMap.get("cpage"), pageLimit, boardLimit);
		paramMap.put("pi", pi);
		
		map.put("pi", pi);
		
		ArrayList<Board> list = boardDao.searchSelectList(sqlSession, paramMap);
		map.put("list", list);
		
		return map;
	}
	
	/**
	 * 게시글 선택후 상세페이지
	 */
	@Override
	public Board selectBoard(int bno) {

		return boardDao.selectBoard(sqlSession, bno);
	}
	
	/**
	 * 게시글 작성하기
	 */
	@Override
	public int insertBoard(Board b) {
		
		// 1) XSS, 개행문자처리
		b.setBoardTitle(Utils.XSSHandling(b.getBoardTitle()));
		b.setBoardContent(Utils.XSSHandling(b.getBoardContent()));
		b.setBoardContent(Utils.newLineHandling(b.getBoardContent()));
		
		int result = 0;
		int boardNo = boardDao.insertBoard(sqlSession, b);
		
		if(boardNo > 0) {
			
			result = boardNo;
		}
		return result;
	}
	
	/**
	 * 게시글 수정하기
	 */
	@Override
	public int updateBoard(Board b) {
		
		// 1) XSS, 개행문자처리
		b.setBoardTitle(Utils.XSSHandling(b.getBoardTitle()));
		b.setBoardContent(Utils.XSSHandling(b.getBoardContent()));
		b.setBoardContent(Utils.newLineHandling(b.getBoardContent()));
		
		return boardDao.updateBoard(sqlSession, b);
		
	}
	
	/**
	 * 게시글 조회수 증가
	 */
	@Override
	public int increaseCount(int bno) {
		
		return boardDao.increaseCount(sqlSession, bno);
	}
	
	/**
	 * 게시글 댓글 리스트 조회
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return boardDao.selectReplyList(sqlSession, bno);
	}
	
	/**
	 * 게시글 댓글 작성하기
	 */
	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}
	
	/**
	 * 게시글 삭제하기
	 */
	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}

	/**
	 * 게시글 댓글 삭제하기
	 */
	@Override
	public int deleteReply(int rno) {
		return boardDao.deleteReply(sqlSession, rno);
	}
	
	
	public Map<String, Object> selectNoticeList(int currentPage){
		Map<String, Object> map = new HashMap();

		int listCount = selectListCount();
			
		int pageLimit = 10;
		int boardLimit = 10;
						
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		map.put("pi", pi);
			
		ArrayList<Board> list = boardDao.selectNoticeList(sqlSession, pi);
		map.put("list", list);
			
		return map;
	}
	
	
	
}
