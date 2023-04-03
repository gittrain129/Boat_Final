<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/myinfo.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/ejyang/resources/js/signin.js"></script>
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
                <a class="nav-link" data-toggle="tab" href="#asd">회원 수정</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">회원 탈퇴</a>
              </li>
             	
              
             
             </ul> 
            
            
            
            
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                <div id='calendar'></div>
              </div>
              <div class="tab-pane fade" id="asd">
             	 <div id='calendar2'></div>
              </div>
              <div class="tab-pane fade" id="zxc">
					<div id='calendar'></div>
            </div>
        </div>
      </div>
    </div>
</div>
<div>

<div class="wrap-container">
<div class="left">
	<div class="containers">
		<div class="gt-mb-15">
			<span class="id font-size-36 gt-vertical-middle">사번 : admin</span> <br>
			<span class="id font-size-36 gt-vertical-middle">부서 : 인사팀</span> 
			<span class="font-size-18 gt-vertical-middle">부서장 홍길동</span> 
		</div>
	</div> <!----> 
	<div class="gt-mt-50">
		<div class="title-area">
			<i class="fas fa-chevron-right"></i> 
			<span class="title">메일</span> <!----> 
		</div> 
		<div class="gt-mt-15 gt-mb-10">
			<div class="width-160 el-input"><!----> 
				<input type="text" autocomplete="off" class="el-input__inner"> <!----> <!---->
			</div> 
			<span class="gt-ml-5">@</span> 
			<div class="el-select width-160 gt-ml-5"><!---->
				<div class="el-input el-input--suffix"><!---->
					<input type="text" readonly="readonly" autocomplete="off" placeholder="" class="el-input__inner"><!---->
					<span class="el-input__suffix">
						<span class="el-input__suffix-inner">
							<i class="el-select__caret el-input__icon el-icon-arrow-up"></i>
						</span><!---->
					</span><!----><!---->
				</div>
			</div> <!---->
		</div> 
	</div> 
</div>
<div class="right">
	<div class="gt-mt-50">
		<div class="title-area">
			<i class="fal fa-angle-right"></i> 
			<span class="title">SNS 연동</span>
		</div> 
		
		<table class="my-table no-border gt-mt-10">
			<colgroup>
				<col width="75%"><col>
			</colgroup> 
			<tbody>
				<tr>
					<th>구분</th> 
					<th>연동</th>
				</tr> 
				<tr>
					<td class="text-gray-666">네이버
                      <p>2023년 03월 11일 21시 14분 연동 완료</p>
                    </td> 
                    <td class="gt-center">
                    	<button type="button" class="el-button el-button--info el-button--mini"><!----><!---->
                    	<span>연동 해제</span>
                    	</button>
                    </td>
                </tr> <!----> 
                <tr>
                	<td class="text-gray-666">카카오
                      <p></p>
                    </td> 
                    <td class="gt-center">
                    	<button type="button" class="el-button el-button--default el-button--mini"><!----><!---->
                    	<span>연동하기</span>
                    	</button>
                    </td>
                </tr> 
                <tr>
                	<td class="text-gray-666">구글
                      <p></p>
                    </td>
                    <td class="gt-center">
                    	<button type="button" class="el-button el-button--default el-button--mini"><!----><!---->
                    	<span>연동하기</span>
                    	</button>
                    </td>
                </tr>
            </tbody>
       </table>
    </div> 
</div>

</div>
</div>
</div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>