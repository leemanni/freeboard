package com.leemanni.dao;

import org.apache.ibatis.session.SqlSession;

import com.leemanni.vo.FreeBoardCommentVO;

/**
 * @author leemanni
 * 댓글 DAO 클래스
 */
public class FreeBoardCommentDAO {
	private static FreeBoardCommentDAO instance = new FreeBoardCommentDAO();
	private FreeBoardCommentDAO() {;}
	public static FreeBoardCommentDAO getInstance() {
		return instance;
	}
	
	
	/**
	 * @param mapper
	 * @param co
	 * 댓글을 DB 에 추가해주는 메소드
	 */
	public void insertComment(SqlSession mapper, FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentDAO ==> insertComment");
		mapper.insert("insertComment", co);
	}
	
	
}
