<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::글등록</title>
	<link type="text/css" rel="stylesheet" href="css/Index2.css">
</head>
<body>
	<br><br><div class="top">글 등록하기</div><br>
	<hr color="#66A7DB">
	
	<form action="BoardCreateSubmit.jsp" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td class="tableLeft">제목</td>
			<td><input type="text" name="title" size="100"></td>
		</tr>
		<tr>
			<td class="tableLeft">글쓴이</td>
			<td><input type="text" name="userName" size="100"></td>
		</tr>
		<tr>
			<td class="tableLeft">내용</td>
			<td><textarea cols="75" rows="10" name="content"></textarea></td>
		</tr>
		<tr>
			<td class="tableLeft">첨부파일</td>
			<td><input type="file" name="file" size="50"></td>
		</tr>
	</table>
	<hr color="#66A7DB"><br>
	<div class="rightButton">
		<input type="submit" name="submit" value="등록">
		<input type="button" name="cancel" value="취소" onclick="javascript:history.back();">
	</div>
 	</form>
</body>
</html>