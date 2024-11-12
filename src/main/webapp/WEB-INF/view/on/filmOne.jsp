<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>filmone</title>

<style>

.name{
	text-decoration: none;
	color : black;
	background-color: #D4D4D4;
}

.name:hover{
	color : #a0a0a0;
}

	
</style>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		
		
		
	})
</script>

</head>
<body class= "container-fluid">
	<div class="row">
		
		<!-- include : topMenu.jsp -->
		<div>
			<c:import url="/WEB-INF/view/on/inc/topMenu.jsp"></c:import>
		</div>
		
		<!-- include : leftMenu.jsp -->
		<div class="col-sm-2">
			<div class="col-sm-9">
				<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			</div>
		</div>
		<!-- 
			1) Actor 상세 ⭕
			1-1) actor 수정 - /on/modifyActor
			1-2) actor 삭제 - /on/removeActor (inventory와 rental 정보 확인 + actor_file 삭제 + film_actor 삭제 + actor 삭제)
			
			2) actor_file 리스트 ⭕
			2-1) actor_file 추가 ⭕ /on/addFilmCategory -> 카테고리 전체목록에서 선택
			2-2) actor_file 수정  /on/removeFilmCategory
			
			3) film_actor 리스트 ⭕
			3-1) film_actor 추가 /on/addActorByFilm -> actor 검색 후  선택
			3-2) film_actor 삭제 /on/removeActorByFilm
			
			4) inventory 정보 확인
			
		 -->
		
		<!-- main -->
		<div class="col-sm-10">
			<p class="display-4">FILM ONE</p>
			
			<div class="col-sm-6"><!-- film -->
				<table class="table">
					<tr>
						<th>TITLE</th>
						<td>${film.title }</td>
					</tr>
					<tr>
						<th>DESCRIPTION</th>
						<td>${film.description }</td>
					</tr>
					<tr>
						<th>RELEASE YEAR</th>
						<td>${film.releaseYear }</td>
					</tr>
					<tr>
						<th>RENTAL DURATION</th>
						<td>${film.rentalDuration}</td>
					</tr>
					<tr>
						<th>RENTAL RATE</th>
						<td>${film.rentalRate }</td>
					</tr>
					<tr>
						<th>LENGTH</th>
						<td>${film.length }</td>
					</tr>
					<tr>
						<th>REPLACEMENT COST</th>
						<td>${film.replacementCost }</td>
					</tr>
					<tr>
						<th>RATING</th>
						<td>${film.rating }</td>
					</tr>
					<tr>
						<th>SPECIAL FEATURES</th>
						<td>${film.specialFeatures }</td>
					</tr>
					<tr>
						<th>ORIGINAL LANGUAGE</th>
						<td>${film.originalLanguageId == null ? "*NONE" : film.originalLanguageId}</td>
					</tr>
					<tr>
						<th>LANGUAGE</th>
						<td>${film.language }</td>
					</tr>
					<tr>
						<th>LAST UPDATE</th>
						<td>${film.lastUpdate }</td>
					</tr>
				</table>
				
				<div>
					<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}"><button type="button" class="btn btn-sm btn-dark">MODIFY</button></a>
					<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}"><button type="button" class="btn btn-sm btn-dark">DELETE</button></a>
					<span class="text-danger">${removeMsg }</span>
				</div>
				
			</div>
			
			<div><!-- CATEGORY -->
				<p class="h3">CATEGORY</p>
				<div>
					<form action="post" id="">
						<select name="categoryId">
							<option value="">CATEGORY</option>
							<c:forEach var="ac" items="${allCategoryList }">
								<option value="${ac.categoryId}">${ac.name}</option>
							</c:forEach>
						</select>
					
						<button type="button" class="btn btn-sm btn-dark" id="">ADD CATEGORY</button>
					</form>
				</div>
				
				<div><!-- 해당 FILM의 CATEGORY 출력 -->
					<p class="h3">FILMOGRAPHY</p>

					<c:forEach var="f" items="${filmCategoryList }" varStatus="status">
					
					<a href="#" class="name m-2">${f.name }</a>
					<a href="${pageContext.request.contextPath }/on/removeFilmCategory?filmId=${f.filmId}&categoryId=${f.categoryId}">삭제</a><!-- film_actor에서도 삭제  -->
					<c:if test="${status.count % 5 == 0}">
						<br>
					</c:if>
					
				</c:forEach>
				</div>
			</div>
			
			<div>
				<p class="h3">ACTOR</p>
				<div>
					<form action="get">
						<input type="text" name="searchName">
						<button type="button" class="btn btn-sm btn-dark" id="">SEARCH</button>
					</form>
				</div>
				<div>
					<form action="post" id="">
						<select name="actorId">
							<option value="">ACTOR</option>
							<option value="${ㅁ}">${ㅁ}</option>
						</select>
					
						<button type="button" class="btn btn-sm btn-dark" id="">ADD ACTOR</button>
					</form>
				</div>
			</div>
			
			

			<div class="col-sm-6"><!-- actor -->
				<p class="h3">출연 배우</p>
				<table class="table">
					<tr>
						<th>NUM</th>
						<th>NAME</th>
						<th>삭제</th>
					</tr>
					
					<c:forEach var="a" items="${actorList }" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}" class="name">
								${a.firstName} ${a.lastName }</a>
							</td>
							<td><a href="${pageContext.request.contextPath }/on/removeFilmActor?filmId=${f.filmId}&actorId=${actor.actorId}">삭제</a></td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
			
			
		</div>
	</div>
</body>
</html>