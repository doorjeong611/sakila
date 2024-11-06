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
<title>main</title>

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
			<p class="display-4">actor one</p>
			
			<div ><!-- Actor -->
				<table class="table">
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
			</div>
			
			<div><!-- Actor File -->
				<p class="h3">ACTOR FILE</p>
				<table class="table">
					<tr>
						<th>IMAGE</th>
						<th>TYPE</th>
						<th>SIZE</th>
						<th>LAST UPDATE</th>
					</tr>
					<c:forEach var="a" items="${actorFileList }">
						<tr>
							<td><img src="${pageContext.request.contextPath }/upload/${a.filename}.${a.ext}" style="width:300px"></td>
							<td>${a.type}</td>
							<td>${a.size} Byte</td>
							<td>${a.lastUpdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div><!-- Film -->
				<p class="h3">출연작</p>
				<c:forEach var="f" items="${filmList }">
					<a href="${pageContext.request.contextPath }/on/filmOne?filmId=${f.filmId}">${f.title }</a>
				</c:forEach>
			
			</div>
			
			
			
			
			
		</div>
	</div>
</body>
</html>