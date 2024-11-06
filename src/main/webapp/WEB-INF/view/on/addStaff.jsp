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
<title>ADD STAFF</title>

<style>
	
	#main{
		background-color: #ffffff;
		border-radius: 5%;
	}
</style>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		// 주소 검색 버튼
		$('#btnAddress').click(function() {
			if($('#searchAddress').val() == ""){
				alert('주소를 입력하세요.');
			}else{
				$('#formAddress').submit();
			}
			
		});
	
		
		// 주소 선택 버튼
		$('#btnAddrSel').click(function() {
			
			if($('#resultAddress').val() == null || $('#resultAddress').val() == ''){
				alert('주소를 선택하세요');
			}else{
				$('#addressId').val($('#resultAddress').val());
				console.log($('#resultAddress').val());

			}
		})
	
		// add staff action버튼
		const emailTest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
		const nameTest = /^[a-zA-Z가-힣]+$/;
				
		$('#btnAddStaff').click(function() {
			// 유효성 검사
			if($('#firstName').val() == null || $('#firstName').val() == ''){
				alert('FIRST NAME을 입력하세요.');
				$('#firstName').focus();
				
				
			}else if(nameTest.test($('#firstName').val()) == false){ // 이름 정규식 검사
				alert('숫자, 특수문자는 입력할 수 없습니다.');
				$('#firstName').focus();
				
				
			}else if($('#lastName').val() == null || $('#lastName').val() == ''){
				alert('LAST NAME을 입력하세요.');
				$('#lastName').focus();
				
				
			}else if(nameTest.test($('#lastName').val()) == false){
				alert('숫자, 특수문자는 입력할 수 없습니다.');
				$('#lastName').focus();
				
			
			}else if($('#email').val() == null || $('#email').val() == '' ){
				alert('EMAIL을 입력하세요.');
				$('#email').focus();
				
				
			}else if(emailTest.test($('#email').val()) == false){ // 이메일 정규식 검사
				alert('이메일형식이 올바르지 않습니다.');
				$('#email').focus();
				
				
			}else if($('#username').val() == null || $('#username').val() == ''){
				alert('USER NAME을 입력하세요.');
				$('#username').focus();
				
				
			}else if($('#storeId').val() == null || $('#storeId').val() == ''){
				alert('STORE ID를 선택하세요.');
				$('#storeId').focus();
				
				
			}else if($('#addressId').val() == null || $('#addressId').val() == ''){
				alert('ADDRESS ID를 선택하세요.');
				$('#searchAddress').focus();
				
			}else{
				
				$('#addForm').submit();
			}

		});
		
	})
</script>

</head>
<body class= "container-fluid bg-light">
	<div class="row"><!-- body div -->
		
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
		<div class="col-sm-10 row d-flex justify-content-center" ><!-- main div -->
		
			<div class="col-sm-5 mt-5 mb-5 ps-5 pe-5 " id="main"><!-- form div -->
			
				<p class="display-5 mt-3 pt-3">ADD STAFF</p>
				
				<div class="mt-5 mb-4">
					<p class="h4">주소 검색</p>
					
					<form action="${pageContext.request.contextPath }/on/addStaff" method="get" id="formAddress">
						<input type="text" name="searchAddress" placeholder="주소 입력" id="searchAddress" class="col-sm-10">
						<button type="button" class="btn btn-primary btn-sm" id="btnAddress">주소 검색</button>
					</form>
				</div>
				<c:if test="${addressList.size() >= 1 }">
				<div class="mt-3  mb-4">
					<p class="h4 ">주소 선택</p>
					<select id="resultAddress" size="5" class="col-sm-10">
						<c:forEach var="a" items="${addressList }">
							<option value="${a.addressId}">${a.address }</option>
						</c:forEach>
					</select>

						<button type="button" class="btn btn-primary btn-sm" id="btnAddrSel">주소 선택</button>
					
				</div>
				</c:if>
	
				<div class="mt-2 pt-2"><!-- table div -->
				<p class="h4 ">STAFF 정보 입력</p>
					<form action="${pageContext.request.contextPath }/on/addStaff" method="post" id="addForm">
						<table class="table">
							<tr>
								<th>FIRST NAME</th>
								<td>
									<input type="text" value="" name="firstName"  id="firstName"  >
								</td>
							</tr>
							<tr>
								<th>LAST NAME</th>
								<td>
									<input type="text" value="" name="lastName" id="lastName" >
								</td>
							</tr>
							<tr>
								<th>EMAIL</th>
								<td>
									<input type="text" value="" name="email"  id="email" >
								</td>
							</tr>
							<tr>
								<th>USER NAME</th>
								<td>
									<input type="text" value="" name="username" id="username"  >
								</td>
							</tr>
							<tr>
								<th>PASSWORD</th>
								<td>
									<input type="text" value="1234" name="password" readonly >
								</td>
							</tr>
							
							<tr>
								<th>STORE ID</th>
								<td>
									<select name="storeId" id="storeId">
										<option value=""> 선택 </option>
										<c:forEach var="s" items="${storeList }">
											<option value="${s.storeId }"> [${s.storeId }] ${s.address }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>ADDRESS ID</th>
								<td>
									<input type="text" value="" name="addressId" id="addressId" readonly >
								</td>
							</tr>
							
								
						</table>
						<div class=" d-flex justify-content-end">
							<button type="button" class="btn btn-primary" id="btnAddStaff" >ADD STAFF</button>
						</div>
					</form>
				</div><!-- table div -->
			</div><!-- form div -->
		
		</div><!-- main div -->
	</div><!-- body div -->
</body>
</html>