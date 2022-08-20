<%@page import="noticeProject.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, jsp.member.model.*"%>
    
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
	<link rel="stylesheet" type="text/css" href="css/wbtn.css">
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div>
			<input type="button" onclick="location.href='WriteForm.jsp'" value="글쓰기" class="wbtn">
		</div>
					<div class="table">
						<div class="row header">
							<div class="cell">
								번호
							</div>
							<div class="cell">
								제목
							</div>
							<div class="cell">
								수정
							</div>
							<div class="cell">
								삭제
							</div>
						</div>
						<%
							
							for(NoticeDTO no : (ArrayList<NoticeDTO>)datas) {
						%>
						<div class="row">
							<div class="cell" data-title="번호">
								<%=no.getNo() %>
							</div>
							<div class="cell" data-title="제목">
								<%=no.getTitle() %>
							</div>
								<div class="cell" data-title="수정">
								<a href="page_control.jsp?notice=edit&no=<%=no.getNo() %>">수정</a>
							</div>
							<div class="cell" data-title="삭제">
								<a href="page_control.jsp?notice=deleteDB&no=<%=no.getNo() %>" onclick="return delcheck(this)">삭제</a>
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


