<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<section class="searchback">
	<div class="searchsection">
		<div class="secrchblock">
			<h2 class="cs">강의검색</h2>
			<form action="page_control.jsp" method="post">
				<div class="search">
					<div class="Mainsearch">
						<input type="text" placeholder="교수명, 강의명으로도 검색해보세요 :)"
							class="Mainsearch searchBar" name="keyword">
						<button class="Mainsearch icon">
							<i class="fa fa-search"></i>
						</button>
						<input type=hidden name="lecture" value="search">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>