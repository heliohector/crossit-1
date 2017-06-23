<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "crossit.teamD.model.*" %>
<%@ page import = "crossit.teamD.controller.*" %>

<% 	
	//등록페이지에서 전달받은 파라미터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	//등록페이지에서 전달받은 파라미터 저장
	ContactDO ctDO = new ContactDO();
	ctDO = ctDO.getRequestParameter(request);
	
	//DB에 삽입
	ContactDAO ctDAO = new ContactDAO();
	ctDAO.insert(ctDO);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판::글등록 확인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<script>
	alert("완료되었습니다.");
	var param = $(location).attr("search").slice($(location).attr("search").indexOf("=")+1);
	
	if(param == "main1") { window.location.href = "../main1.html"; }
	else { window.location.href = "../main2.html"; }
	</script>
</body>
</html>