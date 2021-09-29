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
<title>212 자유 게시판 - 해당 글 보기</title>
</head>
<body>
	<table align="center" width="1000" cellspacing="0">
		<tr>
			<th colspan="4">
				게시글 보기
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
				${vo.idx}
			</td>
			<td align="center">
				<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')} "/>
	 			<c:set var="name" value="${fn:replace(name, '>', '&gt;')} "/>
				${vo.name}
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
			<td colspan="4" align="center">
				<input type="button" value="수정하기" onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'"/>
				<input type="button" value="삭제하기" onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"/>
				<!--onclick="history.back() or .go(-1)" 는 데이터 안넘어가서 location.href 로 해야돼  -->
				<input type="button" value="돌아가기" onclick="location.href='list.jsp?hit=${vo.hit}'">
			</td>
		</tr>
	</table>
	<hr color="white" size="3">
	
	<form action="commentOK.jsp" name ="commentForm" method="post">
		<table align="center" width="1000" cellspacing="0">
			<tr>
				<!-- 댓글이보이면 안되는 줄로 작업이 완료 되면 hiddend으로 처리한다. -->
				<td bgcolor="gray" colspan="4">
					idx : <input type="text" name="idx" value="${vo.idx}" size="1"> <!-- 수정 또는 삭제할 댓글의 글번호 넘겨줌 -->
					gup : <input type="text" name="gup" value="${vo.idx}" size="1"> <!--현재 댓글이 어떤 메인글의 댓글을 넘겨준다 -->
					mode : <input type="text" name="mode" value="1" size="1"> <!-- 작업모드, 1=> 댓글저장, 2=> 댓글 수정, 3 => 댓글 삭제 -->
					currentPage : <input type="text" name="currentPage" value="${currentPage}" size="1"> <!-- 메인글의 페이지 번호 넘겨줌 -->
					ip : <input type="text" name="ip" value="${pageContext.request.remoteAddr}" size="10"> <!-- 댓글 작성자 ip 주소 -->
				</td>
			</tr>
			<tr>
				<td width="20%" align="center">
					<label for="name">이름</label>
				</td>
				<td width="30%">
					<input id="name" name="name" type="text" width="98%">
				</td>
				<td width="20%" align="center">
					<label for="password">비밀번호</label>
				</td>
				<td width="30%">
					<input id="password" name="password" type="password" width="98%">
				</td>
			</tr>
			<tr>
				<td width="20%" align="center">
					<label for="content">내용</label>
				</td>
				<td colspan="3">
					<textarea id="content" name="content" rows="5" cols="95" style="resize: none;"></textarea>
				</td>
			</tr>
			<tr>
			 	<td colspan="4" align="center">
			 		<input type="submit" value="댓글쓰기" name="commentBtn"/>
			 		<input type="button" value="다시쓰기" />
				</td>
			</tr>
		</table>
	</form>
	
	
	
	
	
	
	
	
<script src="https://kit.fontawesome.com/27afa53023.js" crossorigin="anonymous"></script>
</body>
</html>