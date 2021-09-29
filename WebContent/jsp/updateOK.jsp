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

%>
<jsp:useBean id="vo" class="com.leemanni.vo.FreeBoardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	FreeBoardVO original = FreeBoardService.getInstance().selectByIdx(vo.getIdx());
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	out.println("<script>");
	if(vo.getPassword().trim().equals(original.getPassword().trim())){
		out.println("alert('"+vo.getIdx()+" 번글 수정 완료')");
		FreeBoardService.getInstance().update(vo);
	}else{
		out.println("alert('비밀번호가 일치하지 않습니다.')");
	}
	out.println("location.href='list.jsp?currentPage="+ currentPage+"'");
	out.println("</script>");
%>
</body>
</html>