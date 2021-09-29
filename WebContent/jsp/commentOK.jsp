<%@page import="com.leemanni.service.FreeBoardCommentService"%>
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
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	int mode = Integer.parseInt(request.getParameter("mode"));
%>
<jsp:useBean id="co" class="com.leemanni.vo.FreeBoardCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>
<%
	FreeBoardCommentService service = FreeBoardCommentService.getInstance();
	out.println("<script>");
	switch(mode){
		case 1:
			if(service.insertComment(co)){
				out.println("alert('댓글 저장 성공')");
			}else{
				out.println("alert('댓글 저장 실패')");
			}
			break;
		case 2:
			break;
		case 3:
			break;
	}
	out.println("</script>");
%>
</body>
</html>