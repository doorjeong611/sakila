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
<title>Insert title here</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		$('#btnAddLanguage').click(function() {
			
			const nameTest = /^[A-Z][a-zA-Z가-힣]*$/; // 첫글자는 대문자 확인 뒤의 글자들은 숫자, 특부문자 확인 정규식
				
			if($('#name').val() == null || $('#name').val() == '' ){
				alert('LANGUAGE을 입력해주세요.');
				$('#name').focus();
				return;
			}
			
			if(nameTest.test($('#name').val()) == false){ // 정규식 검사
				alert('첫글자는 대문자만 가능하며 숫자, 특수문자는 입력할 수 없습니다.');
				$('#name').focus();
				return;
			}
			
			
			$('#languageForm').submit();
			
		})
		
		
		
		
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
			<p class="display-4">ADD LANGUAGE</p>
			<div>
				<form action="${pageContext.request.contextPath }/on/addLanguage" id="languageForm" method="post">
					<span style="color:red">${msg }</span><br>
					LANGUAGE <input type="text" name="name" id="name">
					
					<button type="button" class="btn btn-sm btn-dark" id="btnAddLanguage">ADD</button>
				</form>
			</div>
			
		</div>
	</div>

</body>
</html>