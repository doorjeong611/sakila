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
<title>STORE LIST</title>

<style>
.page-link {
	border-color: #f0f0f0 !important;
	text-decoration: none;
}

.tb1{
	background-color: : white;
}

</style>

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
			<p class="display-4">STORE LIST</p>
			
			<div class="col-lg-7"><!-- table -->
				<table class="table text-center">
					<tr>
						<th>STORE ID</th>
						<th>ADDRESS</th>
						<th>STAFF NAME</th>
						<th>STAFF ID</th>
						<th>ROLE</th>
						<th>ACTIVE</th>
						<th>INVENTORY</th>
						<th>MODIFY</th>
					</tr>
					<c:forEach var="s" items="${storeList }">
						<tr>
							<td>${s.storeId }</td>
							<td>${s.address }</td>
							<td>${s.firstName } ${s.lastName}</td>
							<td>${s.staffId }</td>
							<td>${s.role }</td>
							<c:if test="${s.active == 'T'}">
								<td> 활성화</td>
							</c:if>	
							<c:if test="${s.active != 'T'}">
								<td><span class="text-bg-secondary opacity-50">비활성화</span></td>
							</c:if>	
							<td>
								<a href="${pageContext.request.contextPath }/on/inventoryList?storeId=${s.storeId}">
									<button type="button" class="btn btn-sm btn-dark">INVENTORY</button>
								</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/on/inventoryList?storeId=${s.storeId}">
									<button type="button" class="btn btn-sm btn-dark">MODIFY</button>
								</a>
							</td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
			
			
			
			
			
			
			
		</div>
	</div>
</body>
</html>