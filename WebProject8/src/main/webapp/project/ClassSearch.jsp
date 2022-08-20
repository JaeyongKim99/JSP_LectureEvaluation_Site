<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/Search.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/7f5811a0ff.js" crossorigin="anonymous"></script>

<title>강의검색</title>
</head>
<body class="body">
  <div class="body-content2">
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
    </header>
		<%
		String lectureSearch = null;
		String SearchInput = null;
		lectureSearch = (String)request.getAttribute("lectureSearch");
		SearchInput = (String)request.getAttribute("SearchInput");
		if(SearchInput == null){
			%>
			 <jsp:include page="module/searchBar.jsp" flush="false" />
			<%
		}
		%>
	</div>
	<hr>
	<div>
		<% 
  			lectureSearch = null;
			String searchResult = null;
			lectureSearch = (String)request.getAttribute("lectureSearch");
			searchResult = (String)request.getAttribute("result");
  			if(lectureSearch == "ok"){ // 로그인후 헤더
  				%>
  				 <jsp:include page="module/searchLecture.jsp" flush="false" />
  				<%
  			}
  			else{
  				if(searchResult == "result"){
  					%>
  					<jsp:include page="module/searchResult.jsp" flush="false" />
  					<%
  				}
  			}
  			
  		%>
	</div>
	
	<footer class = "footer_block">
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>
</html>