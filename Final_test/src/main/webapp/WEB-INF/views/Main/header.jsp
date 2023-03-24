<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>BOAT</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <meta name="_csrf" content="${_csrf.token }">
  	<meta name="_csrf_header" content="${_csrf.headerName }">
    
	<jsp:include page="headertag.jsp"/>
    <jsp:include page="process_bar.jsp"/>
  	
<style>
  	.inout_button:focus {
	  background-color: #29d329;
	}
	 
	.ps-3 .btn a {
		color:black;
		font-weight:bold;
	}
	
</style>
</head>

<body>

	
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border position-relative text-primary" style="width: 6rem; height: 6rem;" role="status"></div>
        <i class="bi bi-tsunami fa-2x text-primary position-absolute top-50 start-50 translate-middle"></i>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-light px-0 wow fadeIn" data-wow-delay="0.1s" style="background-color: white !important">
        <div class="row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-6 px-5 text-start">
                <ol class="breadcrumb mb-0">
                    
                </ol>
            </div>
            <div class="col-lg-6 px-5 text-end">
                <small>Follow us:</small>
                <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn-square text-primary border-end rounded-0" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn-square text-primary border-end rounded-0" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn-square text-primary border-end rounded-0" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn-square text-primary pe-0" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Brand & Contact Start -->
    <div class="container-fluid py-4 px-5 wow fadeIn" data-wow-delay="0.5s" >
        <div class="row align-items-center top-bar">
            <div class="col-lg-4 col-md-12 text-center text-lg-start">
                <a href="${pageContext.request.contextPath}/index" class="navbar-brand m-0 p-0">
                    <h1 class="fw-bold text-primary m-0"><i class="bi bi-tsunami"></i>BOAT</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
            </div>
            <div class="col-lg-8 col-md-7 d-none d-lg-block">
                <div class="row">
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end">
                            
								<!-- <button class='inout_button'> -->
			                    	<div class="flex-shrink-0 btn-lg-square border rounded-circle" style="display:inline-flex !important; background-color : green;">
			                    	
		                                <i class="far fa-clock text-primary"></i>
		                               
		                            </div>
			                  	<!-- </button> -->
			                    
			            
                
                            <div class="ps-3">
                                <p class="mb-2">근태관리</p>
                                <h6 class="mb-0">월 am8:00</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end">
                            <div class="flex-shrink-0 btn-lg-square border rounded-circle">
                                <i class="fa fa-phone text-primary"></i>
                            </div>
                            <div class="ps-3">
                                <p class="mb-2">인사팀</p>
                                <h6 class="mb-0"><span id="loginid">122309</span></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end"">
                            <div class="flex-shrink-0 btn-lg-square border rounded-circle"
                            	 style=" cursor: pointer;" onclick="location.href='${pageContext.servletContext.contextPath}/member/chat'">
                                <i class="bi bi-chat-fill text-primary"></i>
                            </div>
                            <div class="ps-3"
                            	 style=" cursor: pointer;" onclick="location.href='${pageContext.servletContext.contextPath}/member/chat'">
                                <p class="mb-2">채팅</p>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Brand & Contact End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-primary navbar-dark sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="#" class="navbar-brand ms-3 d-lg-none">MENU</a>
        <button type="button" class="navbar-toggler me-3" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">        
            <div class="navbar-nav me-auto p-3 p-lg-0">
            
            	<a href="${pageContext.request.contextPath}/map" class="nav-item nav-link">회사소개</a>
	
				<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">내 정보</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="${pageContext.request.contextPath}/Attendance/list" class="dropdown-item">근태 관리</a>
                        <a href="${pageContext.request.contextPath}/member/myboardList" class="dropdown-item">내 글 보기</a>
                        <a href="${pageContext.request.contextPath}/Todo/list" class="dropdown-item">내 할일 보기</a>
                    </div>
                </div>
                
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">게시판</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">

                        
                      
                        <a href="${pageContext.request.contextPath}/board/List" class="dropdown-item">업무 게시판</a>
                        <a href="${pageContext.request.contextPath}/Filebo/list" class="dropdown-item">자료 게시판</a>
                        <a href="${pageContext.request.contextPath}/workboard" class="dropdown-item">워크 보드</a>

                    </div>
                </div>
                
 				<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공유업무</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="${pageContext.request.contextPath}/cal" class="dropdown-item">캘린더</a>
                        <a href="${pageContext.request.contextPath}/address" class="dropdown-item">주소록</a>
                    </div>
                </div>
                              
                
                <a href="${pageContext.request.contextPath}/confer/view" class="nav-item nav-link">예약신청</a>
                
            </div>
            
            <div class="d-flex align-items-center justify-content-end" style="height:70.4px !important;">
                <div class="flex-shrink-0 btn-lg-square border rounded-circle" style="background-color:white !important">
                    <i class="bi bi-person-circle text-primary" style="font-size:45px;"></i>
                </div>
                <div class="ps-3">
                    <div class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block">
                    	<a href="${pageContext.request.contextPath}/member/sign_in">로그인</a> | <a href="${pageContext.request.contextPath}/member/sign_up">회원가입</a>
                    </div>
                </div>
            </div>
    
            
        </div>
        
    </nav>
    <!-- Navbar End -->

	<!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	
    

</body>
</html>

