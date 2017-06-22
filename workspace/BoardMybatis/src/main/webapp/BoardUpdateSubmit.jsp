<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.web.board.model.*" %>
<%@ page import = "com.web.board.controller.*" %>

<% 	
	request.setCharacterEncoding("UTF-8");
	
	//수정페이지에서 전달받은 파라미터 저장
	BoardInfoDO infoDO = new BoardInfoDO();
	infoDO = infoDO.getRequestParameter(request);
	
	//DB 수정
	infoDO.setBoardIndex(Integer.parseInt(request.getParameter("boardIndex")));
	BoardInfoDAO infoDAO = new BoardInfoDAO();
	infoDAO.update(infoDO);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::글수정 확인</title>
</head>
<body>
	<script>
	alert("글이 수정되었습니다.");
	window.location.href = "indexAjax.html";
	</script>
</body>
</html>