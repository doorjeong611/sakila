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
<title>add film</title>

<style>
	.essential{
		background-color: #D8D8D8;
	}
</style>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		$('#btnAddFilm').click(function() {
			// 유효성 검사 (description, releaseYear, originalLanguageId, length, specialFeatures 제외 (null 허용컬럼.))
			if($('#title').val() == ''){
				alert('제목을 입력하세요.');
				$('#title').focus();
				return ;
			}
			if($('#languageId').val() == ''){
				alert('Language를 선택하세요.');
				$('#languageId').focus();
				return ;
			}
			if($.isNumeric($('#rentalDuration').val()) == false){ // 숫자가 아니면
				alert('숫자만 입력가능한 항목입니다.');
				$('#rentalDuration').focus();
				return;
			}
			if($.isNumeric($('#rentalRate').val()) == false){ // 숫자가 아니면
				alert('숫자만 입력가능한 항목입니다.');
				$('#rentalRate').focus();
				return;
			}
			if($.isNumeric($('#replacementCost').val()) == false){ // 숫자가 아니면
				alert('숫자만 입력가능한 항목입니다.');
				$('#replacementCost').focus();
				return;
			}
			if($('#rating:checked').length == 0){ // radio 항목 선택
				alert('등급을 선택해 주세요');
				$('#rating').focus();
				return;
			}

			 $('#formAddFilm').submit();
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
			<p class="display-4">add film</p>
			
			<div class="col-sm-8"><!-- form -->
				<form action="${pageContext.request.contextPath }/on/addFilm" method="post" id="formAddFilm">
					<table class="table">
						<tr>
							<th colspan="11">※<span class="essential">(*)항목</span>은 반드시 입력해주세요.※</th>
						</tr>
						<tr>
							<th ><span class="essential">TITLE *</span></th>
							<td><input type="text" name="title" id="title"></td>
						</tr>
						<tr>
							<th>DESCRIPTION</th>
							<td><textarea rows="3" cols="50" name="description" id="description"></textarea></td>
						</tr>
						<tr>
							<th>RELEASE YEAR</th>
							<td><input type="number" name="releaseYear" id="releaseYear" placeholder="YYYY"> YEAR</td>
						</tr>
						<tr>
							<th><span class="essential">LANGUAGE *</span></th>
							<td>
								<select name="languageId" id="languageId">
									<option value="">LANGUAGE</option>
									<c:forEach var="lan" items="${languageList }">
										<option value="${lan.languageId }">${lan.name}</option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<th>ORIGINAL LANGUAGE</th>
							<td>
								<select name="originalLanguageId" id="originalLanguageId">
									<option value="">ORIGINAL LANGUAGE</option>
									<c:forEach var="lan" items="${languageList }">
										<option value="${lan.languageId }">${lan.name}</option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<th><span class="essential">RENTAL DURATION *</span></th><!-- DB기본값 : 3 -->
							<td><input type="number" name="rentalDuration" id="rentalDuration" value="3"></td>
						</tr>
						<tr>
							<th><span class="essential">RENTAL RATE *</span></th><!-- DB기본값 : 4.99 -->
							<td><input type="number" name="rentalRate" id="rentalRate" value="4.99"></td>
						</tr>
						<tr>
							<th>LENGTH</th>
							<td><input type="number" name="length" id="length" > MINUTE</td>
						</tr>
						<tr>
							<th><span class="essential">REPLACEMENT COST *</span></th><!-- DB기본값 : 19.99 -->
							<td><input type="number" name="replacementCost" id="replacementCost" value="19.99" ></td>
						</tr>
						<tr>
							<th><span class="essential">RATING *</span></th><!-- DB기본값 : 'G' ENUM(G, PG, PG-13, R, NC-17) -->
							<td>
								<label><input type="radio" name="rating" id="rating" value="G">G &nbsp;</label>
								<label><input type="radio" name="rating" id="rating" value="PG">PG &nbsp;</label>
								<label><input type="radio" name="rating" id="rating" value="PG-13">PG-13 &nbsp;</label>
								<label><input type="radio" name="rating" id="rating" value="R">R &nbsp;</label>
								<label><input type="radio" name="rating" id="rating" value="NC-17">NC-17 &nbsp;</label>
							
							</td>
						</tr>
						<tr>
							<th>SPECIAL FEATURES</th><!-- SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') -->
							<td>
								<label><input type="checkbox" name="specialFeatures" id="specialFeatures" value="Trailers">Trailers &nbsp;</label>
								<label><input type="checkbox" name="specialFeatures" id="specialFeatures" value="Commentaries">Commentaries &nbsp;</label>
								<label><input type="checkbox" name="specialFeatures" id="specialFeatures" value="Deleted Scenes">Deleted Scenes &nbsp;</label>
								<label><input type="checkbox" name="specialFeatures" id="specialFeatures" value="Behind the Scenes">Behind the Scenes &nbsp;</label>
							</td>
						</tr>

					</table>
					<div>
						<button type="button" id="btnAddFilm" class="btn btn-sm btn-dark">ADD FILM</button>
					</div>
					
				</form>
			</div>
			
			
			
		</div>
	</div>
</body>
</html>