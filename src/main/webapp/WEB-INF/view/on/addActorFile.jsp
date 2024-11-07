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
<title>add actor file</title>

<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		$('#btnAddFile').click(function() {
			
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
		
		$('#btnAddActorFile').click(function() {
			
			if($('.actorFile').length == 0 ){
				alert('파일을 첨부해주세요.');
				return;
			}
			if($('.actorFile').last().val() == ''){
				alert('파일을 첨부해주세요.');
				return;
			}
			
			$('#formAddActorfile').submit();
			
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
		<div class="col-sm-10">
			<p class="display-4">add actor file</p>
			
			<div class="col-sm-10"><!-- form -->
				<form action="${pageContext.request.contextPath }/on/addActorFile" method="post" enctype="multipart/form-data" id="formAddActorfile">
					<table class="table">
						<tr>
							<th>ACTOR_ID</th>
							<td><input type="text" name=actorId value="${actorId }" readonly></td>
						</tr>
						<tr>
							<th>FILE</th>
							<td>
								<div class="col-sm-6" id="fileDiv">
									<button type="button" class="btn btn-secondary btn-sm" id="btnAddFile">파일추가</button>
									<button type="button" class="btn btn-secondary btn-sm" id="btnRemoveFile">파일삭제</button>
									<span style="color:red"> ${msg }</span>
									<input type="file" name="actorFile" class="mt-2 form-control form-control-sm actorFile " id="formFileSm" >
									
								</div>
							</td>
						</tr>
					</table>
					<div>
						<button type="button" class="btn btn-sm btn-dark" id="btnAddActorFile">ADD FILE</button>
					</div>
				</form>
			</div>
			
			
			
			
		</div><!-- main -->
	</div>
</html>