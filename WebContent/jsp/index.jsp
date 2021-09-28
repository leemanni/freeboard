<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>212 자유 게시판</title>
</head>
<body>
<header>
	<h1>212 ~ 자유 게시판  ~ </h1>
</header>

<form action="insertOK.jsp" method="post">
	<table align="center" width="800" border="2" cellpadding="4" cellspacing="0" >
		<tr>	
			<th colspan="3">
				게시판
			</th>
		</tr>
		<tr>
		 	<td width="15%">
		 		<label for="name">이름</label>
		 	</td>
		 	<td width="70%">
		 		<input type="text" id="name" name="name" style="width: 95%" />
		 	</td>
		 	<td width="15%">
		 		공지글
		 		<input type="checkbox" name="name" value="notice" name ="notice">
		 	</td>
		 </tr>
		<tr>
		 	<td width="15%">
		 		<label for="password">비밀번호</label>
		 	</td>
		 	<td width="85%" colspan="2">
		 		<input type="password" id="password" name="password" style="width: 95%" />
		 	</td>
		 </tr>
		<tr>
		 	<td width="15%">
		 		<label for="subject">제목</label>
		 	</td>
		 	<td width="85%" colspan="2">
		 		<input type="text" id="subject" name="subject" style="width: 95%" />
		 	</td>
		 </tr>
		<tr>
		 	<td width="15%">
		 		<label for="content">내용</label>
		 	</td>
		 	<td width="85%" colspan="2">
		 		<textarea rows="10" cols="78" id="content" name="content" style="resize: none;"></textarea>
		 	</td>
		 </tr>
		 <tr>
		 	<td colspan="3">
		 		<input type="submit" value="저장하기">
		 		<input type="reset">
		 		<input type="button" value="돌아가기" onclick="history.back()">
		 	</td>
		 </tr>
	</table>
	<input type="hidden"  name="ip" value="${pageContext.request.remoteAddr}">
</form>


</body>
</html>