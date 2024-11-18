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
<title>CUSTOMER LIST</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		$('#btnSearchCustomer').click(function() {
			if($('#searchCustomer').val() == null || $('#searchCustomer').val() == ''){
				alert('검색어를 입력해주세요');
				$('#searchCustomer').focus();
				return;
			}
			$('#formSearchCustomer').submit();
			
			
			
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
			<p class="display-4">CUSTOMER LIST</p>
			
			<div><!-- search -->
				<form action="${pageContext.request.contextPath }/on/customerList" method="get" id="formSearchCustomer">
					<input type="text" name="searchCustomer" placeholder="회원명 검색" id="searchCustomer">
					<button type="button" class="btn btn-sm btn-dark" id="btnSearchCustomer" >SEARCH</button>
				</form>
			</div>
			
			<div><!-- table -->
				<table class="table">
					<tr>
						<th>NUM</th>
						<th>CUSTOMER ID</th>
						<th>FIRST NAME</th>
						<th>LAST NAME</th>
						<th>ACTIVE</th>
						<th>STORE ID</th>
						<th>ADDRESS ID</th>
						<th>DISTRICT</th>
					</tr>
					<c:set var="startIndex" value="${(currentPage - 1) * rowPerPage}" />
					<c:forEach var="c" items="${customerList }" varStatus="status">
						<tr>
							<td>${startIndex + status.count }</td>
							<td><!-- 주소, 렌탈, 지불  -->
								<a href="${pageContext.request.contextPath }/on/customerOne?customerId=${c.customerId }">${c.customerId }</a>
							</td>
							<td>${c.firstName}</td>
							<td>${c.lastName}</td>
							<td>${c.active}</td>
							<td>${c.storeId}</td>
							<td>${c.addressId}</td>
							<td>${c.district}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div><!-- PAGINATION -->
				<%-- <c:if test="${currentPage > 10} "> --%>
					<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage-10}">
						이전 
					</a>
				<%-- </c:if> --%>
				
				<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}" >
		
					<c:if test="${num == currentPage}">
						<span class="text-danger">${num } &nbsp;&nbsp;</span>
					</c:if>
					
					<c:if test="${num != currentPage}">
						<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${num}">${num}</a>&nbsp;&nbsp;
					</c:if>
					
				</c:forEach>
				
				<%-- <c:if test="${currentPage < lastPage}"> --%>
					<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage+10}">
						다음 
					</a>
				<%-- </c:if> --%>
					
			</div>

		</div>
	</div>

</body>
</html>