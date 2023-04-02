<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/myinfo.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/ejyang/resources/js/myinfo.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
<div class="gt-relative">
   <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">My BOAT</h1>
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
	  <div class="row">
	  
	    <!-- 왼쪽 -->
	    <div class="col border-end mt-5">
	      <div class="left ps-3 pe-3">
			<div class="containers">
				<div class="gt-mb-15">
					<span class="text-dark" style="font-size:3rem;">${memberinfo.EMPNO} / ${memberinfo.JOB}</span> 
					<span class="fs-3 text-dark ms-4">${memberinfo.NAME}</span> 
				</div>
			</div> 
			
			<!----> 
			<div class="mt-5">
				<div class="title-area">
					<i class="fas fa-chevron-right text-dark"></i> 
					<span class="title fs-5 text-dark">SNS 연동</span> <!----> 
				</div> 
				<div class="mt-3">
					<table class="table">
						<thead class="table-light">
							<tr>
								<th class="text-center">구분</th> 
								<th class="text-center">연동</th>
							</tr> 
						</thead>
						<colgroup>
							<col width="75%"><col>
						</colgroup> 
						<tbody>
							<!-- 구글 --> 
			                <tr>
			                	<td class="pb-0 pt-3 ps-3">구글
			                      <p></p>
			                    </td>
			                    <td class="text-center align-middle">
			                    	<c:if test="${memberinfo.GOOGLELOGIN == null}">
			                    		<span>비연동</span>
			                    	</c:if>
			                    	<c:if test="${memberinfo.GOOGLELOGIN != null}">
			                    		<span>연동</span>
			                    	</c:if>
			                    </td>
			                </tr>
			                
							<!-- 네이버 --> 
							<tr>
								<td class="pb-0 pt-3 ps-3">네이버
			                      <p>2023년 03월 11일 21시 14분 연동 완료</p>
			                    </td> 
			                    <td class="text-center align-middle">
			                    	<c:if test="${memberinfo.NAVERLOGIN == null}">
			                    		<span>비연동</span>
			                    	</c:if>
			                    	<c:if test="${memberinfo.NAVERLOGIN != null}">
			                    		<span>연동</span>
			                    	</c:if>
			                    </td>
			                </tr> 
			                
							<!-- 일반 --> 
			                <tr>
			                	<td class="pb-0 pt-3 ps-3">이메일
			                      <p></p>
			                    </td> 
			                    <td class="text-center align-middle">
			                    	<c:if test="${memberinfo.NAVERLOGIN == null}">
			                    		<span>비연동</span>
			                    	</c:if>
			                    	<c:if test="${memberinfo.NAVERLOGIN != null}">
			                    		<span>연동</span>
			                    	</c:if>
			                    </td>
			                </tr> 
			                
			            </tbody>
			       </table>
				</div> 
				
			</div> 
		  </div>
	    </div>
	    
	    <div class="col">
	      Column
	    </div>
	  </div>
	</div>

</div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>