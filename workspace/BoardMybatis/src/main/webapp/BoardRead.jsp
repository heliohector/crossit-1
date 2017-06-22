<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.web.board.model.*" %>
<%@ page import = "com.web.board.controller.*" %>

<% 
	request.setCharacterEncoding("UTF-8"); 
	
	//request 파라미터로 받은 boardIndex로 해당 리스트를 가져옴
	int boardIndex = Integer.parseInt(request.getParameter("boardIndex"));
	
	BoardInfoDAO infoDAO = new BoardInfoDAO();
	BoardInfoDO infoDO = infoDAO.selectByIndex(boardIndex);
	
	//파일이 저장된 서버 경로
	String uploadPath = request.getServletContext().getRealPath("downloads");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::내용읽기</title>
	<link type="text/css" rel="stylesheet" href="css/Index2.css">
	<script src="js/Script.js"></script>
</head>
<body>
	<br><br><div class="top">상세 내용</div>
	
	<div class="rightButton">	
		<input type="button" name="updateButton" value="글 수정" 
			onclick="javascript:location.href='BoardUpdate.jsp?boardIndex=<%= infoDO.getBoardIndex() %>';">
		<input type="button" name="deleteButton" value="글 삭제"
			onclick="javascript:location.href='BoardDelete.jsp?boardIndex=<%= infoDO.getBoardIndex() %>';">
		<input type="button" name="listButton" value="글 목록" onclick="javascript:history.back();">
	</div>
	<hr color="#66A7DB">
	
	<table>
		<tr>
			<td class="tableLeft">제목</td>
			<td><%= infoDO.getTitle() %></td>
		</tr>
		<tr>
			<td class="tableLeft">글쓴이</td>
			<td><%= infoDO.getUserName() %></td>
		</tr>
		<tr>
			<td class="tableLeft">내용</td>
			<td><%= infoDO.getContent() %></td>
		</tr>
		<tr>
			<td class="tableLeft">첨부파일</td>
			<td><% if(infoDO.getFile() != null) { %>
				<a href="<%=uploadPath %>\<%= infoDO.getFile() %>"><%= infoDO.getFile() %></a>
			<% } %></td>
		</tr>
		<tr>
			<td class="tableLeft">등록일시</td>
			<td><%= infoDO.getRegisterDate() %></td>
		</tr>
	</table>
	<hr color="#66A7DB">
</body>
</html>