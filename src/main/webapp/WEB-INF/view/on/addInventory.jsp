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
<title>Insert title here</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		$('#btnSearchTitle').click(function() {
			if($('#searchTitle').val() == ''){
				alert('검색어를 입력하세요');
				return;
			}
			
			$('#formSearchTitle').submit();
	
		})
		
		// FILM 선택
		$('#btnSelFILM').click(function() {
			
			if($('#selFilmId').val() == null || $('#selFilmId').val() == ''){
				alert('FILM을 선택하세요.');
			}else{
				var selectedFilmTitle = $('#selFilmId option:selected').text();
				
				$('#filmId').val($('#selFilmId').val());
				$('#filmTitle').val(selectedFilmTitle);
				console.log($('#filmId').val());
				return;
			}
		})
		
		$('#btnAddFILM').click(function() {
			$('#formAddInventory').submit();
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
			<p class="display-4">ADD INVENTORY</p>
			
			
			<div><!-- 영화제목 검색 -->
				<p class="h3">FILM TITLE</p> 
				
				<div> <!-- 영화제목 검색 -->
					<form action="${pageContext.request.contextPath }/on/addInventory" method="get" id="formSearchTitle">
						<input type="hidden" name = "storeId" value="${storeId }"> 
						<input type="text" name="searchTitle" id="searchTitle" value="${searchTitle }">
						<button type="button" class="btn btn-sm btn-dark" id="btnSearchTitle">SEARCH</button>
					</form>
				</div>
				
				<div>
					<form action="${pageContext.request.contextPath }/on/addFilmActorByFilm" method="post" id="formAddActor">
						<input type="hidden" name="storeId" value="${storeId}">
						<select name="filmId" size="5" id="selFilmId" >
							<option value="">FILM</option>
							<c:forEach var="f" items="${filmList }">
								<option value="${f.filmId }">${f.title }</option>
							</c:forEach>
						</select>
					
						<button type="button" class="btn btn-sm btn-dark" id="btnSelFILM">ADD FILM</button>
					</form>
				</div>
			</div>

			<div><!-- table -->
				<form action="${pageContext.request.contextPath }/on/addInventory" method="post" id="formAddInventory">
					<table class="table">
						<tr>
							<th>STORE ID</th>
							<td><input type="text" name="storeId" value="${storeId }" readonly></td>
						</tr>
						<tr>
							<th>FILM ID</th>
							<td><input type="text" name="filmId" value="" id="filmId" readonly></td>
						</tr>
						<tr>
							<th>FILM TITLE</th>
							<td><input type="text" name="title" value="" id="filmTitle" readonly></td>
						</tr>
					</table>
					<button type="button" class="btn btn-sm btn-dark" id="btnAddFILM"> ADD </button>
				</form>
			</div>
			
		</div>
	</div>
</body>
</html>