<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jsp.member.model.*, java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mb" scope="request" class="jsp.member.model.MemberBean" />
<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("memId");
if (id == null) {
	response.sendRedirect("login.jsp");
}
memberDAO mdao = new memberDAO();
%>
<div class="mypage">
	<font class="myfont">마이페이지</font><br> 닉네임 :<%=mb.getNickname()%><br>
	아이디 :<%=mb.getId()%><br> 이메일 :<%=mb.getEmail()%><br> 학년 :<%=mb.getClassyear()%><br>
	<div class="btn1">
		<form action="page_control.jsp" method="post">
			<input type="submit" value="내가 쓴 글" class="btn" /> 
			<input type="hidden" name="search" value="myPage">
			<input type="hidden" name="userId" value="<%=mb.getId()%>">
		</form>
	</div>
	<div class="cus">
		<a href="page_control.jsp?action=edit&mb_id=<%=mb.getId()%>&adminIf=no">회원정보수정</a>
	</div>
</div>