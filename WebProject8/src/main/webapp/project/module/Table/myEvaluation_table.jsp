<%@page import="evaluationProject.EvaluationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, jsp.member.model.*"%>
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("memId");
	if (id == null) {
		response.sendRedirect("login.jsp");
	}
	memberDAO mdao = new memberDAO();
	%>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">
						<div class="row header">
							<div class="cell">
								닉네임
							</div>
							<div class="cell">
								아이디
							</div>
							<div class="cell">
								강의명
							</div>
							<div class="cell">
								내용
							</div>
							<div class="cell">
								삭제
							</div>
						</div>
						<%
							
							for(EvaluationDTO eb : (ArrayList<EvaluationDTO>)datas) {
						%>
						<div class="row">
							<div class="cell" data-title="닉네임">
								<%=eb.getUserNick() %>
							</div>
							<div class="cell" data-title="아이디">
								<%=eb.getUserId() %>
							</div>
							<div class="cell" data-title="강의명">
								<%=eb.getLectureName() %>
							</div>
							<div class="cell" data-title="내용">
								<%=eb.getEvaluationContent() %>
							</div>
							<div class="cell" data-title="삭제">
								<a href="page_control.jsp?search=delete&evaluationId=<%=eb.getEvaluationId() %>&adminIf=no" onclick="return delcheck(this)">삭제</a>
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


