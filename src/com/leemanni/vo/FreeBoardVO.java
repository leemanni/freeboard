package com.leemanni.vo;

import java.util.Date;

/**
 * @author cjffy 메인 글 한 건을 저장하는 VO
 */
public class FreeBoardVO {
	private int idx;
	private String name;
	private String password;
	private String subject;			// 글 제목
	private String content;			// 글 내용
	private Date writeDate;
	private int hit;
	private String notice = "";		// 공지글 여부 (YES => 공지글, NO => 일반글)
	private String ip;
	private int commentCount;		// 댓글의 개수
	
	
	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [idx=" + idx + ", name=" + name + ", password=" + password + ", subject=" + subject
				+ ", content=" + content + ", writeDate=" + writeDate + ", hit=" + hit + ", notice=" + notice + ", ip="
				+ ip + ", commentCount=" + commentCount + "]";
	}

	
}
