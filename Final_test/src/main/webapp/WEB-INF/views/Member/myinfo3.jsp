<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/myinfo.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/myinfo.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 	<style>
 		.mail_input {
		    height: 60px;
		    width: 100%;
		    font-size: 1rem;
		    border: none;
		    outline: none;
		    border-bottom: 1px solid #009CFF;
		}
		
 		._input {
		    height: 60px;
		    width: 100%;
		    font-size: 1rem;
		    border: none;
		    outline: none;
		    border-bottom: 1px solid #cdcdcd;
		}
		
		._input:focus {
			border-color: #009CFF;
		}
		
		.profileimg {
		    position: relative;
		    width: 124px;
		    height: 124px;
		    border-radius: 50%;
		    border: 0;
		    background: none;
		    margin-bottom: 20px;
		}
		.profileimg2 {
		    position: absolute;
		    width: 124px;
		    height: 124px;
		    right: 0;
		    bottom: 0;
		    border-radius: 50%;
		}
		
		.head + .body {
			margin-bottom: 5px;
		}
		.head + .body select {
			height: 50px;
			border: none;
			border-bottom: 1px solid #cdcdcd;
			border-radius: 0px;
			padding-left: 2px;
		}
		
		.body select:focus {
			outline: none;
			border-color: #009CFF;
			box-shadow: none;
		}
		
		.body {
		    position: relative;
		}
		
		.row-container .fa-eye, .row-container .fa-eye-slash{
		    position: absolute;
		    left: 87%;
		    cursor: pointer;
		    color: rgb(184, 184, 184);
		    top: 20px;
		    font-size: 20px;
		}

		.invalid-feedback {
			padding-left: 169px;
		}
 	</style>
 	<script>
 		$(function(){
 			//부서명
 			let department = '${memberinfo.DEPT}'
 			console.log(department)
 				
 			let part = 1;
 			switch(department){
 				case '개발팀':
 					part=2;
 					break;
 				case '인사팀':
 					part=3;
 					break;
 				case '기획팀':
 					part=4;
 					break;
 				case '영업팀':
 					part=5;
 					break;
 			}
 			$('#dept-select option:nth-child('+part+')').prop('selected',true)
 		})
 		
 		
 	</script>
 </head>
 <body>
<div class="gt-relative">
   <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">내 정보 관리</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                	<!-- 
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page">Our Team</li>
                     -->
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    <div class="container">
      
      <div class="row">
        <div class="col">
         
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">회원 정보</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">회원 탈퇴</a>
              </li>
             	
              
             
             </ul> 
            
            
            
            
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                <div id='calendar'></div>
              </div>
              <div class="tab-pane fade" id="zxc">
					<div id='calendar'></div>
              </div>
        </div>
      </div>
    </div>
  </div>
  
  
  
  	<!-- 내용 -->
    <div class="container">
    	<div class="row justify-content-md-center d-flex align-items-center" style="margin-top: 30px; padding: 150px 130px 150px;">
		    <div class="col-sm-12 col-md-8">
			    <p class="fs-3 text-dark">비밀번호 재확인</p> 
			    <p class="fs-5 fw-normal text-dark">정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p> 
			    <div class="mt-4 row row-container ps-2">
			    	<input type="password" autocomplete="off" class="form-control w-50"  style="height: 50px;"> 
				    <button type="button" class="col-2 ms-3 btn btn-outline-primary">
				    	확인
				    </button>
			    </div> 
		    </div>
		    <div class="col-sm-12 col-md-4">
		      <img src="${pageContext.request.contextPath}/resources/img/secession.png" style="width: 260px;">
		    </div>
		</div>
	</div>

</div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>