package com.leemanni.vo;

import java.util.ArrayList;

/**
 * @author cjffy
 * 특정 메인글의 댓글 목록을 기억한다.
 */
public class FreeBoardCommentList {
	ArrayList<FreeBoardVO> list = new ArrayList<>();

	public ArrayList<FreeBoardVO> getList() {
		return list;
	}

	public void setList(ArrayList<FreeBoardVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "FreeBoardCommentList [list=" + list + "]";
	}
	
	
	
}
