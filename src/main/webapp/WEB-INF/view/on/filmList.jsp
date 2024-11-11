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
<title>filmLIst</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		$('#categoryId').change(function() {// 카테고리별 filmList 보기
			
			$('#formCategory').submit();
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
			<p class="display-4">FILM LIST</p>
			
			<!-- category 선택 -->
			<div>
				<form action="${pageContext.request.contextPath }/on/filmList" method="get" id="formCategory">
					<select	 name="categoryId" id="categoryId">
						<option value="-1">CATEGORY</optoin>
						<c:forEach var="c" items="${categoryList }">
							<option value="${c.categoryId}"
								${c.categoryId == CurrentCategoryId ? 'selected' : ''}>${c.name}
							</option>
						</c:forEach>
					</select>
				</form>
			</div>
			
			<div class="col-lg-10"><!-- table -->
				<table class="table">
					<tr class="text-center">
						<th>NUM</th>
						<th>TITLE</th>
						<th>CATEGORY</th>
						<th>RELEASE YEAR</th>
						<th>RATING</th>
						<th>LENGTH</th>
						<th>RENTAL RATE</th>
						<th>RENTAL DURATION</th>
						<th>REPLACEMENT COST</th>
						<th>FILM ID</th>
					</tr>
					<c:set var="startIndex" value="${(currentPage - 1) * rowPerPage}" />
					<c:forEach var="f" items="${filmList }" varStatus="status">
						<tr class="text-center">
							<td>${startIndex + status.count }</td>
							<td><a href="${pageContext.request.contextPath }/on/filmOne?filmId=${f.filmId}"> ${f.title}</a></td>
							<td>${f.name}</td>
							<td>${f.releaseYear}</td>
							<td>${f.rating}</td>
							<td>${f.length} min</td>
							<td>${f.rentalRate}</td>
							<td>${f.rentalDuration}</td>
							<td>${f.replacementCost}</td>
							<td>${f.filmId}</td>
						</tr>
					</c:forEach>

				</table>
				
				<div><!-- pagination -->
					<ul class="pagination justify-content-center">
						<c:if test="${currentPage > 1 }">
							
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/filmList?currentPage=1&categoryId=${CurrentCategoryId}">First</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/filmList?currentPage=${currentPage -1}&categoryId=${CurrentCategoryId}">Previous</a></li>
						</c:if>		
								
							<li class="page-item active"><a class="page-link" >${currentPage }</a></li>
								
						<c:if test="${currentPage < lastPage }">		
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/filmList?currentPage=${currentPage +1}&categoryId=${CurrentCategoryId}">Next</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/filmList?currentPage=${lastPage}&categoryId=${CurrentCategoryId}">Last</a></li>
							
						</c:if>
					</ul>	
				</div><!-- pagination -->
				
				
			</div><!-- table -->

			
		</div>
	</div>
</body>
</html>