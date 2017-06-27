<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "crossit.teamD.model.*" %>
<%@ page import = "crossit.teamD.controller.*" %>

<% 
	request.setCharacterEncoding("UTF-8"); 
	
	//request 파라미터로 받은 ctNum으로 해당 리스트를 가져옴
	int ctNum = Integer.parseInt(request.getParameter("ctNum"));
	
	ContactDAO ctDAO = new ContactDAO();
	ContactDO ctDO = ctDAO.selectByNum(ctNum);
	
	
	//상태가 '안읽음'이면, '읽음'으로 수정
	if(ctDO.getCtStatus().equals("안읽음")){
		ctDO.setCtStatus("읽음");
		ctDAO.update(ctDO);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>문의게시판::상세조회</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="event.js"></script>
</head>
<body>
	<br><h2>상세 내용</h2><br>
	
	<input type="button" name="listButton" value="돌아가기" 
		   onclick="javascript:window.location.href = 'contact.html';"><br>
	<br>
	
	<input type="button" name="deleteButton" value="삭제" 
		   onclick="javascript:location.href='delete.jsp?From=read&ctNum=<%= ctDO.getCtNum() %>';"><br>
	<br>
	
	<input type="button" name="completeButton" value="답장 완료" 
		   onclick="javascript:location.href='update.jsp?Cancel=no&ctNum=<%= ctDO.getCtNum() %>';"><br>
	<br>
	<input type="button" name="completeCancelButton" value="답장 완료 취소" 
		   onclick="javascript:location.href='update.jsp?Cancel=yes&ctNum=<%= ctDO.getCtNum() %>';"><br>
	<br>
	
	<table>
		<tr>
			<td>문의자</td>
			<td><%= ctDO.getCtName() %></td>
		</tr>
		<tr>
			<td>문의자이메일</td>
			<td><%= ctDO.getCtEmail() %></td>
		</tr>
		<tr>
			<td>문의내용</td>
			<td><%= ctDO.getCtMsg() %></td>
		</tr>
		<tr>
			<td>등록일시</td>
			<td><%= ctDO.getCtRgDate() %></td>
		</tr>
		<tr>
			<td>상태</td>
			<td><%= ctDO.getCtStatus() %></td>
		</tr>
	</table>
</body>
</html>