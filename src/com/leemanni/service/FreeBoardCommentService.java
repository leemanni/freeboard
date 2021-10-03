package com.leemanni.service;

import org.apache.ibatis.session.SqlSession;

import com.leemanni.dao.FreeBoardCommentDAO;
import com.leemanni.mybatis.MySession;
import com.leemanni.vo.FreeBoardCommentList;
import com.leemanni.vo.FreeBoardCommentVO;

/**
 * @author leemanni 댓글 service 클래스
 */
public class FreeBoardCommentService {
	private static FreeBoardCommentService instance = new FreeBoardCommentService();

	private FreeBoardCommentService() {
		;
	}

	public static FreeBoardCommentService getInstance() {
		return instance;
	}

	/**
	 * commentOK.jsp 에서 호출
	 * @param co 댓글을 DB 에 넣어주는 메소드
	 */
	public boolean insertComment(FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentService ==> insertComment");
		SqlSession mapper = MySession.getSession();
		try {
			FreeBoardCommentDAO.getInstance().insertComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			mapper.close();
			return false;
		}
	}

	/**
	 * list.jsp 에서 호출
	 * 
	 * @param idx
	 * @return 댓글의 개수를 가져옴 => DAO 호출
	 */
	public int commentCount(int idx) {
		System.out.println("FreeBoardCommentService ==> commentCount");
		SqlSession mapper = MySession.getSession();
		int commentCnt = FreeBoardCommentDAO.getInstance().commentCount(mapper, idx);
		mapper.close();
		return commentCnt;
	}

	/**
	 * selectByIdx.jsp 에서 호출
	 * 
	 * @param idx
	 * @return 댓글의 목록을 불러오기 위해 DAO 메소드 호출
	 */
	public FreeBoardCommentList selectCommentList(int idx) {
		System.out.println("FreeBoardCommentService ==> selectCommentList");
		SqlSession mapper = MySession.getSession();
		FreeBoardCommentList commentList = new FreeBoardCommentList();
		commentList.setList(FreeBoardCommentDAO.getInstance().selectCommentList(mapper, idx));
		mapper.close();
		return commentList;
	}

	/**
	 * @param co  // 삭제 또는 수정하고자 원하는 객체
	 * @param idx // 본래의 댓글 객체를 가져오기위한 idx
	 * @return 수정 또는 삭제하고자 하는 댓글에 입력한 비밀번호와 원해 비밀번호 일치 여부 판단
	 */
	private boolean checkPassword(FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentService ==> checkPassword");
		SqlSession mapper = MySession.getSession();
		FreeBoardCommentVO original = FreeBoardCommentDAO.getInstance().selectByComment(mapper, co.getIdx());
		boolean check = false;	// 리턴값
		if (co.getPassword().trim().equals(original.getPassword().trim())) {
			check = true;
		}
		mapper.close();
		return check;
	}

	/**
	 * @param co 비밀번호를 체크하고 비밀번호가 일치하면 댓글을 수정하는 메소드
	 */
	public boolean updateComment(FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentService ==> selectCommentList");
		SqlSession mapper = MySession.getSession();
		if (checkPassword(co)) {
			try {
				FreeBoardCommentDAO.getInstance().updateComment(mapper, co);
			} catch (Exception e) {
				e.printStackTrace();
				mapper.close();
				return false;
			}
			mapper.commit();
			mapper.close();
			return true;
		}
		mapper.close();
		return false;
	}

	/**
	 * @param idx 댓글을 삭제하기위한 메소드
	 */
	public boolean deleteComment(FreeBoardCommentVO co) {
		System.out.println("FreeBoardCommentService ==> selectCommentList");
		SqlSession mapper = MySession.getSession();
		if (checkPassword(co)) {
			try {
				FreeBoardCommentDAO.getInstance().deleteComment(mapper, co.getIdx());
			} catch (Exception e) {
				e.printStackTrace();
				mapper.close();
				return false;
			}
			mapper.commit();
			mapper.close();
			return true;
		}
		mapper.close();
		return false;
	}

}
