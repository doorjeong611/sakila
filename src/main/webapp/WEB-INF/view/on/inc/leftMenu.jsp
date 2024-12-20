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
<title>sidebar</title>
</head>
<body>

<div class="container-fluid " style="height:100%">
    <div class="row flex-nowrap">
        <div class=" bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100" >
               
                    <span class="fs-5 d-none d-sm-inline">Menu</span>
                
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">

                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-light">상점 & 인벤토리 관리</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath }/on/storeList" class="nav-link px-0"> <span class="d-none d-sm-inline">STORE LIST</span> </a>
								<!-- 
									storeMapper.selectStoreList() : Map - store * staff * address
									storeService.getStoreList() : Map
									/on/storeList : storeController -> storeList.jsp
								 -->	
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/addStore" class="nav-link px-0"> <span class="d-none d-sm-inline">상점 추가</span> </a>
                           		<!-- 
                           			Get - /on/addStore 
                           				- [Controller] StaffList 모델 추가 
                           				- [Controller] address 주소 검색 추가.(searchAddress)
                           				- [View] addStore.jsp
                           			Post - /on/addStore : Integer
                           				 - storeService.addStore() : Integer
                           				 - storeMapper.insertStore(store) : store(추가) + staff(수정) 	

								 -->
                           
                            </li>
							<li>
                                <a href="${pageContext.request.contextPath }/on/storeList" class="nav-link px-0"> <span class="d-none d-sm-inline">상점 리스트</span> </a>
                            </li>
					
                        </ul>
                    </li>
  
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-light">고객 관리</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
							<li>
                                <a href="${pageContext.request.contextPath }/on/customerList" class="nav-link px-0"> <span class="d-none d-sm-inline">고객 리스트</span> </a>
                            </li>
                            <li class="w-100">
                                <a href="${pageContext.request.contextPath }/on/addCustomer" class="nav-link px-0"> <span class="d-none d-sm-inline">고객 추가</span> </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">고객 수정</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">스태프 관리</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="${pageContext.request.contextPath }/on/addStaff" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">ADD STAFF</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/staffList" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">STAFF LIST</span>
                                </a>
                            </li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">배우 관리</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="${pageContext.request.contextPath }/on/addActor" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">ADD ACTOR</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/actorList" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">ACTOR LIST</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">MODIFY ACTOR</span></a>
                            </li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu5" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">FILM 관리</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu5" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="${pageContext.request.contextPath }/on/addFilm" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">ADD FILM</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/filmList" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">FILM LIST</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">MODIFY FILM</span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/languageList" class="nav-link px-0"> <span class="d-none d-sm-inline">LANGUAGE LIST</span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/addLanguage" class="nav-link px-0"> <span class="d-none d-sm-inline">ADD LANGUAGE</span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/languageList" class="nav-link px-0"> <span class="d-none d-sm-inline">CATEGORY LIST</span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/on/addLanguage" class="nav-link px-0"> <span class="d-none d-sm-inline">ADD CATEGORY</span></a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="#submenu6" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">통계</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu6" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">#</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">#</span>

                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">#</span></a>
                            </li>
                        </ul>
                    </li>
                  
                </ul>
                
            </div>
        </div>
    </div>
</div>


</body>
</html>