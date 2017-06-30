<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "crossit.teamD.model.*" %>
<%@ page import = "crossit.teamD.controller.*" %>

<%
	request.setCharacterEncoding("UTF-8"); 
	
	//request 파라미터로 select값 받음
	int select = Integer.parseInt(request.getParameter("term-select"));
	
	//기수 기준 목록 수 계산
	AttendanceDAO attDAO = new AttendanceDAO();
	int numRows = attDAO.countByTerm(select);
	
	//기수 기준 출결번호 조회
	List<Integer> selectArr = attDAO.selectByTerm(select);
	
	//테이블 3~7열의 td value 값을 받음 
	for(int i=0 ; i<numRows ; i++){
		int j=i+1;
		
		//해당 출결번호의  bean 받음 
		AttendanceDAO atDAO = new AttendanceDAO();
		AttendanceDO atDO = atDAO.selectByNum(selectArr.get(i));
		//잔여,출석,지각,결석,가산 값 수정
		String rest = request.getParameter("input"+j+"-"+3);
		String present = request.getParameter("input"+j+"-"+4);
		String late = request.getParameter("input"+j+"-"+5);
		String absent = request.getParameter("input"+j+"-"+6);
		String plus = request.getParameter("input"+j+"-"+7);
		
		if(rest != null)
			atDO.setAtRest(Float.parseFloat(rest));
		if(present != null)
			atDO.setAtPresent(Integer.parseInt(present));
		if(late != null)
			atDO.setAtLate(Integer.parseInt(late));
		if(absent != null)
			atDO.setAtAbsent(Integer.parseInt(absent));
		if(plus != null)
			atDO.setAtPlus(Integer.parseInt(plus));

		atDAO.update(atDO);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출결:저장 확인</title>
</head>
<body>
	<script>
	alert("저장되었습니다.");
	window.location.href = "attendance.html";
	</script>
</body>
</html>