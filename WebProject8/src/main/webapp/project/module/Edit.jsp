<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jsp.member.model.*"%>
<%@ page import="java.util.Enumeration" %>
<link rel="stylesheet" type="text/css" href="css/login.css">

<jsp:useBean id="mb" scope="request" class="jsp.member.model.MemberBean" />
	
  <div class="resister_panel">
    <div class="login_logo">
    <a href="page_control.jsp?notice=list" >
      <img src="img/portfolio/logo.png" alt="DBLUE" width="140px" height="40px">
    </a>
    </div>
    <div class="register_title">
    <form action="page_control.jsp" method="post" name="frm">
	  <input type=hidden name="action" value="update">
	  <input type=hidden name="adminIf" value=<%= request.getAttribute("adminIf") %>>
      <input type="text" placeholder="닉네임" class="input_Width" name="nickname" value="<%= mb.getNickname()%>"><br>
      <input type="text" placeholder="아이디" class="input_Width" name="id" value="<%= mb.getId()%>" readonly><br>
      <input type="text" placeholder="비밀번호" class="input_Width" name="password" value="<%= mb.getPassword() %>"><br>
      <input type="text" placeholder="이메일" class="input_Width" name="email"  value="<%= mb.getEmail() %>"><br>
      <input type="number" min="1" max="4" placeholder="학년" class="input_Width"  name="classyear" value="<%= mb.getClassyear() %>"><br>
      <button type ="submit" class="btn" style="margin-top: 10px; width: 92%;">수정하기</button><br>
     </form>
    </div>
  </div>
