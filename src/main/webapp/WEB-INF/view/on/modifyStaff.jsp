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
<title>modify staff</title>

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
			<p class="display-4">modify</p>
			
			<div class="col-sm-5 mt-5 mb-5 ps-5 pe-5 " id="main"><!-- form div -->
				
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
									<input type="text" value="${staffInfo.firstName}" name="firstName"  id="firstName" >
								</td>
							</tr>
							<tr>
								<th>LAST NAME</th>
								<td>
									<input type="text" value="${staffInfo.lastName}" name="lastName" id="lastName" >
								</td>
							</tr>
							<tr>
								<th>EMAIL</th>
								<td>
									<input type="text" value="${staffInfo.email}" name="email"  id="email" >
								</td>
							</tr>
							<tr>
								<th>USER NAME</th>
								<td>
									<input type="text" value="${staffInfo.username}" name="username" id="username"  >
								</td>
							</tr>
							<tr>
								<th>PASSWORD</th>
								<td>
									<input type="text" value="${staffInfo.password}" name="password" readonly >
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
									<input type="text" value="${staffInfo.addressId}" name="addressId" id="addressId" readonly >
								</td>
							</tr>
							
								
						</table>
						<div class=" d-flex justify-content-end">
							<button type="button" class="btn btn-primary" id="btnAddStaff" >ADD STAFF</button>
						</div>
					</form>
				</div><!-- table div -->
			</div><!-- form div -->
			
			
			
			
			
		</div>
	</div>
</body>
</html>