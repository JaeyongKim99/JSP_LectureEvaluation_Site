<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <script type="text/javascript" charset="UTF-8">
  function Checkform() {
	  var check = document.frm.U_checkAgreement.checked;
	   if(!check){
	       alert("개인정보 수집에 동의해 주세요.");
	       return false;
	   }
	   var Password = document.frm.password.value;
     var Id = document.frm.id.value;
     var Nick = document.frm.nickname.value;
     var Email = document.frm.email.value;
     var reg_email = /^([0-9a-zA-Z_\.-]+)$/;
     if(!/^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,15}$/.test(Password)){
      alert("비밀번호는 영문, 숫자, 특수문자 반드시 포함 8자 이상 15자 이하로 만들어주세요.");
      return false;
     }

     if(!/^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,15}$/.test(Id)){
      alert("아이디는 영문, 숫자 반드시 포함 6자 이상 15자 이하로 만들어주세요.");
      return false;
     }

     if(!/^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]+.{1,12}$/.test(Nick)){
      alert("닉네임은 영어, 한글, 숫자 조합 2자 이상 12자 이하로 만들어주세요.");
      return false;
     }
     
     if(!reg_email.test(Email)) {                
    	 alert("이메일을 제대로 입력해 주세요.");
          return false;         
     }                                                  
  }
  </script>
  <title>회원가입</title>
</head>
<body>
  <div class="resister_panel">
    <div class="login_logo">
    <a href="page_control.jsp?notice=list" >
      <img src="img/portfolio/logo.png" alt="DBLUE" width="140px" height="40px">
    </a>
    </div>
    <div class="register_title">
    <form action="page_control.jsp" method="post" name="frm" onsubmit="return Checkform(this)">
      <input type="text" placeholder="닉네임" class="input_Width" name="nickname"><br>
      <p class="register">영어, 한글, 숫자 조합 2자 이상 12자 이하</p>
      <p class="register">닉네임은 변경할 수 없으며, 공개되는 정보임에 주의하세요!</p>
      <input type="text" placeholder="아이디" class="input_Width" name="id"><br>
      <p class="register">영문, 숫자 반드시 포함 6자 이상 15자 이하</p>
      <input type="password" placeholder="비밀번호" class="input_Width" name="password"><br>
      <input type="password" placeholder="비밀번호 확인" class="input_Width" name="passwordCheck"><br>
      <p class="register">영문, 숫자, 특수문자 반드시 포함 8자 이상 15자 이하</p>
      <div class="register_email_div">
        <input type="text" placeholder="학교 이메일" id="register_email_input" class="input_Width" name="email">
        <p class="register_email">@school.ac.kr</p>
      </div>
      <p class="register">학교 이메일은 소속 학교 인증 및 개인정보 찾기에 이용됩니다.</p>
      <input type="number" min="1" max="4" placeholder="학년" class="input_Width"  name="classyear"><br>
      <div class="checkbox-container">
        <input type="checkbox" id="U_checkAgreement">
        <label for="U_checkAgreement" class="register">동의 및 회원가입을 누르면 <a href="">DBLUE 이용약관 및 개인정보 처리 방침</a>에 동의하게 됩니다.</label>
      </div>
      <button type ="submit" class="btn" style="margin-top: 10px;">회원가입</button><br>
      <input type=hidden name="action" value="insert">
     </form>
    </div>
  </div>
</body>
</html>