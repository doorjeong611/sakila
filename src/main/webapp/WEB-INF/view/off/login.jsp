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
<title>Login</title>
</head>
<body class="container">
	
	<div class="mt-5">
	
		<h1>staff login</h1>
		<span>${msg}</span>
		<form action="${pageContext.request.contextPath }/off/login" method="post">
			<div class="mb-3 mt-3">
				<label for="staffId" class="form-label">Staff-ID :</label>
				<input type="number" class="form-control" id="staffId" placeholder="Enter Id" name="staffId">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password :</label>
				<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
			</div>
			
			<button type="submit" class="btn btn-primary">LOGIN</button>
		</form>
		
	</div>
	
	
</body>
</html>