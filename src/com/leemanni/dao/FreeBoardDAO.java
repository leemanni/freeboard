package com.leemanni.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.leemanni.vo.FreeBoardVO;

/**
 * @author leemanni
 * 메인 게시글 DAO 클래스
 */
public class FreeBoardDAO {
	private static FreeBoardDAO instance = new FreeBoardDAO();
	private FreeBoardDAO() {;}
	public static FreeBoardDAO getInstance() {
		return instance;
	}
	/**
	 * @param mapper
	 * @param vo
	 * FreeBoardService ==> insert => dao => xml => insert 호출!
	 */
	public void insert(SqlSession mapper, FreeBoardVO vo) {
		System.out.println("FreeBoardDAO ==> insert");
		mapper.insert("insert", vo);
	}
	
	/**
	 * @param mapper
	 * @return
	 * 
	 * 전체 게시글 수를 불러오는 메소드
	 */
	public int countList(SqlSession mapper) {
		System.out.println("FreeBoardDAO ==> countList");
		return (int) mapper.selectOne("countList");
	}
	
	/**
	 * @param mapper
	 * @param hmap
	 * @return
	 * 화면에 표시랑 게시글 을 리스트에 담아주는 메소드
	 */
	public ArrayList<FreeBoardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("FreeBoardDAO ==> selectList");
		return (ArrayList<FreeBoardVO>) mapper.selectList("selectList", hmap);
	}
	
	/**
	 * @param mapper
	 * @param idx
	 * 선택되 게시글의 조회수를 증가시키는 sql 을 실행시켜주는 메소드
	 */
	public void increment(SqlSession mapper, int idx) {
		System.out.println("FreeBoardDAO ==> increment");
		mapper.update("increment", idx);
	}
	
	/**
	 * @param mapper
	 * @param idx
	 * @return
	 * 선택된 idx 에 해당하는 글을 DB 에서 가져오는 메소드
	 */
	public FreeBoardVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("FreeBoardDAO ==> selectByIdx");
		return (FreeBoardVO) mapper.selectOne("selectByIdx", idx);
	}
	
	/**
	 * @param mapper
	 * @param idx
	 * 해당 글 번호를 삭제하는 메소드
	 */
	public void delete(SqlSession mapper, int idx) {
		System.out.println("FreeBoardDAO ==> delete");
		mapper.delete("delete", idx);
	}
	
	/**
	 * @param mapper
	 * 공지글을 얻어오는 메소드
	 * @return 
	 */
	public ArrayList<FreeBoardVO> selectNotice(SqlSession mapper) {
		System.out.println("FreeBoardDAO ==> selectNotice");
		return (ArrayList<FreeBoardVO>) mapper.selectList("selectNotice");
	}
	
	/**
	 * @param mapper
	 * @param vo
	 * DB 안의 게시글 1건을 수정하는 메소드
	 */
	public void update(SqlSession mapper, FreeBoardVO vo) {
		System.out.println("FreeBoardDAO ==> update");
		mapper.update("update", vo);
	}
}
