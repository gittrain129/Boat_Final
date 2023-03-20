<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<title>회원관리 시스템 로그인 페이지</title>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/login.css" type="text/css" rel="stylesheet">
 	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
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
	        <input type="checkbox" id="terms" name="terms">
	        <i class="fas fa-check-circle"></i>
	        <label for="terms" class="terms_lable"><span>아이디 저장</span></label>

			 
            <div id="form-controls">
              <button type="submit">Sign Up</button>
              <!--<button type="button" id="toggleSignIn">Sign In</button> -->
            </div>
            

          </form>
        </div>

        <!-- Sign in form -->
        <div id="sign-in-container" class="hide">
          <h3>Welcome Back</h3>
          <form>
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="user@example.com">

            <label for="password">Password</label>
            <input type="password" name="password" id="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;">

            <div id="form-controls">
              <button type="submit">Sign In</button>
              <button type="button" id="toggleSignUp">Sign Up</button>
            </div>

            <input type="checkbox" name="terms" id="terms">
            <label for="terms">I agree to the <a href="#" class="termsLink">Terms of service</a> and <a href="#" class="termsLink">Privacy Policy</a>.</label>
          </form>
        </div>

      </div>
  </div>

  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
 </body>
</html>