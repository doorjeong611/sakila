<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    
<!-- BootStrap5 -->    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<div >
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="container-fluid">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link active" href="${pageContext.request.contextPath}/on/main">HOME</a>
	      </li>
	     <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username }, 접속</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/on/logout">LOGOUT</a>
	      </li>
	    </ul>
	  </div>
	</nav>
</div>




