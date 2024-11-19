<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
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
<title>CUSTOMER ONE</title>

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
			<p class="display-4">CUSTOMER ONE</p>
			
			<div> <!-- 회원 개인정보 -->
				<p class="h4">회원 정보</p>
				<table class="table">
					<tr>
						<th>CUSTOMER ID</th>
						<td>${customerOne.customerId}</td>
					</tr>
					<tr>
						<th>STORE ID</th>
						<td>${customerOne.storeId}</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td>${customerOne.firstName } ${customerOne.lastName }</td>
					</tr>
					<tr>
						<th>EMAIL</th>
						<td>${customerOne.email }</td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td>${customerOne.phone }</td>
					</tr>
					<tr>
						<th>ADDRESS</th>
						<td>${customerOne.address }</td>
						<td>${customerOne.address2 }</td>
					</tr>
					<tr>
						<th>DISTRICT</th>
						<td>${customerOne.district }</td>
					</tr>
					<tr>
						<th>CITY</th>
						<td>${customerOne.city }</td>
					</tr>
					<tr>
						<th>COUNTRY</th>
						<td>${customerOne.country }</td>
					</tr>
					<tr>
						<th>ACTIVE</th>
						<td>${customerOne.active }</td>
					</tr>
				</table>
			</div>
			
			<div><!-- 고객 대여 정보 -->
				<p class="h4">대여 정보</p>
				<table class="table">
					<tr>
						<th>NUM</th>
						<th>RENTAL ID</th>
						<th>INVENTORY ID</th>
						<th>FILM ID</th>
						<th>TITLE</th>
						<th>RENTAL DURATION</th>
						<th>RENTAL RATE</th>
						<th>RENTAL DATE</th>
						<th>RETURN</th>
					</tr>
					<c:set var="startIndex" value="${(currentPage - 1) * rowPerPage}" />
					<c:forEach var="r" items="${rentalInfo}" varStatus="status">
						<tr>
							<td>${startIndex + status.count }</td>
							<td>${r.rentalId}</td>
							<td>${r.inventoryId }</td>
							<td>${r.filmId }</td>
							<td>${r.title }</td>
							<td>${r.rentalDuration } days</td>
							<td>$ ${r.rentalRate }</td>
							<td>${r.rentalDate }</td>
							
							<c:if test="${r.returnDate == null }">
								<td><span class="text-danger">대여중</span></td>
							</c:if>
							<c:if test="${r.returnDate != null }">
								<td>${fn:substring(r.returnDate, 0,10)}</td>
							</c:if>

						</tr>
					</c:forEach>
				</table>
				
				<div><!-- pagination -->
					<ul class="pagination justify-content-center">
						<c:if test="${currentPage > 1 }">
							
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/customerOne?currentPage=1&customerId=${customerOne.customerId}">First</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/customerOne?currentPage=${currentPage -1}&customerId=${customerOne.customerId}">Previous</a></li>
						</c:if>		
							
							<li class="page-item active"><a class="page-link" >${currentPage }</a></li>

						<c:if test="${currentPage < lastPage }">		
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/customerOne?currentPage=${currentPage +1}&customerId=${customerOne.customerId}">Next</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/customerOne?currentPage=${lastPage}&customerId=${customerOne.customerId}">Last</a></li>
							
						</c:if>
					</ul>	
				</div>
		
			</div>
			
		</div>
	</div>
</body>
</html>