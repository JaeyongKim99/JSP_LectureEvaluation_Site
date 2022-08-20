<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, jsp.member.model.*"%>
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
	
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
								비밀번호
							</div>
							<div class="cell">
								이메일
							</div>
							<div class="cell">
								학년
							</div>
							<div class="cell">
								수정
							</div>
							<div class="cell">
								삭제
							</div>
						</div>
						<%
							
							for(MemberBean mb : (ArrayList<MemberBean>)datas) {
						%>
						<div class="row">
							<div class="cell" data-title="닉네임">
								<%=mb.getNickname() %>
							</div>
							<div class="cell" data-title="아이디">
								<%=mb.getId() %>
							</div>
							<div class="cell" data-title="비밀번호">
								<%=mb.getPassword() %>
							</div>
							<div class="cell" data-title="이메일">
								<%=mb.getEmail() %>
							</div>
							<div class="cell" data-title="학년">
								<%=mb.getClassyear() %>
							</div>
							<div class="cell" data-title="수정">
								<a href="page_control.jsp?action=edit&mb_id=<%=mb.getId() %>&adminIf=ok">수정</a>
							</div>
							<div class="cell" data-title="삭제">
								<a href="page_control.jsp?action=delete&id=<%=mb.getId() %>" onclick="return delcheck(this)">삭제</a>
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


