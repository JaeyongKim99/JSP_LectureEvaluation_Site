<%@page import="evaluationProject.EvaluationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeProject.NoticeDTO"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<section id="main">
	<div id="mainb" onclick="location.href='page_control.jsp?notice=list'">
		<img src="img/portfolio/mainb.png">
	</div>
</section>
<form action="page_control.jsp" method="post">
	<div class="search">
		<div class="Mainsearch">
			<input type="text" placeholder="교수명, 강의명으로도 검색해보세요 :)"
				class="Mainsearch searchBar" name="keyword">
			<button class="Mainsearch icon">
				<i class="fa fa-search"></i>
			</button>
			<input type=hidden name="lecture" value="search">
		</div>
	</div>
</form>
<section class="notice_block">
	<div class="notice">
		<u class="u">공지사항</u> <a href="page_control.jsp?notice=noticelist"><font
			size="2">더 보기 <i class="fas fa-angle-right"></i></a>
		<ul class="u2">
			<%
			if ("admin".equals(session.getAttribute("memLogin"))) {
			}else{
				int i = 0;
				for (NoticeDTO no : (ArrayList<NoticeDTO>) datas) {
					i++;
					if (i == 6)
				break;
			%>
			<li class="noticeLi"><a class="noticeLink"
				href="page_control.jsp?notice=noticeresult&no=<%=no.getNo()%>"><%=no.getTitle()%></a>
				<span class="noticeDate"><%=no.getDate()%></span></li>
			<%
				}
			}
			%>
		</ul>
	</div>
</section>