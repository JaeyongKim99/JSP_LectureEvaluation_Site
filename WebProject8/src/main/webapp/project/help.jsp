<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeProject.NoticeDTO"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/FAQ.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/7f5811a0ff.js"
	crossorigin="anonymous"></script>
<title>FAQ</title>
</head>
<body>
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
	<br>
	<div class="helpSection">
		<div class="helpArea">
			<div class="hf">
				<a href="page_control.jsp?notice=noticelist" class="help"><font
					class="help">도움말 메인</font></a> &nbsp;&nbsp;<a href="FAQ.jsp"
					class="faqq"><font class="faqq">자주찾는 질문</font></a> <br> <br>
			</div>
			<font class="inquiry">1:1문의하기는 당분간 dong@gmail.com으로 주세요!</font> <br>
			<br>
			<p class="NoticeT">공지사항</p>
			<div class="NoticeMain">
				<table class="NoticTable">
					<colgroup>
						<col width="85">
						<col width="*">
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th class="no">번호</th>
							<th class="title">제목</th>
							<th class="no">등록일</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (NoticeDTO no : (ArrayList<NoticeDTO>) datas) {
						%>
						<tr>
							<td class="NoticeNo"><%=no.getNo()%></td>
							<td><a class="NoticeTitle"
								href="page_control.jsp?notice=noticeresult&no=<%=no.getNo()%>"><%=no.getTitle()%></a>
							</td>
							<td class="NoticeNo"><span class="NoticeDate"><%=no.getDate()%></span>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer class="footer_block">
		<jsp:include page="module/bottom.jsp" flush="false" />
	</footer>
</body>
</html>