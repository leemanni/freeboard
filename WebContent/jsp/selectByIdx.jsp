<%@page import="com.leemanni.service.FreeBoardCommentService"%>
<%@page import="com.leemanni.vo.FreeBoardCommentList"%>
<%@page import="com.leemanni.service.FreeBoardService"%>
<%@page import="com.leemanni.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String job = request.getParameter("job");
	
	
	FreeBoardVO original = FreeBoardService.getInstance().selectByIdx(idx);
	
	
	request.setAttribute("vo", original);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("enter", "\r\n");
	
	// job == contentView => 댓글 가져가기
	if(job.equals("contentView")){
		FreeBoardCommentList freeBoardCommentList = FreeBoardCommentService.getInstance().selectCommentList(idx);
		request.setAttribute("freeBoardCommentList", freeBoardCommentList);
	}
	
	
	pageContext.forward(job + ".jsp");
%>
</body>
</html>