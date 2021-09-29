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
	
	
	FreeBoardService service = FreeBoardService.getInstance();
	FreeBoardVO original = service.selectByIdx(idx);
	
	request.setAttribute("vo", original);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("enter", "\r\n");
	
	pageContext.forward(job + ".jsp");
%>
</body>
</html>