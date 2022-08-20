<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/7f5811a0ff.js" crossorigin="anonymous"></script>
<%
	String memLogin_head = null;
	memLogin_head = (String)session.getAttribute("memLogin");
	if(memLogin_head == "admin"){ // 관리자 헤더
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
  			String memLogin = null; // 로그인 여부에 따라 탑메뉴 보여주는 로직
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
    </header>
    <%	
    	String memLogin_main = null; //로그인 여부에 따라 중간 메뉴 보여주는 로직 
		memLogin_main = (String)session.getAttribute("memLogin");
		if(memLogin_main == "ok"){ // 로그인후 메인
				%>
				 <jsp:include page="module/main.jsp" flush="false" />
				<%
		}
		else if(memLogin_main == "admin"){ // 관리자 메인
			String tableCategory = null;
			tableCategory = (String)session.getAttribute("tableCategory");
			if(tableCategory == "member"){
				%>
			  	<jsp:include page="module/Table/table.jsp" flush="false" />
				<%
			}
			else if(tableCategory == "evaluation"){
				%>
			  	<jsp:include page="module/Table/evaluatuion_table.jsp" flush="false" />
				<%
			}
			else if(tableCategory == "notice"){
				%>
			  	<jsp:include page="module/Table/notice_table.jsp" flush="false" />
				<%
			}
			else if(tableCategory == "lecture"){
				%>
			  	<jsp:include page="module/Table/lecture_table.jsp" flush="false" />
				<%
			}
		}
		else {
			%>
			 <jsp:include page="module/main.jsp" flush="false" />
			<%
		}
    %>
    
	</div>
	<footer class = "footer_block">
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>
</html>