<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    
<div>

	<div class="list-group ">
	
		<a href="${pageContext.request.contextPath}/on/main" class="list-group-item list-group-item-action">
			홈으로
		</a>
		<a href="${pageContext.request.contextPath}/on/staffOne" class="list-group-item list-group-item-action">
			${loginStaff.username }, 접속
		</a>
		<a href="${pageContext.request.contextPath}/on/logout" class="list-group-item list-group-item-action">
			로그아웃
		</a>
		
		<a href="${pageContext.request.contextPath}/on/logout" class="list-group-item list-group-item-action">
			Second item
		</a>
		
		<a href="#" class="list-group-item ">	</a>
		
		<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" >
			STORE 추가
		</a>
		<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action">
			STORE 수정
		</a>
		
		<a href="#" class="list-group-item ">	</a>
		
		<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" >
			STAFF 추가
		</a>
		<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action">
			STAFF 수정
		</a>
		
		<a href="#" class="list-group-item ">	</a>
		
		<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" >
			CUSTOMER 추가
		</a>
		<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action">
			CUSTOMER 수정
		</a>
		
	</div>

</div>    