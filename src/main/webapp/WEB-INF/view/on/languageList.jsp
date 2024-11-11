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
<title>Language List</title>

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
			<p class="display-4">LANGUAGE LIST</p>
			
			<div class="col-sm-6"><!-- table -->
				<table class="table">
					<tr>
						<th>LANGUAGE ID</th>
						<th>LANGUAGE NAME</th>
					</tr>
					<c:forEach var="lang" items="${langList }">
						<tr>
							<td>${lang.languageId }</td>
							<td>${lang.name }</td>
						</tr>
					</c:forEach>
				</table>
			
				<div>
					<a href="${pageContext.request.contextPath }/on/addLanguage"><button class="btn btn-sm btn-dark">ADD LANGUAGE</button></a>
				</div>
			
			
			
			</div>
			
			
			
		</div>
	</div>
</body>
</html>