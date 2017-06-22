<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.web.board.model.*" %>
<%@ page import = "com.web.board.controller.*" %>

<%
	request.setCharacterEncoding("UTF-8"); 
	
	//request 파라미터로 받은 boardIndex로 해당 리스트를 가져옴
	int boardIndex = Integer.parseInt(request.getParameter("boardIndex"));
	
	BoardInfoDAO infoDAO = new BoardInfoDAO();
	BoardInfoDO infoDO = infoDAO.selectByIndex(boardIndex);
	
	//파일이 저장될 서버 경로
	String uploadPath = request.getServletContext().getRealPath("downloads");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::글수정</title>
	<link type="text/css" rel="stylesheet" href="css/Index2.css">
</head>
<body>
	<br><br><div class="top">글 수정하기</div><br>
	<hr color="#66A7DB">
	
	<form action="BoardUpdateSubmit.jsp?boardIndex=<%= infoDO.getBoardIndex() %>" 
		  method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td class="tableLeft">제목</td>
			<td><input type="text" name="title" size="100" value=<%= infoDO.getTitle() %>></td>
		</tr>
		<tr>
			<td class="tableLeft">글쓴이</td>
			<td><input type="text" name="userName" size="100" value=<%= infoDO.getUserName() %>></td>
		</tr>
		<tr>
			<td class="tableLeft">내용</td>
			<td><textarea cols="75" rows="10" name="content"><%= infoDO.getContent() %></textarea></td>
		</tr>
		<% if(infoDO.getFile() != null) { %>
			<tr>
				<td class="tableLeft">첨부파일 </td>
				<td><a href="<%=uploadPath %>\<%=infoDO.getFile() %>"><%=infoDO.getFile() %></a></td>
			</tr>			
		<% } %>
		<tr>
			<td class="tableLeft">첨부할 파일</td>
			<td><input type="file" name="file" size="50"></td>
		</tr>
	</table>
	<hr color="#66A7DB"><br>
	<div class="rightButton">
		<input type="submit" name="submit" value="수정">
		<input type="button" name="cancel" value="취소" onclick="javascript:history.back();">
	</div>
 	</form>
</body>
</html>