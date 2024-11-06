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
			</div>
			

			<div class="col-sm-6"><!-- actor -->
				<p class="h3">출연 배우</p>
				<table class="table">
					<tr>
						<th>NUM</th>
						<th>NAME</th>
						<th>LAST UPDATE</th>
					</tr>
					
					<c:forEach var="a" items="${actorList }" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}" class="name">
								${a.firstName} ${a.lastName }</a>
							</td>
							<td>${a.lastUpdate == null ? "*NONE" : a.lastUpdate}</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
			
			
		</div>
	</div>
</body>
</html>