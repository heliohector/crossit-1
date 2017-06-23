<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "crossit.teamD.model.*" %>
<%@ page import = "crossit.teamD.controller.*" %>
<%@ page import = "net.sf.json.JSONObject" %>

<%
	//전체 리스트 가져옴
	ContactDAO ctDAO = new ContactDAO();
	List<ContactDO> list = ctDAO.selectAll();
	
	//json 객체 형태로 리스트 변환
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("item", list);
	
	//json 파일로 인식
	response.setContentType("application/json");
	//json 출력
	out.print(jsonObject);
%>