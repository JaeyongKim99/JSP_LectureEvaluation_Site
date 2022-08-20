<%@page import="evaluationProject.LectureDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, evaluationProject.*"%>
    
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
	<link rel="stylesheet" type="text/css" href="css/wbtn.css">
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div>
			<input type="button" onclick="location.href='lectureInsert.jsp'" value="강의작성" class="wbtn">
		</div>
					<div class="table">
						<div class="row header">
							<div class="cell">
								강의번호
							</div>
							<div class="cell">
								강의명
							</div>
							<div class="cell">
								교수명
							</div>
							<div class="cell">
								강의종류
							</div>
							<div class="cell">
								수정
							</div>
							<div class="cell">
								삭제
							</div>
						</div>
						<%
							
							for(LectureDTO no : (ArrayList<LectureDTO>)datas) {
						%>
						<div class="row">
							<div class="cell" data-title="강의번호">
								<%=no.getLectureId() %>
							</div>
							<div class="cell" data-title="강의명">
								<%=no.getLectureName() %>
							</div>
							<div class="cell" data-title="교수명">
								<%=no.getProfessorName() %>
							</div>
							<div class="cell" data-title="강의종류">
								<%=no.getLectureDivide() %>
							</div>
								<div class="cell" data-title="수정">
								<a href="page_control.jsp?lecture=edit&lectureId=<%=no.getLectureId() %>">수정</a>
							</div>
							<div class="cell" data-title="삭제">
								<a href="page_control.jsp?lecture=delete&lectureId=<%=no.getLectureId() %>" onclick="return delcheck(this)">삭제</a>
							</div>
						</div>
						<%
							}
			 			%>

					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			return true;
		} 
		else
			return false;
		}
		
	</script>



	

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>


