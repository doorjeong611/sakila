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
<title>ACTOR LIST</title>

<style>

.name{
	text-decoration: none;
	color : black;
}

.name:hover{
	color : #a0a0a0;
}

	
</style>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		$('#btnSearch').click(function() {
			
			if($('#searchWord').val() == ''){
				alert("검색어를 입력하세요");
				$('#searchWord').focus();
				return;
			}
			$('#searchForm').submit();
			
		});

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
		<div class="col-sm-10 ">
			<p class="display-4">ACTOR LIST</p>
			
			<div class="d-flex justify-content-center mt-4 row"><!-- center -->	
			
			<div class="col-lg-8"><!-- table -->
				<div class="d-flex justify-content-end"><!-- searchForm -->
					<form action="${pageContext.request.contextPath }/on/actorList" method="get" id="searchForm" >
						<div class="input-group mb-3 ">
							<input type="text" name="searchWord" class="form-control" placeholder="Search" id="searchWord">
							<button type="submit" class="btn btn-light" id="btnSearch">Search</button>
						</div>
					</form>
				</div><!-- searchForm -->
			
				<table class="table">
					<tr>
						<th>NUM</th>
						<th>ACTOR ID</th>
						<th>NAME</th>
					</tr>
					<c:set var="startIndex" value="${(currentPage - 1) * rowPerPage}" />
					<c:forEach var="a" items="${actorList }" varStatus="status">
						<tr>
							<td>${startIndex + status.count }</td>
							<td>${a.actorId}</td>
							<td><a href="${pageContext.request.contextPath }/on/actorOne?actorId=${a.actorId}" class="name">${a.firstName } ${a.lastName }</a></td>
						</tr>
					</c:forEach>
					
				</table>
			
				<div><!-- pagination -->
					<ul class="pagination justify-content-center">
						<c:if test="${currentPage > 1 }">
							
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/actorList?currentPage=1&searchWord=${searchWord}">First</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/actorList?currentPage=${currentPage -1}&searchWord=${searchWord}">Previous</a></li>
						</c:if>		
								
							<li class="page-item active"><a class="page-link" >${currentPage }</a></li>
								
						<c:if test="${currentPage < lastPage }">		
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/actorList?currentPage=${currentPage +1}&searchWord=${searchWord}">Next</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">Last</a></li>
							
						</c:if>
					</ul>	
				</div><!-- pagination -->
			
			</div><!-- table -->
			
			</div><!-- center -->
		</div><!-- main -->
	</div>
</body>
</html>