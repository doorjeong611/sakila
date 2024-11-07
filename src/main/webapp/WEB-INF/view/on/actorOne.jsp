<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>

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

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>actor one</title>

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
		<div class="col-sm-10  ">
			
			<p class="display-4">actor one</p>
			
			<div class="col-sm-7 " ><!-- Actor -->
				<table class="table">
					<tr>
						<th colspan="2" class="text-end">
							<h3>ACTOR'S INFO</h3>
						</th>
					</tr>
					<tr>
						<th>ACTOR ID</th>
						<td>${actor.actorId }</td>
					</tr>
					<tr>
						<th>FIRST NAME</th>
						<td>${actor.firstName }</td>
					</tr>
					<tr>
						<th>LAST NAME</th>
						<td>${actor.lastName }</td>
					</tr>
					<tr>
						<th>LAST UPDATE</th>
						<td>${actor.lastUpdate }</td>
					</tr>
				</table>
<!-- 과제 -->		<div class="d-flex justify-content-end">
					<a href="${pageContext.request.contextPath }/on/modifyActor?actorId=${actor.actorId}"><button type="button" class="btn btn-dark btn-sm">수정</button></a>
				</div>
				
			</div>
			
			<div class="col-sm-7"><!-- Actor File -->
				<p class="h3">ACTOR FILE</p>
				
				<div class="d-flex justify-content-end">
					<a href="${pageContext.request.contextPath }/on/addActorFile?actorId=${actor.actorId}"><button type="button" class="btn btn-dark btn-sm">ADD IMAGE</button></a>
				</div>
				 <div class="d-flex flex-wrap gap-3">	
					<c:forEach var="a" items="${actorFileList }">
					<div class="card" style="width: 200px">
						<img class="card-img-top" src="${pageContext.request.contextPath }/upload/${a.filename}.${a.ext}" alt="Card image">
						<div class="card-body">
							<h4 class="card-title">${a.originname}.${a.ext }</h4>
							<p class="card-text">
								TYPE : ${a.type}
								<br> SIZE : ${a.size} Byte
								<br> LAST UPDATE : 
								<br> ${a.lastUpdate}
							</p>
							<a href="${pageContext.request.contextPath }/#"><button type="button" class="btn btn-dark btn-sm">DELETE</button></a>
						</div>
					</div>
					</c:forEach>
		
				</div>
			</div>
			
			<div class="col-sm-7 mt-3 "><!-- Film -->
				<p class="h3">FILMOGRAPHY</p>

				<c:forEach var="f" items="${filmList }" varStatus="status">
					
					<a href="${pageContext.request.contextPath }/on/filmOne?filmId=${f.filmId}" class="name m-2">${f.title }</a>
					
					<c:if test="${status.count % 5 == 0}">
						<br>
					</c:if>
					
				</c:forEach>
			
			</div>
			
			
	</div><!-- main -->
	</div>
</body>
</html>