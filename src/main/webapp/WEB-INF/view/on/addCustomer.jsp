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
<title>add customer</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		/* 주소 검색 */
		$('#btnAddress').click(function() {
			if($('#searchAddress').val() == null || $('#searchAddress').val() == ''){
				alert('검색어를 입력해주세요.');
				$('#searchAddress').focus();
				return;
			}
			
			$('#formAddress').submit();
		})
		
		/* 주소 선택 */
		$('#btnSelAddr').click(function() {
			var selAddr = $('#selAddress option:selected').text();
			$('#addressId').val($('#selAddress').val());
			$('#address').val(selAddr)
			
		})
		
		/* 유효성 검사 */
		const emailTest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
		const nameTest = /^[a-zA-Z가-힣]+$/;
		
		$('#btnAddCust').click(function() {
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
				
				
			}else if($('#storeId').val() == null || $('#storeId').val() == ''){
				alert('STORE ID를 선택하세요.');
				$('#storeId').focus();
				
				
			}else if($('#addressId').val() == null || $('#addressId').val() == ''){
				alert('ADDRESS ID를 선택하세요.');
				$('#searchAddress').focus();
				
			}else{
				
				$('#formAddCustomer').submit();
			}
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
			<p class="display-4">add customer</p>
			
			<div><!-- address 검색 -->
				<p class="h4">주소 검색</p>
				<form action="${pageContext.request.contextPath }/on/addCustomer" method="get" id="formAddress">
					<input type="text" name="searchAddress" placeholder="주소 입력" id="searchAddress" class="col-sm-10">
					<button type="button" class="btn btn-primary btn-sm" id="btnAddress">주소 검색</button>
				</form>
			</div>
			
			<!-- addressList : 주소 선택 -->
			<c:if test="${addressList.size() >= 1 }">
				<div>
					<select name="selAddress" size="5" id="selAddress">
						<c:forEach var="a" items="${addressList }">
							<option value="${a.addressId }">${a.address}</option>
						</c:forEach>
					</select>
					<button type="button" class="btn btn-dark btn-sm" id="btnSelAddr">주소 선택</button>
				</div>
			</c:if>
			
		
			<div><!-- customer 정보 입력 form -->
				<form action="${pageContext.request.contextPath }/on/addCustomer" method="post" id="formAddCustomer">
					<table class="table">
						<tr>
							<th>FIRST NAME</th>
							<td><input type="text" name="firstName" id="firstName"></td>
						</tr>
						<tr>
							<th>LAST NAME</th>
							<td><input type="text" name="lastName" id="lastName"></td>
						</tr>
						<tr>
							<th>EMAIL</th>
							<td><input type="text" name="email" id="email"></td>
						</tr>
						<tr>
							<th>STORE</th>
							<td>
								<select name="storeId" id="storeId">
									<option value="">STORE</option>
									<c:forEach var="s" items="${storeList }">
										<option value="${s.storeId }">[${s.storeId }] ${s.address }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>ADDRESS</th>
							<td>
								<input type="text" name="addressId" id="addressId" readonly>
								<input type="text" id="address" readonly>
							</td>
						</tr>
					</table>
					<button type="button" class="btn btn-dark btn-sm" id="btnAddCust">ADD</button>
				</form>
			</div>
			
		</div>
	</div>
</body>
</html>