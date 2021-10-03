<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>212 자유 게시판 - 삭제</title>
</head>
<body>
	<form action="deleteOK.jsp">
		<table align="center" width="1000" cellspacing="0">
			<tr>
				<th colspan="4">
					게시글 삭제
				</th>
			</tr>
			<tr>
				<td width="10%" align="center">글번호</td>
				<td width="60%" align="center">이름</td>
				<td width="15%" align="center">작성일</td>
				<td width="15%" align="center">조회수</td>
			</tr>
			
			<tr>
				<td class="table_border" align="center">
					${vo.idx }
				</td>
				<td class="table_border" align="center">
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')} "/>
		 			<c:set var="name" value="${fn:replace(name, '>', '&gt;')} "/>
					${name}
				</td>
				<td class="table_border" align="center">
					<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date }">
			 			<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm"/>
		 			</c:if>
		 			<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date }">
			 			<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
		 			</c:if>
				</td>
				<td align="center">
					${vo.hit}
	 			</td>
			</tr>
			<tr>
				<td align="center">
					제목
				</td>
				<td colspan="3" align="center">
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')} "/>
		 			<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')} "/>
					${subject }
				</td>
			</tr>	
			<tr>
				<td align="center">내용</td>
				<td colspan="3">
					<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')} "/>
		 			<c:set var="content" value="${fn:replace(content, '>', '&gt;')} "/>
		 			<c:set var="content" value="${fn:replace(content,enter,'<br/>')}"/>
					${content }
				</td>
			</tr>	
			<tr>
				<td class="table-lastdata" colspan="4" align="center">
					<label for="passwod">비밀번호</label>
					<input type="password" id="password" name ="password">
					<input class="button" type="submit" value="삭제하기">
					<input class="button" type="reset" value="다시쓰기">
					<input class="button" type="button" value="돌아가기" onclick="history.go(-1)">
					<input class="button" type="button" value="목록으로" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${vo.idx }">
		<input type="hidden" name="currentPage" value="${currentPage}">
	</form>
	
<footer class="board-footer">
	<span>자유 게시판 ~~ made by leemanni</span>
	<a href="https://github.com/leemanni"><i class="fab fa-github"></i>&nbsp;leemanni's github</a>
</footer>
<script src="https://kit.fontawesome.com/27afa53023.js" crossorigin="anonymous"></script>
</body>
</html>