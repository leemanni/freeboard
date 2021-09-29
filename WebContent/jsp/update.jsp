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
<title>212 자유 게시판 - 수정</title>
</head>
<body>
	<form action="updateOK.jsp">
		<table align="center" width="1000" cellspacing="0">
			<tr>
				<th colspan="4">
					게시글 수정
				</th>
			</tr>
			<tr>
				<td width="10%" align="center">글번호</td>
				<td width="60%" align="center">이름</td>
				<td width="15%" align="center">작성일</td>
				<td width="15%" align="center">조회수</td>
			</tr>
			
			<tr>
				<td align="center">
					${vo.idx }
				</td>
				<td align="center">
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')} "/>
		 			<c:set var="name" value="${fn:replace(name, '>', '&gt;')} "/>
					${name}
				</td>
				<td align="center">
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
				<td colspan="2" align="center">
	 				<input type="text" name="subject" value="${vo.subject}" style="width: 98%">
				</td>
				<td align="center">
					공지글
					<c:if test="${fn:trim(vo.notice) == 'notice'}">
						<input type="checkbox" name="notice" checked="checked">
					</c:if>
					<c:if test="${fn:trim(vo.notice) != 'notice'}">
						<input type="checkbox" value="notice" name="notice"/>
					</c:if>
				</td>
			</tr>	
			<tr>
				<td align="center">내용</td>
				<td colspan="3">
					<textarea rows="10" cols="105" name="content" style="resize: none;">${vo.content}</textarea>
				</td>
			</tr>	
			<tr>
				<td colspan="4" align="center">
					<label for="passwod">비밀번호</label>
					<input type="password" id="password" name ="password">
					<input type="submit" value="수정하기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="돌아가기" onclick="history.go(-1)">
					<input type="button" value="목록으로" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${vo.idx }">
		<input type="hidden" name="currentPage" value="${currentPage}">
	</form>
	
	
	
<script src="https://kit.fontawesome.com/27afa53023.js" crossorigin="anonymous"></script>
</body>
</html>