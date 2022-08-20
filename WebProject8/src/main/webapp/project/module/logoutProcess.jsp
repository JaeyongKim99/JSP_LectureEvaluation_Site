<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("memLogin");
	session.invalidate(); //세션에 있는 모든 값을 삭제한다.
	out.println("<script>alert('로그아웃 되었습니다.');</script>");
	out.println("<script>location.href='../page_control.jsp?notice=list'</script>");
%>