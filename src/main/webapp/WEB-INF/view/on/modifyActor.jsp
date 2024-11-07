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
<title>modify Actor</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		// 배우 추가
		$('#btnModifyActor').click(function() {
			const nameTest = /^[a-zA-Z가-힣]+$/
			
			if($('#firstName').val() == null || $('#firstName').val() == '' ){
				alert('FIRST NAME을 입력해주세요.');
				$('#firstName').focus();
				return;
			}
			
			if(nameTest.test($('#firstName').val()) == false){ // 이름 정규식 검사
				alert('숫자, 특수문자는 입력할 수 없습니다.');
				$('#firstName').focus();
				return;
			}
			
			if($('#lastName').val() == null ||  $('#lastName').val() == '' ){
				alert('LAST NAME을 입력해주세요.');
				$('#firstName').focus();
				return;
			}
			
			if(nameTest.test($('#lastName').val()) == false){ // 이름 정규식 검사
				alert('숫자, 특수문자는 입력할 수 없습니다.');
				$('#lastName').focus();
				return;
			}
			
			
			$('#formActor').submit();
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
		<div class="col-sm-10 row d-flex justify-content-center"><!-- main div -->

			<div class="col-sm-5 mt-5 mb-5 ps-5 pe-5 " id="form"><!-- form -->
			
				<p class="display-4">MODIFY ACTOR</p>
				
				<div class="mt-5"><!-- table -->
					<form action="${pageContext.request.contextPath }/on/modifyActor" method="post" id="formActor">
						<table class="table">
							<tr>
								<th>ACTOR ID</th>
								<td><input type="text" name="actorId" id="actorId" value="${actor.actorId }" readonly></td>
							</tr>
							<tr>
								<th>FIRST NAME</th>
								<td><input type="text" name="firstName" id="firstName" value="${actor.firstName }"></td>
							</tr>
							<tr>
								<th>LAST NAME</th>
								<td><input type="text" name="lastName" id="lastName" value="${actor.lastName }"></td>
							</tr>
							
						</table>
	
						<div class=" d-flex justify-content-end">
							<button type="button" class="btn btn-primary btn-md" id="btnModifyActor">MODIFY ACTOR</button>
						</div>
					</form>
				</div>
			</div><!-- form -->
			
		</div><!-- main -->
	</div>
</body>
</html>