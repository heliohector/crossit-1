<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.web.board.model.*" %>
<%@ page import = "com.web.board.controller.*" %>

<% 
	//form태그에서 요청 시 데이터 한글 처리
	request.setCharacterEncoding("UTF-8"); 

	TeamInfoDAO infoDAO = new TeamInfoDAO();
	List<TeamInfoDO> list = infoDAO.selectAll();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" class="no-js modern">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="http://fonts.googleapis.com/css?family=Lato:100" rel="stylesheet">
	<title>크로스아이티</title>
	<link type="text/css" rel="stylesheet" href="css/index.css">
</head>
<body>
	<div id="containder">
		<div class="sidebar">
			<ul>
				<img class="img" src="img/crossit.png" width="300px" height="80px">
				<li><a href="">LOGIN</a></li>
				<li><a href="#contact">CONTACT</a></li>
				<li><a href="#team">TEAM</a></li>
				<li><a href="#portfolio">PORTFOLIO</a></li>
				<li><a href="#home">HOME</a></li>
			</ul>
		</div>
		
		
		<div id="home">
			<div class="inner">
				<header>
					<h1>Cross IT</h1>
					<p>대학생 + 직장인 연합 IT 동아리</p>
				</header>
			</div>
			<img class="photo" src="img/a.jpg" alt=""> 
			<img class="photo" src="img/b.jpg" alt=""> 
			<img class="photo" src="img/c.jpg" alt=""> 
			<img class="photo" src="img/d.jpg" alt="">
		</div>
		
		
		<div id="team">
			<div id="team_grid">
				<div id="planner">
					<h1>MANAGER</h1>
					<div id="planner_grid">
						<%
							for (TeamInfoDO infoDO : list) {
								if (infoDO.getDepartment().equals("manager")) {
						%>
						<div class="team_image plan bor" 
							 style="background-image: url('img/<%=infoDO.getFileName()%>');">
							<div class="sha">
								<h1><%=infoDO.getUserName()%></h1>
							</div>
						</div>
						<%
								}
							}
						%>
					</div>
				</div>
				<div id="developer">
					<h1>DEVELOPER</h1>
					<div id="developer_grid">
						<%
							for (TeamInfoDO infoDO : list) {
								if (infoDO.getDepartment().equals("developer")) {
						%>
						<div class="team_image deve bor" 
							 style="background-image: url('img/<%=infoDO.getFileName()%>');">
							<div class="sha">
								<h1><%=infoDO.getUserName()%></h1>
							</div>
						</div>
						<%
								}
							}
						%>
						<%
							for(int i=0 ; i<8 ; i++) {
						%>
						<div class="noname deve bor">
							<div class="sha">
								<h1>noname</h1>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
				<div id="designer">
					<h1>DESIGNER</h1>
					<div id="designer_grid">
						<%
							for (TeamInfoDO infoDO : list) {
								if (infoDO.getDepartment().equals("designer")) {
						%>
						<div class="team_image desi bor" 
							 style="background-image: url('img/<%=infoDO.getFileName()%>');">
							<div class="sha">
								<h1><%=infoDO.getUserName()%></h1>
							</div>
						</div>
						<%
								}
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/myjs.js"></script>
	<script src="js/index.js"></script>
</body>
</html>