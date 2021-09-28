package com.leemanni.service;

import java.util.HashMap;

import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.ibatis.session.SqlSession;

import com.leemanni.dao.FreeBoardDAO;
import com.leemanni.mybatis.MySession;
import com.leemanni.vo.FreeBoardList;
import com.leemanni.vo.FreeBoardVO;

/**
 * @author leemanni
 *	메인 게시글 service 클래스
 */
public class FreeBoardService {
	private static FreeBoardService instance = new FreeBoardService();
	private FreeBoardService() {;}
	public static FreeBoardService getInstance() {
		return instance;
	}
	
	/**
	 * @param vo
	 * 메인글 vo 객체를 dao 로 보내서 DB 에 저장 
	 */
	public void insert(FreeBoardVO vo) {
		System.out.println("FreeBoardService ==> insert");
		SqlSession mapper = MySession.getSession();
		FreeBoardDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	
	/**
	 * @param currentPage
	 * @return
	 * 
	 * 한페이지의 보여줄 글 목록을 가져오기 위해 DAO 에요청하는 메소드
	 * 
	 */
	public FreeBoardList seleteList(int currentPage) {
		System.out.println("FreeBoardService ==> seleteList");
		SqlSession mapper = MySession.getSession();
		FreeBoardDAO dao = FreeBoardDAO.getInstance();
		
		int pageSize = 10;
		int totalCount = dao.countList(mapper);
		FreeBoardList freeBoardList = new FreeBoardList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", freeBoardList.getStartNo());
		hmap.put("endNo", freeBoardList.getEndNo());
		freeBoardList.setList(dao.selectList(mapper, hmap));
		
		mapper.commit();
		mapper.close();
		return freeBoardList;
	}
	
	
	
	
}














