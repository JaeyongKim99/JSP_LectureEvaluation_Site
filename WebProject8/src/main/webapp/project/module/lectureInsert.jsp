<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/insert.css">

<div class = "section">
<div class="lectureContainer">
  <form action="../page_control.jsp" method="post">
    <div class="lectureRow">
      <div class="col-25">
        <label for="fname">강의명</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="lectureName" placeholder="강의명을 입력하세요." required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lname">교수명</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="professorName" placeholder="교수이름을 입력하세요." required>
      </div>
    </div>
    <div class="lectureRow">
      <div class="col-25">
        <label for="lectureDivide">강의 구분</label>
      </div>
      <div class="col-75">
        <select id="lectureDivide" name="lectureDivide">
          <option value="전공">전공</option>
          <option value="교양">교양</option>
        </select>
      </div>
    </div>
    <div class="lectureRow" id = "btn">
      <input type="submit" value="등록하기">
    </div>
    <input type=hidden name="search" value="insert">
  </form>
</div>
</div>