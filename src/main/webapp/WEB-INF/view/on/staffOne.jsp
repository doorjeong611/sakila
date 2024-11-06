<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!DOCTYPE html>
<html>
<head>

<!-- BootStrap5 -->  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>staffOne</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
	})
</script>

</head>
<body class= "container-fluid bg-light">
	<div class="row ">
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
			<p class="display-5 mt-5">STAFF ONE</p>
			<br>
			
			<div class="mt-2 "><!-- staffOne tables -->
			<div class="d-flex pe-3">
				<div class="col-lg-5 me-3"><!-- staff info -->
					<table class="table">
						<tr >
							<th colspan="2">
								<p class="h2 text-end">${staff.userName }'s Info</p>
							</th>
						</tr>
						<tr>
							<th>STAFF ID</th>
							<td>${staff.staffId }</td>
						</tr>
						<tr>
							<th>FIRST NAME</th>
							<td>${staff.firstName }</td>
						</tr>
						<tr>
							<th>LAST NAME</th>
							<td>${staff.lastName }</td>
						</tr>
						<tr>
							<th>PHONE</th>
							<td>${staff.staffPhone }</td>
						</tr>
						<tr>
							<th>ADDRESS</th>
							<td>${staff.staffAddress }</td>
						</tr>
						<tr>
							<th>ADDRESS 2</th>
							<td>${staff.staffAddress2 == null ? "*NONE" : staff.staffAddress2}</td>
						</tr>
						<tr>
							<th>POSTCODE</th>
							<td>${staff.staffPostCode.isEmpty() ? "*NONE" : staff.staffPostCode }</td>
						</tr>
						<tr>
							<th>District</th>
							<td>${staff.staffDistrict == null ? "*NONE" : staff.staffDistrict}</td>
						</tr>
						<tr>
							<th>STAFF CITY</th>
							<td>${staff.staffCity }</td>
						</tr>
						<tr>
							<th>STAFF COUNTRY</th>
							<td>${staff.staffCountry }</td>
						</tr>
	
					</table>
				</div><!-- staff insfo -->
					
			<div class=" col-lg-5"> <!-- manager's info -->
				<table class="table">
						<tr >
							<th colspan="2">
								<p class="h2 text-end">Manager's Info</p>
							</th>
						</tr>
						<tr>
							<th>STORE ID</th>
							<td>${staff.storeId }</td>
						</tr>
						<tr>
							<th>MANAGER STAFF ID</th>
							<td>${staff.managerStaffId }</td>
						</tr>
						<tr>
							<th>MANAGER NAME</th>
							<td>${staff.managerName }</td>
						</tr>
	
				</table>	
				
				<div class="mt-2"><!-- Store's info -->
				<table class="table">
						<tr>
							<th colspan="2">
								<p class="h2 text-end">Store's Info</p>
							</th>
						</tr>
						<tr>
							<th>STORE ADDRESS</th>
							<td>${staff.storeAddress }</td>
						</tr>
						<tr>
							<th>STORE ADDRESS 2</th>
							<td>${staff.storeAddress2 == null ? "*NONE" : staff.storeAddress2}</td>
						</tr>
						<tr>
							<th>STORE DISTRICT</th>
							<td>${staff.storeDistrict.isEmpty() ? "*NONE" : staff.storeDistrict }</td>
						</tr>
						<tr>
							<th>STORE POSTCODE</th>
							<td>${staff.storePostCode.isEmpty() ? "*NONE" : staff.storePostCode }</td>
						</tr>
						<tr>
							<th>STORE PHONE</th>
							<td>${staff.storePhone.isEmpty() ? "*NONE" : staff.storePhone  }</td>
						</tr>
						<tr>
							<th>STORE CITY</th>
							<td>${staff.storeCity }</td>
						</tr>
						<tr>
							<th>STORE COUNTRY</th>
							<td>${staff.storeCountry }</td>
						</tr>
	
				</table>
				
				<div>
					<a href=""><button type="button" class="btn btn-primary">MODIFY PASSWORD</button></a>
					<a href=""><button type="button" class="btn btn-primary">MODIFY EMAIL</button></a>
					<a href=""><button type="button" class="btn btn-primary">MODIFY ADDRESS</button></a>
					<a href=""><button type="button" class="btn btn-primary">MODIFY STORE</button></a>
				</div>
					
			</div><!-- Store's info -->
				
				
			</div><!-- manager's info -->
			
			</div>
			
			
			
		</div><!-- staffOne tables -->
	</div><!-- main 끝 -->
	</div>
</body>
</html>