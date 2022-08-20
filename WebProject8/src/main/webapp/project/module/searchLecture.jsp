<%@page import="evaluationProject.LectureDTO"%>
<%@page import="evaluationProject.LectureDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lectureDatas" scope="request" class="java.util.ArrayList" />
<link rel="stylesheet" type="text/css" href="css/searchTable.css">
<section class = "lectureTable">
	<div class = "lecturesection">
		<div class = "lectureDiv">
			<div class = "resultCount">
				<div>강의 검색 결과</div>
			</div>
			<ul class="tableUl">
				<div class="tableDiv">
					<div class="lectureContainer">
					<%
						for(LectureDTO lb : (ArrayList<LectureDTO>)lectureDatas) {
					%>
						<li class="lectureList">
							<a href="page_control.jsp?lecture=result&order=latest&lectureId=<%=lb.getLectureId()%>">
								<div class = "lectureListDiv">
									<div class = "resultSection">
										<p class ="lecture"><%=lb.getLectureName() %></p>
										<p class = "professor">
											<span><%=lb.getProfessorName() %></span>
											 교수님
										</p>
									</div>
									<div class = "resultSectionMid">
										<div>
											<p class="evaluationCount"><b><%= lb.getLectureDivide() %></b></p>
											<p class="evaluationCount">강의평가 <%= lb.getLectureCount() %>개</p>
										</div>
									</div>
									<div class = "resultSectionEnd">
										<p class = "resultSectionEndP">강의만족도</p>
										<div class="star-ratings">
											<div class="star-ratings-fill space-x-2 text-lg" style="width: <%= lb.getAvgGrade()*20%>%;">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</div>
											<div class="star-ratings-base space-x-2 text-lg">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</div>
										</div>
									</div>
								</div>
							</a>
						</li>
						<%
							}
				 		%>
					</div>
				</div>
			</ul>
		</div>
	</div>
</section>