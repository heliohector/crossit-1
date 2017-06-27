<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "crossit.teamD.model.*" %>
<%@ page import = "crossit.teamD.controller.*" %>

<%
	request.setCharacterEncoding("UTF-8"); 
	
	//'답장완료' 와 '답장완료취소' 버튼 구별
	String cancel = request.getParameter("Cancel");
	
	//'답장완료'
	if(cancel.equals("no")){
		
		//request 파라미터로 받은 ctNum으로 해당 리스트를 가져옴
		int ctNum = Integer.parseInt(request.getParameter("ctNum"));

		ContactDAO ctDAO = new ContactDAO();
		ContactDO ctDO = ctDAO.selectByNum(ctNum);

		//상태를 '답장완료'으로 수정
		ctDO.setCtStatus("답장완료");
		ctDAO.update(ctDO);

	} else { //'답장완료취소'

		//request 파라미터로 받은 ctNum으로 해당 리스트를 가져옴
		int ctNum = Integer.parseInt(request.getParameter("ctNum"));

		ContactDAO ctDAO = new ContactDAO();
		ContactDO ctDO = ctDAO.selectByNum(ctNum);

		//상태를 '읽음'으로 수정
		ctDO.setCtStatus("읽음");
		ctDAO.update(ctDO);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>문의게시판::답장완료 확인</title>
</head>
<body>
	<script>
	alert("완료되었습니다.");
	window.location.href = "contact.html";
	</script>
</body>
</html>