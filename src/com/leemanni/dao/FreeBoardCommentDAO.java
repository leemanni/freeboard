package com.leemanni.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.leemanni.vo.FreeBoardCommentList;
import com.leemanni.vo.FreeBoardCommentVO;
import com.leemanni.vo.FreeBoardVO;

/**
 * @author leemanni 댓글 DAO 클래스 무조건 Servce 클래스에서 호출됨.
 */
public class FreeBoardCommentDAO {
	private static FreeBoardCommentDAO instance = new FreeBoardCommentDAO();

	private FreeBoardCommentDAO() {;}

	public static FreeBoardCommentDAO getInstance() {
		return instance;
	}

	/**
	 * @param mapper
	 * @param co     댓글을 DB 에 추가해주는 메소드
	 */
	public void insertComment(SqlSession mapper, FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentDAO ==> insertComment");
		mapper.insert("insertComment", co);
	}

	/**
	 * @param mapper
	 * @param idx
	 * @return 댓글의 목록을 DB 에서 가져오는 메소드
	 */
	public ArrayList<FreeBoardCommentVO> selectCommentList(SqlSession mapper, int idx) {
		System.out.println("FreeBoardCommentDAO ==> selectCommentList");
		return (ArrayList<FreeBoardCommentVO>) mapper.selectList("selectCommentList", idx);
	}

	/**
	 * @param mapper
	 * @param idx
	 * @return 댓글의 개수를 가져오는 sql 실행
	 */
	public int commentCount(SqlSession mapper, int idx) {
		System.out.println("FreeBoardCommentDAO ==> commentCount");
		return (int) mapper.selectOne("commentCount", idx);
	}

	/**
	 * @param idx 삭제 또는 수정하고자 하는 객체를 DB 에서 가져오는 함수
	 */
	public FreeBoardCommentVO selectByComment(SqlSession mapper, int idx) {
		System.out.println("FreeBoardCommentDAO ==> selectByComment");
		return (FreeBoardCommentVO) mapper.selectOne("selectByComment", idx);
	}

	/**
	 * @param mapper
	 * @param co     댓글을 수정하는 매소드
	 */
	public void updateComment(SqlSession mapper, FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentDAO ==> updateComment");
		mapper.update("updateComment", co);
	}

	/**
	 * @param mapper
	 * @param i
	 * 댓글을 삭제하는 메소드
	 */
	public void deleteComment(SqlSession mapper, int idx) {
		System.out.println("FreeBoardCommentDAO ==> deleteComment");
		mapper.update("deleteComment", idx);
	}
}
