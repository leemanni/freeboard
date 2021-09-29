package com.leemanni.service;

import org.apache.ibatis.session.SqlSession;

import com.leemanni.dao.FreeBoardCommentDAO;
import com.leemanni.mybatis.MySession;
import com.leemanni.vo.FreeBoardCommentVO;

/**
 * @author leemanni
 *	 댓글 service 클래스
 */
public class FreeBoardCommentService {
	private static FreeBoardCommentService instance = new FreeBoardCommentService();
	private FreeBoardCommentService() {;}
	public static FreeBoardCommentService getInstance() {
		return instance;
	}
	
	
	/**
	 * @param co
	 * 댓글을 DB 에 넣어주는 메소드
	 */
	public boolean insertComment(FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentService ==> insertComment");
		SqlSession mapper = MySession.getSession();
		try {
			FreeBoardCommentDAO.getInstance().insertComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			mapper.close();
			return false;
		}
	}
}














