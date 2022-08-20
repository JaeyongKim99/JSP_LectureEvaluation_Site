<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="root">
	    <section id="top">
        <a id="logo" href="page_control.jsp?notice=list"><img src="img/portfolio/logo.png" alt="로고" width="140px" height="40px"></a>
		    <nav id="top_menu">
          <ul>
            <li class="aaa"><a href="ClassSearch.jsp"><i class="fa fa-search"></i> 강의검색 </a></li>
            <li><a href="login.jsp" onclick="alert('로그인을 해주세요.')"><i class="fas fa-clipboard-list"></i> 강의평가 </a></li>
            <li><a href="page_control.jsp?notice=noticelist"><i class="fas fa-question"></i> 도움말 </a></li>
            <ul style="float:right;list-style-type:none;">
              <li><a href="login.jsp"> 로그인</a></li>
            <li><a href="signUp.jsp"> 회원가입</a></li>
            </ul>
          </ul>
        </nav>
	    </section>
    </div>