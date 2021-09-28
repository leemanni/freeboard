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
<title>212 자유 게시판</title>
</head>
<body>
<jsp:useBean id="date" class="java.util.Date"/>
<c:set var="list" value="#{freeBoardList.list}"/>
<header>
	<h1>212 ~ 자유 게시판  ~ </h1>
</header>
<main>
	<table align="center" width="1000" border="3" cellpadding="4" cellspacing="3">
		<tr>
			<th colspan="5">자유 게시판 ~~ made by leemanni</th>
		</tr>
		<tr>
			<td width="70" align="center">글 번호</td>
			<td width="640" align="center">제목</td>
			<td width="100" align="center">이름</td>
			<td width="120" align="center">작성일</td>
			<td width="70" align="center">조회수</td>
		</tr>
		<!-- 공지글 있으면 출력 -->
		
		<!-- 메인 글 출력 -->
		<!-- 글이 1건도 없을 때 -->
		<c:if test="${list.size() == 0 }">
		<tr>
			<td>
				<h1>글이 없습니다.</h1>
			</td>
		</tr>
		</c:if>
		<!-- 글이 있을 때 -->
		<c:if test="${list.size() != 0 }">
			<c:forEach var="vo" items="${list }">
			<tr>
				<td align="center">${vo.idx}</td>
				<td>
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt')} "/>
	 				<c:set var="subject" value="${fn:replace(subject, '>', '&gt')} "/>
					<a href="#">
						${subject} (${vo.commentCount})
						<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date }">
							<i class="far fa-hand-spock"></i>
						</c:if>
					</a>
				</td>
				<td align="center">
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt')} "/>
	 				<c:set var="name" value="${fn:replace(name, '>', '&gt')} "/>
					${vo.name }
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
			</c:forEach>
		</c:if>
		 <!-- 페이지 이동버튼 -->
		 <tr>
			<td align="center" colspan="5">
			<!-- 처음으로 -->
				<c:if test="${freeBoardList.currentPage > 1}">
					<button class="button button1" type="button" title="첫 페이지로" onclick="location.href='?currentPage=1'">처음</button>
				</c:if>
				
				<c:if test="${freeBoardList.currentPage <= 1}">
					<button class="button button2" type="button" title="이미 첫 페이지입니다." disabled="disabled">처음</button>
				</c:if>
			<!-- 10페이지 앞으로 -->
				<c:if test="${freeBoardList.startPage > 1}">
					<button class="button button1" type="button" title="이전 10페이지로" 
					onclick="location.href='?currentPage=${freeBoardList.startPage - 1}'">이전</button>
				</c:if>
				<c:if test="${freeBoardList.startPage <= 1}">
					<button class="button button2" type="button" title="이미 첫 10 페이지입니다." disabled="disabled">이전</button>
				</c:if>
				<c:forEach var="i" begin="${freeBoardList.startPage}" end="${freeBoardList.endPage}" step="1">
				
					<c:if test="${freeBoardList.currentPage == i}">
						<button class="button button2" type="button" disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${freeBoardList.currentPage != i}">
						<button class="button button1" type="button" onclick="location.href='?currentPage=${i}'">${i}</button>
					</c:if>
				</c:forEach>
			<!-- 10페이지 뒤로 -->
				<c:if test="${freeBoardList.currentPage < freeBoardList.totalPage}">
					<button class="button button1" type="button" title="다음 10페이지로" 
					onclick="location.href='?currentPage=${freeBoardList.endPage +1}'">다음</button>
				</c:if>
				<c:if test="${freeBoardList.currentPage >= freeBoardList.totalPage}">
					<button class="button button2" type="button" title="이미 마지막 페이지입니다." disabled="disabled">다음</button>
				</c:if>
				
			<!-- 맨뒤로 -->
				<c:if test="${freeBoardList.currentPage < freeBoardList.totalPage}">
					<button class="button button1" type="button" title="마지막 페이지로" 
					onclick="location.href='?currentPage=${freeBoardList.totalPage}'">마지막</button>
				</c:if>
				<c:if test="${freeBoardList.currentPage >= freeBoardList.totalPage}">
					<button class="button button2" type="button" title="이미 마지막 페이지입니다." disabled="disabled">맨뒤</button>
				</c:if>
			</td>
		</tr>
		<!-- 글쓰기 버튼  -->
		 <tr>
			<td align="right" colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='insert.jsp'"/>
			</td>
		</tr>
	</table>
</main>
<script src="https://kit.fontawesome.com/27afa53023.js" crossorigin="anonymous"></script>
</body>
</html>