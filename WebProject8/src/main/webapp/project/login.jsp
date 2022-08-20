<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   
<html lang="en">
<head>
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>로그인</title>
  <%
  	String check = (String)session.getAttribute("memSave");
  	String id = (String)session.getAttribute("memId");
	String pw = (String)session.getAttribute("memPw");
  	String idStr=null, pwStr=null, checkStr=null;
	if(check==null){
		idStr = ""; pwStr= ""; checkStr = "";
	} else {
		idStr = id; pwStr= pw; checkStr = "checked";
	}
  %>
</head>
<body>
  <div class="login_panel">
    <div class="login_logo">
    <a href="page_control.jsp?notice=list" >
      <img src="img/portfolio/logo.png" alt="DBLUE" width="140px" height="40px">
    </a>
    </div>
    <div class="login_title">
    <form method="post" name="frm" action="page_control.jsp">
      <input type="text" placeholder="아이디" class="input_Width" name="id"  value= <%=idStr %>><br>
      <input type="password" placeholder="비밀번호" class="input_Width" name="password"  value= <%=pwStr %>><br>
      <button type ="submit" class="btn">로그인</button><br>
      <div class="checkbox-container">
        <input type="checkbox" id="U_checkAgreement" name="idSave" value="c1" <%=checkStr %>>
        <label for="U_checkAgreement">아이디/비번 저장</label>
      </div>
      <input type=hidden name="action" value="login">
    </form>
    </div>
  </div>
</body>
</html>