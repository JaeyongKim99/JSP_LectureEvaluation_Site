<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jsp.member.model.*, java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("memId");
if (id == null) {
	response.sendRedirect("login.jsp");
}
memberDAO mdao = new memberDAO();
%>
<div class="mypage">
	<font class="myfont">내가 쓴 강의평가</font><br>
	
	<div class="btn1">
		<form action="page_control.jsp" method="post">
			<input type="button" value="내가 쓴 글" class="btn" /> <input
				type="hidden" name="search" value="myPage">
		</form>
	</div>
</div>