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
    
	<jsp:include page="headertag.jsp"/>
  
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
                <a href="" class="navbar-brand m-0 p-0">
                    <h1 class="fw-bold text-primary m-0"><i class="bi bi-tsunami"></i>BOAT</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
            </div>
            <div class="col-lg-8 col-md-7 d-none d-lg-block">
                <div class="row">
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end">
                            
                            
                            <div class="nav-item dropdown">
			                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
			                    	<div class="flex-shrink-0 btn-lg-square border rounded-circle" style="display:inline-flex !important";>
		                                <i class="far fa-clock text-primary"></i>
		                            </div>
			                    </a>
			                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0" style="position: relative; z-index: 1500 !important";>
			                        <a href="#" class="dropdown-item">출근</a>
			                        <a href="#" class="dropdown-item">외출</a>
			                        <a href="#" class="dropdown-item">복귀</a>
			                        <a href="#" class="dropdown-item">퇴근</a>
			                    </div>
			                </div>
                
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
                                <h6 class="mb-0">122309</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <a href="" style="color:black;">
                        <div class="d-flex align-items-center justify-content-end" style="height:70.4px !important;">
                            <div class="flex-shrink-0 btn-lg-square border rounded-circle">
                                <i class="bi bi-chat-fill text-primary"></i>
                            </div>
                            <div class="ps-3">
                                <p class="mb-2">대화하기</p>
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
            
            	<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">회사소개</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="feature.html" class="dropdown-item">오시는길</a>
                    </div>
                </div>
	
				<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">내 정보</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="feature.html" class="dropdown-item">내 정보 보기</a>
                        <a href="team.html" class="dropdown-item">내 글 보기</a>
                        <a href="testimonial.html" class="dropdown-item">내 할일 보기</a>
                    </div>
                </div>
                
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">게시판</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="feature.html" class="dropdown-item">업무 게시판</a>
                        <a href="team.html" class="dropdown-item">자료 게시판</a>
                    </div>
                </div>
                
 				<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공유업무</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="feature.html" class="dropdown-item">캘린더</a>
                        <a href="team.html" class="dropdown-item">주소록</a>
                    </div>
                </div>
                              
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="feature.html" class="dropdown-item">Features</a>
                        <a href="team.html" class="dropdown-item">Our Team</a>
                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                        <a href="404.html" class="dropdown-item">404 Page</a>
                    </div>
                </div>
                
                <a href="contact.html" class="nav-item nav-link">Contact Us</a>
                
            </div>
            
            <div class="d-flex align-items-center justify-content-end" style="height:70.4px !important;">
                <div class="flex-shrink-0 btn-lg-square border rounded-circle" style="background-color:white !important">
                    <i class="bi bi-person-circle text-primary" style="font-size:45px;"></i>
                </div>
                <div class="ps-3">
                    <a href="#" class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block">로그인</a>
                </div>
            </div>
    
            
        </div>
    </nav>
    <!-- Navbar End -->

	 <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    

</body>
</html>