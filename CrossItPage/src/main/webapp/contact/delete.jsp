<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "crossit.teamD.controller.*" %>

<% 
 	request.setCharacterEncoding("UTF-8"); 
	
	//contact.html 과 read.jsp 중 하나의 파라미터값 가져옴
	String from = request.getParameter("From");
	
	//contact.html에서 삭제
	if(from.equals("contact")){
		
		//request 파라미터로 받은 선택된 문의 가져옴 
		String[] checkArr = request.getParameterValues("contact-check");
		
		//선택된 것이 없음
		if(checkArr == null){
			%>
			<script type="text/javascript">
			alert("선택된 문의가 없습니다.");
			window.location.href = "contact.html";
			</script>
			<%
		}
		else {
			for(String value : checkArr){
				//int로 변환
				int ctNum = Integer.parseInt(value);
				//전체 삭제 시, 테이블 최상단 제외
				if(ctNum != -1){
					//리스트 삭제
					ContactDAO ctDAO = new ContactDAO();
					ctDAO.delete(ctNum);
				}			
			}
		}		
	}
	else { //read.jsp에서 삭제
		
		//request 파라미터로 받은 ctNum으로 해당 리스트를 가져옴
		int ctNum = Integer.parseInt(request.getParameter("ctNum"));
		
		//리스트 삭제
		ContactDAO ctDAO = new ContactDAO();
		ctDAO.delete(ctNum);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>문의게시판::삭제 확인</title>
</head>
<body>
	<script>
	alert("삭제되었습니다.");
	window.location.href = "contact.html";
	</script>
</body>
</html>