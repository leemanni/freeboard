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
}
