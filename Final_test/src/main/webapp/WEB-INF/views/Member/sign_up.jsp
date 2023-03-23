<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 회원가입</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/signup.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/signup.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
 
 <!-- 로고 -->
 <a href="/boat/index" class="navbar-brand m-0 p-0">
 	<h1 class="bodylogo fw-bold text-primary m-0"><i class="bi bi-tsunami"></i>BOAT</h1>
 </a>
                
                
                
  <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>환영합니다!</h3>
          <h4>원하시는 회원가입 방법을 선택해주세요.</h4>
          <form name="sign_up" action="${pageContext.request.contextPath}/member/join" method="get">
            <label for="email">이메일</label>
            <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요">
            <p class="css-1u2lazp" style="display: none">올바른 이메일을 입력해주세요.</p>

             
            <div id="form-controls">
              <button type="submit"  class="btn-primary" disabled>이메일로 계속하기</button>
            </div>
            
            <div class="sns_login">
            	<div class="brick-login_2023__sns"> 다른 계정으로 회원가입 하기 </div>
            </div>
            <div class="sns_login_button">
            	<div class="naver">
            		<img src="${pageContext.request.contextPath}/resources/ejyang/image/btn_google.png"><br>
                	<a href="#">
                    	구글 로그인
                    </a>
                </div>
            	<div class="naver">
            		<img src="${pageContext.request.contextPath}/resources/ejyang/image/btnG_아이콘원형.png"><br>
                	<a href="#">
                    	네이버 로그인
                    </a>
                </div>
            </div>
            
            
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          </form>
        </div>


      </div>
  </div>
  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <script type="text/JavaScript" src="./my-script.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>