<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/Notice.css">
<jsp:useBean id="no" scope="request" class="noticeProject.NoticeDTO"/>
<title>Insert title here</title>
</head>
<body>
<div class="Notice">
<h1 style="margin-left:21%">공지사항</h1>
<form action="page_control.jsp" method="post">
<input type="hidden" name="notice"value="updateDB">
<input type="hidden" name="no"value="<%= no.getNo()%>">
<table>
	<tr>
	<th>제목</th><td colspan=3 align="left" style="padding-bottom:1px">
	<input type="text" name="title" class="title" size=100 value="<%= no.getTitle()%>"></td>
	<tr><th style="padding-right:15px;">내용</th><td colspan=3 align="left" style="padding-bottom:10px">
	<textarea name="contents" class="contents" cols=102 rows=20><%= no.getContents()%></textarea></td></tr>
</table>
<input type="submit" value="글쓰기"  style="width:100px; height:50px;"  class="btn2">
</div>
</form>
</body>
</html>