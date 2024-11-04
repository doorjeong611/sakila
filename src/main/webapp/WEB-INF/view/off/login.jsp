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

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		  
		// btn 클릭시 폼값 유효성 검사
		$('#btn').click(function(){
			console.log('click');
			
			/*숫자여부 확인( isNaN(), $.isNumeric() )*/
			//if($.isNumeric($('#staffId').val() ) == false ){ // 숫자가 아니라면
			if($('#username').val() == null || $('#username').val() == ''){	// username으로 로그인하는 방법으로 수정
				alert('username을 입력하세요.');
			
			}else if($('#password').val().length < 4 ){
				alert('password를 확인하세요.')
				
			}else{
				$('#form').submit();
			}
			
			
		});
		
		
	})
</script>

<style type="text/css">

.loginBack{
	
	background-color: #ffffff;
	
}


</style>

</head>
<body class="container bg-light pt-5">
	
	<div class="d-flex justify-content-center mt-5 pt-5">
	
		<div class="loginBack mt-5 col-md-3 p-3 rounded col-lg-4">
		
			<p class="h2 text-center text-secondary">STAFF LOGIN</p>
			<span class="mt-1 pt-2 d-flex justify-content-center" style="color:red">${msg}</span>
		
		
			
			<form action="${pageContext.request.contextPath }/off/login" method="post" id="form">
				<div class="mb-3 mt-3">
					<label for="username" class="form-label">Staff USERNAME :</label>
					<input type="text" class="form-control" id="username" placeholder="Enter Id" name="username">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password :</label>
					<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
				</div>
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-primary " id="btn" >LOGIN</button>
				</div>
			</form>
		</div>		

	</div>
	
</body>
</html>