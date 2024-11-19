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
<title>ADD RENTAL</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		/* 날짜 + 시간 출력하기 */
		var today = new Date();

		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		
		var date = year + '-' + month  + '-' + day;
		
		var hours = ('0' + today.getHours()).slice(-2); 
		var minutes = ('0' + today.getMinutes()).slice(-2);
		var seconds = ('0' + today.getSeconds()).slice(-2); 

		var time = hours + ':' + minutes  + ':' + seconds;

		var now = date + ' ' + time
		
		
		console.log(date);
		console.log(time);
		console.log(now);
		
		$('#rentalDate').val(now);
		
		
		$('#btnCustomer').click(function() {
			
			if($('#searchCustomer').val() == null || $('#searchCustomer').val() == '' ){
				alert('이름을 입력하세요');
				$('#searchCustomer').focus();
				return;
			}
			$('#formCustomer').submit();
			
		})
		
		
		
		
		$('#btnSelCustomer').click(function() {
			var selectedCustomer = $('#selCustomer option:selected').text();
			var selectedCustomerId = $('#selCustomer option:selected').val();
			
			$('#searchCustomer').val(selectedCustomer);
			
			if($('#searchCustomer').val() == null || $('#searchCustomer').val() == ''){
				alert('고객을 선택하세요.');
				$('#searchCustomer').focus();
				return;
			}
			
			$('#customerName').text(selectedCustomer);
			$('#customerId').val(selectedCustomerId);
			
			
		})
		
		
		
		$('#btnAddRental').click(function() {
		
			/* 유효성 검사 */
			if($('#customerId').val() == null || $('#customerId').val() == ''){
				alert('CUSTOMER ID를 입력하세요');
				$('#customerId').focus();
				return;
			}

			$('#formAddRental').submit();
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
			<p class="display-4">ADD RENTAL</p>
			
			<div><!-- 검색 + 입력폼 -->
			
			<div> <!-- 고객 검색 -->
				<p class="h4">고객 검색</p>
				
				<form action="${pageContext.request.contextPath }/on/addRental" method="get" id="formCustomer">
					<input type="hidden" name="inventoryId"value="${inventoryId }" >
					<input type="text" name="searchCustomer" placeholder="고객명 입력" id="searchCustomer" class="col-sm-10">
					<button type="button" class="btn btn-primary btn-sm" id="btnCustomer">고객 검색</button>
				</form>
				
				<c:if test="${customerList != null }">
					<select name="selCustomer" id="selCustomer" size="10" >
						<option value="" >CUSTOMER</option>
						<c:forEach var="c" items="${customerList }">
							<option value="${c.customerId }">${c.firstName }_${c.lastName} : ${c.phone}</option>
						</c:forEach>
					</select>
						<button type="button" class="btn btn-primary btn-sm" id="btnSelCustomer">SELECT</button>
				</c:if>
				
				
				
			</div>
			
			
			<div> <!-- form -->
				<form action="${pageContext.request.contextPath }/on/addRental" method="post" id="formAddRental">
					<table class="table">
						<tr>
							<th>INVENTORY ID</th>
							<td><input type="text" name="inventoryId"value="${inventoryId }" id="inventoryId" readonly></td>						
						</tr>
						<tr>
							<th>STAFF ID</th>
							<td><input type="text" name="staffId"value="${loginStaff.staffId }" id="staffId" readonly> ${loginStaff.username }</td>						
						</tr>
						<tr>
							<th>CUSTOMER NAME</th>
							<td><span id="customerName"></span></td>						
						</tr>
						<tr>
							<th>CUSTOMER ID</th>
							<td><input type="text" name="customerId" id="customerId" value="" readonly></td>						
						</tr>
						<tr>
							<th>RENTAL DATE</th>
							<td><input type="text" name="rentalDate" id="rentalDate" value="" readonly></td>	<!-- 현재 날짜 시간 출력으로 바꾸기. -->	
						</tr>
					</table>
					<button type="button" class="btn btn-primary btn-sm" id="btnAddRental">RENT</button>
				</form>
			</div>
			
			</div>
			
			
			
		</div>
	</div>

</body>
</html>