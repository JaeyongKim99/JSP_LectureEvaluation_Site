<%@page import="java.net.URLEncoder"%>
<%@page import="evaluationProject.EvaluationDTO"%>
<%@page import="evaluationProject.LectureDTO"%>
<%@page import="noticeProject.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	errorPage="evaluation_error.jsp" pageEncoding="utf-8"
	import="jsp.member.model.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ page
	import="java.io.*, java.util.regex.Matcher, java.util.regex.Pattern"%>
<jsp:useBean id="mb" class="jsp.member.model.memberDAO" />
<jsp:useBean id="addrmember" class="jsp.member.model.MemberBean" />
<jsp:setProperty name="addrmember" property="*" />

<jsp:useBean id="eb" class="evaluationProject.EvaluationDAO" />
<jsp:useBean id="addrevaluation" class="evaluationProject.EvaluationDTO" />
<jsp:setProperty name="addrevaluation" property="*" />
<jsp:setProperty name="addrevaluation" property="userNick"
	value="<%=session.getAttribute(\"memNick\")%>" />
<jsp:setProperty name="addrevaluation" property="userId"
	value="<%=session.getAttribute(\"memId\")%>" />
<jsp:useBean id="lb" class="evaluationProject.LectureDAO" />
<jsp:useBean id="addrlecture" class="evaluationProject.LectureDTO" />
<jsp:setProperty name="addrlecture" property="*" />

<jsp:useBean id="no" class="noticeProject.NoticeDAO" />
<jsp:useBean id="addrnotice" class="noticeProject.NoticeDTO" />
<jsp:setProperty name="addrnotice" property="*" />

<jsp:useBean id="lkb" class="evaluationProject.LikeyDAO" />
<%
// 컨트롤러 요청 파라미터
String action = request.getParameter("action"); // 회원 열람 컨트롤러
String search = request.getParameter("search"); // 강의평가 열람 컨트롤러
String lecture = request.getParameter("lecture"); //강의 열람 컨트롤러
String notice = request.getParameter("notice"); //공지사항 열람 컨트롤러
String likey = request.getParameter("likey"); //추천수 컨트롤러
// 파라미터에 따른 요청 처리

// 회원 전체 열람인 경우

if ("list".equals(action)) {
	session.setAttribute("tableCategory", "member");
	String ifAdmin = request.getParameter("adminIf");
	ArrayList<MemberBean> datas = mb.getDBList();
	request.setAttribute("datas", datas);
	if("ok".equals(ifAdmin)){
		pageContext.forward("index.jsp"); //관리자 페이지로 이동
	}
	else{
		pageContext.forward("page_control.jsp?action=open"); //마이페이지로 이동
	}
}

// 회원 수정 요청인 경우
else if ("edit".equals(action)) {
	String id = request.getParameter("mb_id");
	String ifAdmin = request.getParameter("adminIf");
	MemberBean mBean = mb.getDB(id);
	request.setAttribute("mb", mBean);
	request.setAttribute("adminIf", ifAdmin);
	pageContext.forward("module/Edit.jsp");
}

else if ("open".equals(action)) {
	String id = (String) session.getAttribute("memId");
	session.setAttribute("myPageControl", "myPage");
	MemberBean mBean = mb.getDB(id);
	request.setAttribute("mb", mBean);
	pageContext.forward("Mypage.jsp");
}

// 로그인
else if ("login".equals(action)) {
	String id = null;
	String password = null;
	if (request.getParameter("id") != null) {
		id = request.getParameter("id");
	}
	if (request.getParameter("password") != null) {
		password = request.getParameter("password");
	}
	// null값이 있는지 확인
	if (id == null || password == null || id.equals("") || password.equals("")) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('입력이 올바르지 않습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}
	if (id.equals("admin") || password.equals("admin")) {
		session.setAttribute("memLogin", "admin");
		response.sendRedirect("index.jsp");
	}

	// 오류를 감지하기 위해 result 값에 담음
	int result = mb.login(id, password);
	if (result == 1) {
		session.setAttribute("memLogin", "ok");
		if (request.getParameter("idSave") == null) {
	session.removeAttribute("memSave");
		} else {
	session.setAttribute("memSave", "check");
		}
		session.setAttribute("memId", id);
		session.setAttribute("memPw", password);
		//강의평가 작성때 닉네임을 보내주기 위해 로그인할때 닉네임을 가져와 세션에 선언한다.
		String nick = mb.getNameDB(id);
		session.setAttribute("memNick", nick);
		response.sendRedirect("page_control.jsp?notice=list");
	}

	else if (result == 0) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('비밀번호가 틀립니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}

	else if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('존재하지 않는 아이디입니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	} else
		throw new Exception("DB 입력오류");
}

// 회원 가입
else if ("insert".equals(action)) {
	String nickname = null;
	String id = null;
	String password = null;
	String userPwc = null;
	String email = null;
	String classyear = null;
	if (request.getParameter("nickname") != null) {
		nickname = request.getParameter("nickname");
	}
	if (request.getParameter("id") != null) {
		id = request.getParameter("id");
	}
	if (request.getParameter("password") != null) {
		password = request.getParameter("password");
	}
	if (request.getParameter("passwordCheck") != null) {
		userPwc = request.getParameter("passwordCheck");
	}
	if (request.getParameter("email") != null) {
		email = request.getParameter("email");
	}
	if (request.getParameter("classyear") != null) {
		classyear = request.getParameter("classyear");
	}

	if (!(password.equals(userPwc))) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('비밀번호가 같지 않습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}
	// null값이 있는지 확인
	if (id == null || password == null || email == null || classyear == null || nickname == null || id.equals("")
	|| password.equals("") || password.equals("") || nickname.equals("") || classyear.equals("")) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('입력이 올바르지 않습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}

	// 오류를 감지하기 위해 result변수에 담음
	int result = mb.insertDB(addrmember);
	if (result > 0) {

		response.sendRedirect("page_control.jsp?notice=list");
	}

	else if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('회원가입에 실패했습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	} else
		throw new Exception("DB 입력오류");
}

// 회원 정보 수정
else if ("update".equals(action)) {
	String adminIf = request.getParameter("adminIf");
	if (mb.updateDB(addrmember)) {
		response.sendRedirect("page_control.jsp?action=list&adminIf=" + adminIf);
	} else
		throw new Exception("DB 갱신오류");
}
// 회원 정보 삭제
else if ("delete".equals(action)) {
	if (mb.deleteDB(addrmember.getId())) {
		response.sendRedirect("page_control.jsp?action=list");
	} else
		throw new Exception("DB 삭제 오류");
}

// 강의평가 열람인 경우

String memLogin = null;
memLogin = "ok";//(String)session.getAttribute("memLogin");
if (memLogin == "ok") { // 로그인후 헤더

} else if (memLogin == "admin") { // 관리자 헤더

} else {
	PrintWriter pw = response.getWriter();
	pw.println("<script>");
	pw.println("alert('로그인을 해주세요.')");
	pw.println("location.href='login.jsp'");
	pw.println("</script>");
	pw.close();
	return;
}

if ("list".equals(search)) {
	session.setAttribute("tableCategory", "evaluation");
	String ifAdmin = request.getParameter("adminIf");
	ArrayList<EvaluationDTO> datas = eb.getDBList();
	request.setAttribute("datas", datas);
	if("ok".equals(ifAdmin)){
		pageContext.forward("index.jsp"); //관리자 페이지로 이동
	}
	else{
		pageContext.forward("page_control.jsp?action=open"); //마이페이지로 이동
	}
}

else if ("insert".equals(search)) {

	String userId = null; //유저아이디
	String userNick = null; // 유저닉네임
	String lectureName = null; //강의이름
	String professorName = null; //교수명
	int lectureYear = 0; //수강년도
	String semesterDivide = null; //학기
	String lectureDivide = null; //강의 구분(교양인지 전공인지)
	String evaluationContent = null; //내용
	int satisfactionRating = 0; //만족도
	int difficultyScore = 0; //난이도
	int volumeScore = 0; //학습량

	if (request.getParameter("userId") != null) {
		userId = request.getParameter("userId");

	}
	if (request.getParameter("userNick") != null) {
		userNick = request.getParameter("userNick");
	}
	if (request.getParameter("lectureName") != null) {
		lectureName = request.getParameter("lectureName");
	}
	if (request.getParameter("professorName") != null) {
		professorName = request.getParameter("professorName");
	}
	if (request.getParameter("lectureYear") != null) {
		try {
	lectureYear = Integer.parseInt(request.getParameter("lectureYear"));
		} catch (Exception e) {
	System.out.println("수강 연도 데이터 오류");
		}
	}
	if (request.getParameter("semesterDivide") != null) {
		semesterDivide = request.getParameter("semesterDivide");
	}
	if (request.getParameter("lectureDivide") != null) {
		lectureDivide = request.getParameter("lectureDivide");
	}
	if (request.getParameter("evaluationContent") != null) {
		evaluationContent = request.getParameter("evaluationContent");
	}
	if (request.getParameter("satisfactionRating") != null) {
		try {
	satisfactionRating = Integer.parseInt(request.getParameter("satisfactionRating"));
		} catch (Exception e) {
	System.out.println("만족도 데이터 오류");
		}
	}
	if (request.getParameter("difficultyScore") != null) {
		try {
	difficultyScore = Integer.parseInt(request.getParameter("difficultyScore"));
		} catch (Exception e) {
	System.out.println("난이도 데이터 오류");
		}
	}
	if (request.getParameter("volumeScore") != null) {
		try {
	volumeScore = Integer.parseInt(request.getParameter("volumeScore"));
		} catch (Exception e) {
	System.out.println("학습량 데이터 오류");
		}
	}

	//null값이 있는지 한번더 확인
	if (lectureName == null || professorName == null || lectureYear == 0 || semesterDivide == null
	|| lectureDivide == null || evaluationContent == null || satisfactionRating == 0 || difficultyScore == 0
	|| volumeScore == 0 || lectureName.equals("") || professorName.equals("") || lectureDivide.equals("")
	|| semesterDivide.equals("") || evaluationContent.equals("")) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('입력이 올바르지 않습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}
	int result = eb.write(addrevaluation);
	if (result > 0) {
		int Srcount = eb.getSrCount(lectureName); //강의평가가 입력될때마다 강의 테이블의 평균 총점을 구한다.
		int Dscount = eb.getDsCount(lectureName);
		int Vscount = eb.getVsCount(lectureName);
		int avgGrade = (Srcount + Dscount + Vscount) / 3;
		lb.updateAvgGrade(avgGrade, lectureName);
		int evaluationCount = eb.getevaluationCount(lectureName); //강의평가가 입력될 때마다 강의평가의 개수를 구한다.
		lb.updateEvalationCount(evaluationCount, lectureName);
		response.sendRedirect("page_control.jsp?notice=list");
	} else if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('강의 평가 등록 실패했습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	} else
		throw new Exception("DB 입력오류");
}

// 강의평가 정보 수정
else if ("update".equals(search)) {
	if (eb.updateDB(addrevaluation)) {
		response.sendRedirect("page_control.jsp?search=list");
	} else
		throw new Exception("DB 갱신오류");
}
// 강의평가 정보 삭제
else if ("delete".equals(search)) {
	String lectureName = eb.getEvaluationUserID(addrevaluation.getEvaluationId(), "강의이름");
	int evaluationCount = eb.getevaluationCount(lectureName); //강의평가가 삭제될 때마다 강의평가의 개수를 구한다.
	lb.updateEvalationCount(evaluationCount, lectureName);
	String ifAdmin = request.getParameter("adminIf");
	if (eb.deleteDB(addrevaluation.getEvaluationId())) {
		response.sendRedirect("page_control.jsp?search=list&adminIf="+ifAdmin);
	} else
		throw new Exception("DB 삭제 오류");
}
// 내가 쓴글 열람
else if ("myPage".equals(search)) {
	session.setAttribute("myPageControl", "myEvaluation");
	String userId = request.getParameter("userId");
	System.out.println(userId);
	ArrayList<EvaluationDTO> datas = eb.getMyEvaluation(userId);
	request.setAttribute("datas", datas);
	pageContext.forward("Mypage.jsp"); //관리자 페이지로 이동
}

// 강의 열람인 경우
if ("list".equals(lecture)) {
	session.setAttribute("tableCategory", "lecture");
	ArrayList<LectureDTO> datas = lb.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("index.jsp"); //관리자 페이지로 이동
}

else if ("edit".equals(lecture)) {
	String id = request.getParameter("lectureId");
	LectureDTO lBean = lb.getLectureNameDB(id);
	request.setAttribute("lb", lBean);
	pageContext.forward("lectureEdit.jsp"); // 아직 안만듬
}

else if ("insert".equals(lecture)) {
	String lectureName = null; //강의명
	String professorName = null; // 교수명
	String lectureDivide = null; //강의 종류
	int avgGrade = 0; //평균 학점
	int lectureCount = 0; //강의 평가 개수

	if (request.getParameter("lectureName") != null) {
		lectureName = request.getParameter("lectureName");
	}
	if (request.getParameter("professorName") != null) {
		professorName = request.getParameter("professorName");
	}
	if (request.getParameter("lectureDivide") != null) {
		lectureDivide = request.getParameter("lectureDivide");
	}

	if (lectureName == null || professorName == null || lectureDivide == null || lectureName.equals("")
	|| professorName.equals("") || lectureDivide.equals("")) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('입력이 올바르지 않습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}
	int result = lb.insert(addrlecture);

	if (result > 0) {
		response.sendRedirect("index.jsp");
	} else if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('강의 등록 실패했습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	} else
		throw new Exception("DB 입력오류");
}

// 강의 정보 수정
else if ("update".equals(lecture)) {
	if (lb.updateDB(addrlecture)) {
		response.sendRedirect("page_control.jsp?lecture=list");
	} else
		throw new Exception("DB 갱신오류");
}
// 강의 정보 삭제
else if ("delete".equals(lecture)) {
	if (lb.deleteDB(addrlecture.getLectureId())) {
		response.sendRedirect("page_control.jsp?lecture=list");
	} else
		throw new Exception("DB 삭제 오류");
}
// 강의 검색
else if ("search".equals(lecture)) {
	request.setAttribute("lectureSearch", "ok");
	String keyword = request.getParameter("keyword");
	ArrayList<LectureDTO> datas = lb.getlist(keyword);
	request.setAttribute("lectureDatas", datas);
	session.setAttribute("lectureSearch", "ok");
	pageContext.forward("ClassSearch.jsp"); //관리자 페이지로 이동
}

// 강의 상세 페이지 출력 메소드
else if ("result".equals(lecture)) {
	String id = request.getParameter("lectureId");
	String order = request.getParameter("order");
	
	String lectureName = null;
	LectureDTO lBean = lb.getLectureNameDB(id);
	lectureName = lBean.getLectureName();
	ArrayList<EvaluationDTO> datas = eb.getlist(lectureName, order);
	int Srcount = eb.getSrCount(lectureName); //특정 강의의 평균만족도을 구해온다.
	int Dscount = eb.getDsCount(lectureName); //특정 강의의 평균난이도을 구해온다.
	int Vscount = eb.getVsCount(lectureName); //특정 강의의 평균학습량을 구해온다.
	request.setAttribute("lb", lBean); // 특정 강의 데이터를 넘겨준다.
	request.setAttribute("datas", datas); // 강의평가배열데이터를 넘겨준다.
	request.setAttribute("Srcount", Srcount); // 평균데이터들을 넘겨준다.
	request.setAttribute("Dscount", Dscount);
	request.setAttribute("Vscount", Vscount);
	request.setAttribute("result", "result");//강의 페이지 출력 파라메터
	request.setAttribute("SearchInput", "SearchInput");//강의 페이지가 출력될때 검색바 없애는 파라메터
	pageContext.forward("ClassSearch.jsp");
}

else if ("resultList".equals(lecture)) {
	String order = request.getParameter("order");
	String lectureName = request.getParameter("lectureName");
	String id = lb.getlectureNameToId(lectureName);
	LectureDTO lBean = lb.getLectureNameDB(id);
	ArrayList<EvaluationDTO> datas = eb.getlist(lectureName, order);
	int Srcount = eb.getSrCount(lectureName); //특정 강의의 평균만족도을 구해온다.
	int Dscount = eb.getDsCount(lectureName); //특정 강의의 평균난이도을 구해온다.
	int Vscount = eb.getVsCount(lectureName); //특정 강의의 평균학습량을 구해온다.
	request.setAttribute("lb", lBean); // 특정 강의 데이터를 넘겨준다.
	request.setAttribute("datas", datas); // 강의평가배열데이터를 넘겨준다.
	request.setAttribute("Srcount", Srcount); // 평균데이터들을 넘겨준다.
	request.setAttribute("Dscount", Dscount);
	request.setAttribute("Vscount", Vscount);
	request.setAttribute("result", "result");//강의 페이지 출력 파라메터
	request.setAttribute("SearchInput", "SearchInput");//강의 페이지가 출력될때 검색바 없애는 파라메터
	pageContext.forward("ClassSearch.jsp");
}

//공지사항 글쓰기
if ("list".equals(notice)) {
	session.setAttribute("tableCategory", "notice");
	ArrayList<NoticeDTO> datas = no.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("index.jsp"); //관리자 페이지로 이동
}

else if ("insert".equals(notice)) {

	int noticenum = 0; //공지사항 번호
	String title = null; //공지사항 제목
	String contents = null; //공지사항 내용

	if (request.getParameter("no") != null) {
		noticenum = Integer.parseInt(request.getParameter("no"));
	}
	if (request.getParameter("title") != null) {
		title = request.getParameter("title");
	}
	if (request.getParameter("contents") != null) {
		try {
	contents = request.getParameter("contents");
		} catch (Exception e) {
	System.out.println("공지사항 글쓰기 오류");
		}
	}
	int result = no.noticeDB(addrnotice);
	if (result > 0) {
		response.sendRedirect("index.jsp");

	} else if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('공지사항 등록에 실패했습니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	} else
		throw new Exception("DB 입력오류");
}
// 공지사항 수정
else if ("updateDB".equals(notice)) {
	if (no.noticeupDB(addrnotice)) {
		response.sendRedirect("page_control.jsp?notice=list");
	} else
		throw new Exception("DB 갱신오류");
}
// 공지사항 삭제
else if ("deleteDB".equals(notice)) {
	if (no.noticedelDB(addrnotice.getNo())) {
		response.sendRedirect("page_control.jsp?notice=list");
	} else
		throw new Exception("DB 삭제 오류");
} else if ("edit".equals(notice)) {
	String id = request.getParameter("no");
	NoticeDTO NDto = no.getDB(id);
	request.setAttribute("no", NDto);
	pageContext.forward("NoticeEdit.jsp");
}
//공지사항 메인
else if ("noticelist".equals(notice)) {
	ArrayList<NoticeDTO> datas = no.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("help.jsp"); //관리자 페이지로 이동
} else if ("noticeresult".equals(notice)) {
	String id = request.getParameter("no");
	NoticeDTO NDto = no.getDB(id);
	request.setAttribute("no", NDto);
	pageContext.forward("Notice.jsp");
}

//추천
if ("like".equals(likey)) {
	String userID = null;

	if (session.getAttribute("memId") != null) {
		userID = (String) session.getAttribute("memId");
	}
	if (userID == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('로그인을 해주세요.')");
		pw.println("location.href = 'login.jsp'");
		pw.println("</script>");
		pw.close();
		return;
	}

	String evaluationID = null;
	if (request.getParameter("evaluationId") != null) {
		evaluationID = request.getParameter("evaluationId");
	}

	String lectureName = eb.getEvaluationUserID(Integer.parseInt(evaluationID), "강의이름");
	// 강의명
	int result = lkb.like(userID, evaluationID);
	if (result == 1) {
		result = eb.like(evaluationID);
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('추천이 완료되었습니다.')");
		pw.println("location.href = 'page_control.jsp?lecture=result&order=latest&lectureId="
		+ lb.getlectureNameToId(lectureName) + "'");
		pw.println("</script>");
		pw.close();
		return;

	} else {
		result = eb.likeDelete(evaluationID);
		if (result == 1) {
	result = lkb.delete(userID, evaluationID);
	PrintWriter pw = response.getWriter();
	pw.println("<script>");
	pw.println("alert('추천이 삭제되었습니다.')");
	pw.println("location.href = 'page_control.jsp?lecture=result&order=latest&lectureId="
			+ lb.getlectureNameToId(lectureName) + "'");
	pw.println("</script>");
	pw.close();
	return;
		}
	}
}

else if ("delete".equals(likey)) {
	int evaluationId = Integer.parseInt(request.getParameter("evaluationId"));
	String usreid = (String) session.getAttribute("memId");
	String lectureName = URLEncoder.encode(eb.getEvaluationUserID(evaluationId, "강의이름"), "UTF-8");
	if (!eb.getEvaluationUserID(evaluationId, "작성자아이디").equals(usreid)) { // 강의 평가아이디로 작성자 아이디를 가져와 로그인한 사용자아이디와 같은지 비교
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('작성자가 아닙니다.')");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
	} else {
		if (eb.deleteDB(evaluationId)) {
			int evaluationCount = eb.getevaluationCount(lectureName); //강의평가가 삭제될 때마다 강의평가의 개수를 구한다.
			lb.updateEvalationCount(evaluationCount, lectureName);
			response.sendRedirect("page_control.jsp?lecture=resultList&lectureName=" + lectureName + "&order=latest"); 
		} else
			throw new Exception("DB 삭제 오류");
	}
}
%>