<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/FAQ.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
			<div class="accordion">
				<input type="checkbox" id="answer01"> <label for="answer01">계정
					블락을 당했습니다. 블락 사유가 무엇인가요?<em></em>
				</label>
				<div>
					<p>
						계정 블락 사유에는 다음과 같은 이유가 있습니다.<br> - 불량/성의 없는 강의평 작성(3회이상) : 90일
					</p>
				</div>
				<input type="checkbox" id="answer02"> <label for="answer02">회원탈퇴는
					어디서 하나요?<em></em>
				</label>
				<div>
					<p>
						회원 탈퇴의 경우 '마이페이지 > 회원정보수정 > 회원탈퇴' 에서 가능합니다.<br> 해당 방법으로 탈퇴가
						불가능하다면 1:1 문의를 통해 문의 바랍니다.
					</p>
				</div>
				<input type="checkbox" id="answer03"> <label for="answer03">강의평가는
					어떻게 작성하나요?<em></em>
				</label>
				<div>
					<p>강의평가는 메인페이지나 강의검색 탭에서 강의검색을 하신 후, 개별강의 페이지의 강의평가 남기기 버튼을 통해
						작성할 수 있습니다.</p>
				</div>
				<input type="checkbox" id="answer04"> <label for="answer04">강의평가를
					작성하고 싶은데 이번학기 강의는 언제 업로드 되나요?<em></em>
				</label>
				<div>
					<p>매 학기 강의는 성적 공시일이 끝난 후에 업데이트 됩니다.</p>
				</div>
				<input type="checkbox" id="answer05"> <label for="answer05">회원가입
					버튼이 눌리지 않습니다.<em></em>
				</label>
				<div>
					<p>
						*비밀번호 규정: 영문대소문자/숫자/특수문자 모두 사용. 8~20자 입력<br> *닉네임 규정:
						영문대소문자/숫자/한글 중 각 1가지 이상 조합. 2~12자 입력.
					</p>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer_block">
		<jsp:include page="module/bottom.jsp" flush="false" />
	</footer>
</body>
</html>