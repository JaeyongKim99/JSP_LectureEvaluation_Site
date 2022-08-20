<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, jsp.member.model.*"%>
    <div class="root">
	    <section id="top">
        <a id="logo" href="index.jsp"><img src="img/portfolio/logo.png" alt="로고" width="140px" height="40px"></a>
		    <nav id="top_menu">
          <ul>
            <li class="aaa">
            	<a href="page_control.jsp?action=list&adminIf=ok" style="color: gray;">회원정보 </a>
            </li>
            <li>
            	<a href="page_control.jsp?notice=list" style="color: gray;">공지사항 </a>
            </li>
            <li>
            	<a href="page_control.jsp?lecture=list" style="color: gray;">강의관리 </a>
            </li>
            <li>
            	<a href="page_control.jsp?search=list&adminIf=ok" style="color: gray;">강의평가관리 </a>
            </li>
            <ul style="float:right;list-style-type:none;">
            	<li><a href="module/logoutProcess.jsp" style="color: gray;"> 로그아웃</a></li>
            </ul>
          </ul>
          
        </nav>
	    </section>
    </div>