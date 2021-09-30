<%@page import="com.leemanni.service.FreeBoardService"%>
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
		request.setCharacterEncoding("utf-8");
	
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
		
		// 선택되 게시글 조회수 1 증가
		FreeBoardService.getInstance().increment(idx);
		
		// job => contentView 해당 글 보여주기 , delete or update => 삭제 수정!
		response.sendRedirect("selectByIdx.jsp?idx="+idx+"&currentPage="+currentPage+"&job=contentView");
	%>
</body>
</html>