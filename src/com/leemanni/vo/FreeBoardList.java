package com.leemanni.vo;

import java.util.ArrayList;

/**
 * @author cjffy
 *	1페이지 분량의 글 목록과 페이징 직업에 사용할 변수
 */
public class FreeBoardList {
	ArrayList<FreeBoardVO> list = new ArrayList<>();
	
	private int pageSize = 10;		// 한페이지 보여줄 게시글 수
	private int totalCount = 0;		// 전체 게시글 수
	private int totalPage = 0;		// 전체 페이지 수	
	private int currentPage = 0;	// 현재 페이지 위치
	private int startNo = 0;		// 한페이지의 시작 글 번호idx
	private int endNo = 0;			// 한페이지의 끝 글 번호 idx
	private int startPage = 0;		// 한페이지의 시작 페이지(10 개 단위)
	private int endPage = 0;		// 한 그룹의 마지막 페이지 버튼(10개단위)
	
	
	public FreeBoardList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
	
	/**
	 *  DB 에 근거해서 자동으로  페이지 관련 사항을 저장해주는 함수
	 */
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1; // 오라클이라 +1 해줌(index 가 1부터 시작)
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}


	public ArrayList<FreeBoardVO> getList() {
		return list;
	}


	public void setList(ArrayList<FreeBoardVO> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "FreeBoardList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
