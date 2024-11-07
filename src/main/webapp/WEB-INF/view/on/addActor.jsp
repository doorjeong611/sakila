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
<title>Add Actor</title>

<style>
	
	#form{
		background-color: #ffffff;
		border-radius: 5%;
		height: 50%;
	}
</style>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		$('#btnAddFile').click(function() {
			
			/* 자바스크립트 API 사용
				let arr = $('.actorFile');
				
				arr.forEach(function() {
					
				});
			*/
			
			/** 파일 무한 추가 방지 **/
			/* 방법 1 */
			// jQuery API 사용 (jquery의 forEach문 : .each())
			/* let flag = true;
			$('.actorFile').each(function(){ // function(index, item){}; item == $(this) 
				console.log($(this).val())
				
				if($(this).val() == ''){
					flag = false;
				}
				
			});
			
			if(flag){
				let html = '<input type="file" name="actorFile" class="actorFile mt-2"><br class="brT">';
				$('#fileDiv').append(html);
			}else{
				alert('파일을 첨부해주세요.');
			}	 */	
			
			/* 방법 2 */
			if($('.actorFile').last().val() == ''){
				alert('파일을 첨부해주세요.');
			}else{
				let html = '<input type="file" name="actorFile" class="mt-2 form-control form-control-sm actorFile " id="formFileSm" >';
				$('#fileDiv').append(html);
			}
			
			
		});
		
		// 파일 삭제
		$('#btnRemoveFile').click(function() {
			// let html = '<input type="file" name="actorFile" class="actorFile mt-2"><br>'; 제거
			console.log($('.actorFile').length);
			
			if($('.actorFile').length == 0){
				alert('삭제할 파일이 없습니다.');
			}else{
				
				$('.actorFile').last().remove();
			
			}
			
		});
	
		// 배우 추가
		$('#btnAddActor').click(function() {
			const nameTest = /^[a-zA-Z가-힣]+$/
			
			if($('#firstName').val() == null || $('#firstName').val() == '' ){
				alert('FIRST NAME을 입력해주세요.');
				$('#firstName').focus();
				return;
			}
			
			if(nameTest.test($('#firstName').val()) == false){ // 이름 정규식 검사
				alert('숫자, 특수문자는 입력할 수 없습니다.');
				$('#firstName').focus();
				return;
			}
			
			if($('#lastName').val() == null ||  $('#lastName').val() == '' ){
				alert('LAST NAME을 입력해주세요.');
				$('#firstName').focus();
				return;
			}
			
			if(nameTest.test($('#lastName').val()) == false){ // 이름 정규식 검사
				alert('숫자, 특수문자는 입력할 수 없습니다.');
				$('#lastName').focus();
				return;
			}
			
			if($('.actorFile').length > 0 && $('.actorFile').last().val()==''){
				alert('첨부되지 않은 파일이 있습니다.');
				return;
			}
			
			$('#formActor').submit();
		})
		
	})
</script>

</head>
<body class= "container-fluid bg-light">
	<div class="row"><!-- body -->
		
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
		<div class="col-sm-10 row d-flex justify-content-center"><!-- main div -->

			<div class="col-sm-5 mt-5 mb-5 ps-5 pe-5 " id="form"><!-- form -->
			
				<p class="display-4">ADD ACTOR</p>
				
				<div class="mt-5"><!-- table -->
					<form action="${pageContext.request.contextPath }/on/addActor" method="post" enctype="multipart/form-data" id="formActor">
						<table class="table">
							<tr>
								<th>FIRST NAME</th>
								<td><input type="text" name="firstName" id="firstName"></td>
							</tr>
							<tr>
								<th>LAST NAME</th>
								<td><input type="text" name="lastName" id="lastName"></td>
							</tr>
							<tr>
								<th>FILE</th>
								<td>
									<div id="fileDiv">
										<button type="button" class="btn btn-secondary btn-sm"
											id="btnAddFile">파일추가</button>
										<button type="button" class="btn btn-secondary btn-sm"
											id="btnRemoveFile">파일삭제</button>
										<span style="color:red"> ${msg }</span>	
										<br>
									</div>
								</td>
							</tr>
						</table>
	
						<div class=" d-flex justify-content-end">
							<button type="button" class="btn btn-primary btn-md" id="btnAddActor">ADD ACTOR</button>
						</div>
					</form>
				</div>
			</div><!-- form -->
			
		</div><!-- main -->
	</div><!-- body -->
</body>
</html>