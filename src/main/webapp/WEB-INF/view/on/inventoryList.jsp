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
<title>INVENTORY LIST</title>

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
			<p class="display-4">${storeId }'s inventory list</p>
			
			<div><!-- table -->
				<table class="table">
					<tr>
						<th>NUM</th>
						<th>INVENTORY ID</th>
						<th>TITLE</th>
						<th>FILM ID</th>
						<th>LAST UPDATE</th>
						<th>DELETE</th>
					</tr>
					<c:set var="startIndex" value="${(currentPage - 1) * rowPerPage}" />
					<c:forEach var="i" items="${inventoryList}" varStatus="status">
						<tr>
							<td>${startIndex + status.count }</td>
							<td>${i.inventoryId }</td>
							<td><a href="${pageContext.request.contextPath }/on/filmOne?filmId=${i.filmId}">${i.title }</a></td>
							<td>${i.filmId }</td>
							<td>${i.lastUpdate }</td>
							<td>	
								<a href="${pageContext.request.contextPath }/on/removeInventoryByKey?inventoryId=${i.inventoryId}&storeId=${storeId}">
									<button type="button" class="btn btn-sm btn-dark">DELETE</button>
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div><!-- pagination -->
					<ul class="pagination justify-content-center">
						<c:if test="${currentPage > 1 }">
							
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/inventoryList?currentPage=1&storeId=${storeId}">First</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/inventoryList?currentPage=${currentPage -1}&storeId=${storeId}">Previous</a></li>
						</c:if>		
							
							<li class="page-item active"><a class="page-link" >${currentPage }</a></li>

						<c:if test="${currentPage < lastPage }">		
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/inventoryList?currentPage=${currentPage +1}&storeId=${storeId}">Next</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/inventoryList?currentPage=${lastPage}&storeId=${storeId}">Last</a></li>
							
						</c:if>
					</ul>	
				</div>
				
			</div>
			
			
		</div>
	</div>

</body>
</html>