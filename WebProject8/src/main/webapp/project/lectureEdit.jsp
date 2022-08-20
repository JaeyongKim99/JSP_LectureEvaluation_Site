<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>
<jsp:useBean id="lb" scope="request" class="evaluationProject.LectureDTO"/>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="css/insert.css">
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
   
<div class = "section">
<div class="lectureContainer">
  <form action="page_control.jsp" method="get" class="form">
  <input type="hidden" name="notice"value="update">
	<input type="hidden" name="lectureId" value="<%= lb.getLectureId()%>">
    <div class="lectureRow">
      <div class="col-25">
        <label for="fname">강의명</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="lectureName" placeholder="강의명을 입력하세요." value="<%= lb.getLectureName() %>" required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lname">교수명</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="professorName" placeholder="교수이름을 입력하세요." value="<%= lb.getProfessorName() %>"required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lectureDivide">강의 구분</label>
      </div>
      <div class="col-75">
        <select id="lectureDivide" name="lectureDivide">
          <option value="전공" <% if("전공".equals(lb.getLectureDivide())){
        	  %>
        	  selected
        	  <%
          }
          %>>전공</option>
          <option value="교양" <% if("교양".equals(lb.getLectureDivide())){
        	  %>
        	  selected
        	  <%
          }
          %>>교양</option>
        </select>
      </div>
    </div>
    <div class="lectureRow" id = "btn">
      <input type="submit" value="등록하기">
    </div>
    <input type=hidden name="lecture" value="update">
  </form>
</div>
</div>
</div>
<footer class = "footer_block">
		<jsp:include page="module/bottom.jsp" flush="false"/>
</footer>
</body>
</html>
