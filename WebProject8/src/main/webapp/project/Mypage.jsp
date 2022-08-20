<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jsp.member.model.*, java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>

<jsp:useBean id="mb" scope="request" class="jsp.member.model.MemberBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/myPage.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/7f5811a0ff.js"
	crossorigin="anonymous"></script>
<%
String memLogin_head = null;
memLogin_head = (String) session.getAttribute("memLogin");
if (memLogin_head == "admin") { // 관리자 헤더
%>
<jsp:include page="module/Table/table_header.jsp" flush="false" />
<%
}
%>
<title>DBLUE</title>
</head>
<body class="body">
	<div class="body-content">
		<header>
			<%
			String memLogin = null;
			memLogin = (String) session.getAttribute("memLogin");
			if (memLogin == "ok") { // 로그인후 헤더
			%>
			<jsp:include page="module/top_login.jsp" flush="false" />
			<%
			} else if (memLogin == "admin") { // 관리자 헤더
			%>
			<jsp:include page="module/admin_top.jsp" flush="false" />
			<%
			} else {
			%>
			<jsp:include page="module/top.jsp" flush="false" />
			<%
			}
			%>
		</header>
		<%
		String myPageControl = null;
		myPageControl = (String) session.getAttribute("myPageControl");
		if (myPageControl == "myPage") { // 마이페이지
		%>
			<jsp:include page="module/myPage.jsp" flush="false" />
		<%
		} else if (myPageControl == "myEvaluation") { // 내가 쓴 강의평가 열람
		%>
			<jsp:include page="module/Table/table_header.jsp" flush="false" />
			<jsp:include page="module/Table/myEvaluation_table.jsp" flush="false" />
		<%
		} 
		else {
			response.sendRedirect("login.jsp"); // 로그인이 안되어 있을때 로그인 페이지로 보낸다.
		}
		%>
	</div>
	<footer class="footer_block">
		<jsp:include page="module/bottom.jsp" flush="false" />
	</footer>
</body>
</html>