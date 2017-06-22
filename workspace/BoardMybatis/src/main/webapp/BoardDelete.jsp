<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.web.board.controller.*" %>

<% 
 	request.setCharacterEncoding("UTF-8"); 
	
	//request 파라미터로 받은 boardIndex로 해당 리스트를 가져옴
	int boardIndex = Integer.parseInt(request.getParameter("boardIndex"));
	
	//리스트 삭제
	BoardInfoDAO infoDAO = new BoardInfoDAO();
	infoDAO.delete(boardIndex);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::글삭제 확인</title>
</head>
<body>
	<script>
	alert("글이 삭제되었습니다.");
	window.location.href = "indexAjax.html";
	</script>
</body>
</html>