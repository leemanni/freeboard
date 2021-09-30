<%@page import="com.leemanni.service.FreeBoardCommentService"%>
<%@page import="com.leemanni.vo.FreeBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.leemanni.service.FreeBoardService"%>
<%@page import="com.leemanni.vo.FreeBoardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>212 자유 게시판</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 페이지 만들 페이지들 모아주기
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}catch(NumberFormatException e){;}
	
	FreeBoardService service = FreeBoardService.getInstance();
	FreeBoardCommentService commentService = FreeBoardCommentService.getInstance();
	
	// 공지글을 얻어온다
	ArrayList<FreeBoardVO> notice = service.selectNotice();
	// 메인 글 얻어오기
	FreeBoardList freeBoardList = service.seleteList(currentPage);
	
	// 댓글의 개수 가져오기
	for(FreeBoardVO vo : freeBoardList.getList()){
		vo.setCommentCount(commentService.commentCount(vo.getIdx()));
	}
	for(FreeBoardVO vo : notice){
		vo.setCommentCount(commentService.commentCount(vo.getIdx()));
	}
	
	
	request.setAttribute("notice", notice);
	request.setAttribute("freeBoardList", freeBoardList);
	pageContext.forward("listView.jsp");
%>
</body>
</html>