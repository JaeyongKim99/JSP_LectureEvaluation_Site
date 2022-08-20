<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeProject.NoticeDTO"%>
<jsp:useBean id="no" scope="request" class="noticeProject.NoticeDTO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/FAQ.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/7f5811a0ff.js" crossorigin="anonymous"></script>
<title>notices</title>
</head>
<body>
<header>
  		<% 
  			String memLogin = null;
  			memLogin = (String)session.getAttribute("memLogin");
  			if(memLogin == "ok"){ // 로그인후 헤더
  				%>
  				 <jsp:include page="module/top_login.jsp" flush="false" />
  				<%
  			}
  			else if(memLogin == "admin"){ // 관리자 헤더
  				%>
 				 <jsp:include page="module/admin_top.jsp" flush="false" />
 				<%
  			} else{
  				%>
				 <jsp:include page="module/top.jsp" flush="false" />
				<%
  			}
  		%>
    </header><br>
 <section class="notsec">
 <div class="NotPage">
 <div class="nottitle">
 	<p class="notw1">공지사항</p>
 	<p class="notw2"><%=no.getTitle() %></p>
 	<p class="notw3"><%=no.getDate() %></p>
 </div>
<p class="notcon">
 <span><%=no.getContents() %><br><br>
 </span>
</p>
<button class="notback" onclick="location.href='page_control.jsp?notice=noticelist'">
	<img src="img/icons/prev-arrow.png" width="30px" height="30px" class="arrow">뒤로가기
</button>
 </div>
 </section>
	<footer class = "footer_block">
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>
</html>