<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "com.web.board.model.*" %>
<%@ page import = "com.web.board.controller.*" %>

<% 	
	//등록페이지에서 전달받은 파라미터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	//등록페이지에서 전달받은 파라미터 저장
	BoardInfoDO infoDO = new BoardInfoDO();
	infoDO = infoDO.getRequestParameter(request);
	
	//DB에 삽입
	BoardInfoDAO infoDAO = new BoardInfoDAO();
	infoDAO.insert(infoDO);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::글등록 확인</title>
</head>
<body>
	<script>
	alert("글이 등록되었습니다.");
	window.location.href = "indexAjax.html";
	</script>
</body>
</html>