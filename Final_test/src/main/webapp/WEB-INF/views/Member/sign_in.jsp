<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 로그인</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/login.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/signin.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
   <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>로그인</h3>
          <form>
            <label for="name">사번</label>
            <i class= "fas fa-user"></i>
            <input type="text" name="name" id="name" placeholder="사번을 입력해주세요">

            <label for="password">비밀번호</label>
            <i class= "fas fa-lock"></i>
            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요">
		    <i class= "fa fa-solid fa-eye-slash" ></i>

			<!--
            <input type="checkbox" name="terms" id="terms">
            <label for="terms">로그인 유지하기</label>
             -->
             
            <div>
	        	<input type="checkbox" id="terms" name="terms">
	        	<label for="terms" class="terms_lable">로그인 유지하기</label>
			</div>
			 
            <div id="form-controls">
              <button type="submit"  class="btn-primary">로그인</button>
              <!--<button type="button" id="toggleSignIn">Sign In</button> -->
            </div>
            
            <div class="sns_login">
            	<div class="brick-login_2023__sns"> 다른 계정으로 로그인 하기 </div>
            </div>
            

          </form>
        </div>


      </div>
  </div>

  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
 </body>
</html>