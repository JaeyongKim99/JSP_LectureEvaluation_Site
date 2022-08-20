<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>
<jsp:useBean id="mb" scope="request" class="jsp.member.model.MemberBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
  <form action="page_control.jsp" method="post">
    <div class="lectureRow">
      <div class="col-25">
        <label for="fname">강의명</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="lectureName" placeholder="강의명을 입력하세요." required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lname">교수명</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="professorName" placeholder="교수이름을 입력하세요." required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lectureYear">수강 연도</label>
      </div>
      <div class="col-75">
        <select id="lectureYear" name="lectureYear">
          <option value="2021">2021</option>
          <option value="2020">2020</option>
          <option value="2019">2019</option>
          <option value="2018">2018</option>
        </select>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="semesterDivide">수강학기</label>
      </div>
      <div class="col-75">
        <select id="semesterDivide" name="semesterDivide">
          <option value="1학기">1학기</option>
          <option value="2학기">2학기</option>
        </select>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="classDivide">강의 구분</label>
      </div>
      <div class="col-75">
        <select id="lectureDivide" name="lectureDivide">
          <option value="전공">전공</option>
          <option value="교양">교양</option>
        </select>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lname">강의 만족도</label>
      </div>
      <div class="star-rating space-x-4 mx-auto">
		<input type="radio" id="5-stars" name="satisfactionRating" value="5" v-model="ratings"/>
		<label for="5-stars" class="star pr-4">★</label>
		<input type="radio" id="4-stars" name="satisfactionRating" value="4" v-model="ratings"/>
		<label for="4-stars" class="star">★</label>
		<input type="radio" id="3-stars" name="satisfactionRating" value="3" v-model="ratings"/>
		<label for="3-stars" class="star">★</label>
		<input type="radio" id="2-stars" name="satisfactionRating" value="2" v-model="ratings"/>
		<label for="2-stars" class="star">★</label>
		<input type="radio" id="1-star" name="satisfactionRating" value="1" v-model="ratings" />
		<label for="1-star" class="star">★</label>
	  </div>
    </div>
     <div class="lectureRow">
      <div class="col-25">
        <label for="difficultyScore">난이도</label>
      </div>
      <div class="col-75">
        <input type="number" id="difficultyScore" min="1" max="5" name ="difficultyScore" placeholder="1" required>
      </div>
    </div>
     <div class="lectureRow">
      <div class="col-25">
        <label for="volumeScore">학습량</label>
      </div>
      <div class="col-75">
        <input type="number" id="volumeScore" min="1" max="5" name="volumeScore" placeholder="1" required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="evaluationContent">내용</label>
      </div>
      <div class="col-75">
        <textarea id="evaluationContent" name="evaluationContent" style="height:200px" required>강의평을 입력해주세요.</textarea>
      </div>
    </div>
    <div class="lectureRow" id = "btn">
      <input type="submit" value="등록하기">
    </div>
    <input type=hidden name="search" value="insert">
    <input type=hidden name="userNick" value="<% session.getAttribute("memNick");%>">
    <input type=hidden name="userId" value="<% session.getAttribute("memId");%>">
  </form>
</div>
</div>
</div>
<footer class = "footer_block">
		<jsp:include page="module/bottom.jsp" flush="false"/>
</footer>
</body>
</html>
