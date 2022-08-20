<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="evaluationProject.EvaluationDTO"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/result.css">
<jsp:useBean id="lb" scope="request"
	class="evaluationProject.LectureDTO" />
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
<section class="evalutionInfo">
	<div class="evalutionSection">
		<div class="evalutionSectionInfo">
			<div class="lecture">
				<%=lb.getLectureName()%>
			</div>
			<div class="professor">
				<%=lb.getProfessorName()%>
				교수님
			</div>
			<div class="avgRatings">
				<div class="professor" id="avgStar">평균 총점</div>
				<div class="main_star-ratings">
					<div class="main_star-ratings-fill space-x-2 text-lg"
						style="width: <%=lb.getAvgGrade() * 20%>%;">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
					<div class="star-ratings-base space-x-2 text-lg">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
				</div>
			</div>
		</div>
		<div class="charts">
			<%
			int Srcount = (int) request.getAttribute("Srcount");
			int Dscount = (int) request.getAttribute("Dscount");
			int Vscount = (int) request.getAttribute("Vscount");
			%>
			<script
				src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
			<canvas id="myChart" width="300" height="200"></canvas>
			<script>
				var ctx = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(ctx,
						{
							type : 'radar',
							data : {
								labels : [ '만족도', '난이도', '성취감' ],
								datasets : [ {
									label : '평균 평점',
									data : [<%= Srcount%>,<%= Dscount%>,<%= Vscount%>],
									 fill: true,
									backgroundColor: 'rgba(255, 99, 132, 0.2)',
									borderColor: 'rgb(255, 99, 132)',
									pointBackgroundColor: 'rgb(255, 99, 132)',
								    pointBorderColor: '#fff',
								    pointHoverBackgroundColor: '#fff',
								    pointHoverBorderColor: 'rgb(255, 99, 132)',
								} ]
							},
							options : {
								responsive: false,
								scales: {
							        r: {
							            max: 5,
							            min: 0,
							            ticks: {
							                stepSize: 1
							            }
							        }
							    },
								elements : {
									line : {
										borderWidth : 3
									}
								}
							},
						});
			</script>
		</div>
	</div>
</section>
<section class="resultsection">
	<div class="bar">
		<div class="evalutionlCountDiv">
			<p class="evalutionCount2">
				이 강의에 대한 평가 (<%=lb.getLectureCount()%>)
			</p>
		</div>
		<div class="latest">
			<a
				href="page_control.jsp?lecture=result&order=latest&lectureId=<%=lb.getLectureId()%>">최신순</a>
		</div>
		<div class="like">
			<a
				href="page_control.jsp?lecture=result&order=like&lectureId=<%=lb.getLectureId()%>">추천순</a>
		</div>
	</div>
	<div class="resultEvalution">
		<%
		for (EvaluationDTO eb : (ArrayList<EvaluationDTO>) datas) {
		%>
		<div class="evalution">
			<div class="simpleEvalution">
				<div class="nick">
					<div class="nickFont">
						<i class="fas fa-user-circle"></i><%=eb.getUserNick()%></div>
				</div>
				<div class="satisfy2">
					<div>강의 만족도</div>
					<div class="star-ratings">
						<div class="star-ratings-fill space-x-2 text-lg"
							style="width: <%=eb.getSatisfactionRating() * 20%>%;">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
						<div class="star-ratings-base space-x-2 text-lg">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
					</div>
				</div>
				<div class="satisfy">
					<div>
						학습량
						<div class="score">
							<%=eb.getVolumeScore()%>
						</div>
					</div>
				</div>
				<div class="satisfy">
					<div>
						난이도
						<div class="score">
							<%=eb.getDifficultyScore()%>
						</div>
					</div>
				</div>
			</div>
			<p class="comment">
				<%=eb.getEvaluationContent()%>
			</p>
			<div class="whiteSpace"></div>
			<div class="commonSection">
				<div class="likeSection">
					<a
						href="page_control.jsp?likey=like&evaluationId=<%=eb.getEvaluationId()%>"><i
						class="far fa-thumbs-up"></i>추천 <%=eb.getLikeCount()%></a>
				</div>
				<div class="deleteSection">
					<a
						href="page_control.jsp?likey=delete&evaluationId=<%=eb.getEvaluationId()%>"
						onclick="return delcheck(this)"><i class="far fa-trash-alt"></i>삭제</a>
				</div>
			</div>
			<script type="text/javascript">
				function delcheck() { //작성자가 아니면 글삭제 못하게 하는 스크립트

					result = confirm("정말로 삭제하시겠습니까 ?");
					if (result == true) {
						return true;
					} else
						return false;
				}
			</script>
		</div>
		<%
		}
		%>
	</div>
</section>