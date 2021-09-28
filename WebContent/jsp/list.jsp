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
	
	FreeBoardList freeBoardList = FreeBoardService.getInstance().seleteList(currentPage);
	request.setAttribute("freeBoardList", freeBoardList);
	pageContext.forward("listView.jsp");
%>
</body>
</html>