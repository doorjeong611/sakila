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
<title>staffList</title>

<style>
.page-link {
	border-color: #f0f0f0 !important;
	text-decoration: none;
}

</style>


</head>
<body class= "container-fluid">
	<div class="row">
		
		<!-- include : topMenu.jsp -->
		<div>
			<c:import url="/WEB-INF/view/on/inc/topMenu.jsp"></c:import>
		</div>
		
		<!-- include : leftMenu.jsp -->
		<div class="col-sm-2">
			<div >
				<div class="col-sm-9">
				<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
				</div>
			</div>
		</div>
		
		<!-- main -->
		<div class="col-sm-10">
		
			<div class="pe-5">
				<p class="display-3">STAFF LIST</p>
				
				<table class="table ">
					<tr>
						<th colspan="12" class="pe-5">
							<p class="h2 text-end">STAFF LIST</p>
						</th>
					</tr>
					<tr>
						<th>STAFF ID</th>
						<th>ROLE</th>
						<th>FIRST NAME</th>
						<th>LAST NAME</th>
						<th>USER NAME</th>
						<th>STORE ID</th>
						<th>ADDRESS ID</th>
						<th>EMAIL</th>
						<th>LAST UPDATE</th>
						<th>ACTIVE</th>
						<th>ACTIVATION</th>
						<th>PRO/DEMOTION</th>
					</tr>
					<c:forEach var="s" items="${staffList }">
					<tr>
						<td>${s.staffId }</td>
						<c:if test="${s.role == 'Manager'}">
							<td><span class="text-danger">${s.role }</span></td>						
						</c:if>
						<c:if test="${s.role != 'Manager'}">
							<td>${s.role }</td>
						</c:if>
						
						<td>${s.firstName}</td>
						<td>${s.lastName}</td>
						<td>${s.username }</td>
						<td>${s.storeId }</td>
						<td>${s.addressId }</td>
						<td>${s.email }</td>
						<td>${s.lastUpdate }</td>
						<c:if test="${s.active == 'T'}">
							<td> 활성화</td>
						</c:if>	
						<c:if test="${s.active != 'T'}">
							<td> <span class="text-bg-secondary opacity-50">비활성화</span></td>
						</c:if>	
						<td>
							<c:if test="${loginStaff.role == 'Manager'}">
								<a href="${pageContext.request.contextPath }/on/modifyStaffActive?staffId=${s.staffId }&active=${s.active}">
									<c:if test="${s.active == 'T' }"><button type="button" class="btn btn-dark btn-sm">비활성화</button></c:if>
									<c:if test="${s.active == 'F' }"><button type="button" class="btn btn-danger btn-sm">활성화</button></c:if>	
								</a>
							</c:if>
							<c:if test="${loginStaff.role != 'Manager'}">
								*Access Denied
							</c:if>
						</td>
						<td>
							<c:if test="${loginStaff.role == 'Manager'}">
								<a href="${pageContext.request.contextPath }/on/modifyStaffRole?staffId=${s.staffId }&role=${s.role}">
									<button type="button" class="btn btn-success btn-sm">CHANGE</button>
								</a>
							</c:if>
							<c:if test="${loginStaff.role != 'Manager'}">
								*Access Denied
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>	
				
				<div>
					<ul class="pagination justify-content-center">
						<c:if test="${currentPage > 1 }">
							
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/staffList?currentPage=1">First</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/staffList?currentPage=${currentPage -1}">Previous</a></li>
						</c:if>		
								
							<li class="page-item active"><a class="page-link" >${currentPage }</a></li>
								
						<c:if test="${currentPage < lastPage }">		
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/staffList?currentPage=${currentPage +1}">Next</a></li>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/on/staffList?currentPage=${lastPage}">Last</a></li>
							
						</c:if>
					</ul>	
				</div>
			</div>	
			
			
		</div>
	</div>
</body>
</html>