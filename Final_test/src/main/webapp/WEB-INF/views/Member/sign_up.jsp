<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 회원가입</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/signup.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/signup.js"></script>
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"charset="utf-8"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
 
 <!-- 로고 -->
 <a href="/boat/index" class="navbar-brand m-0 p-0">
 	<h1 class="bodylogo fw-bold text-primary m-0 text-center"><i class="bi bi-tsunami"></i>BOAT</h1>
 </a>
                
                
                
  <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>환영합니다!</h3>
          <h4>원하시는 회원가입 방법을 선택해주세요.</h4>
          <form name="sign_up" action="${pageContext.request.contextPath}/member/join" method="POST">
            <label for="email" >이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요">
            <div id="user_mail" style="display:none">
		      올바른 이메일을 입력해주세요.
		    </div>

             
            <div id="form-controls">
              <button type="submit"  class="btn btn-primary py-3 px-5" disabled>이메일로 계속하기</button>
            </div>
          </form>
            
           	<div class="text-center other"> 또는 </div>
            
            <form name="naverlogin" action="${pageContext.request.contextPath}/member/naverlogin" method="POST">
	            <div class="form-group d-grid gap-2 col-10 mx-auto">
					<a href="${naverUrl}" class="btn-naver btn-block text-center"> 네이버 회원가입</a>
				</div>
			</form>
			
			
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </div>


      </div>
  </div>
  

  <script type="text/JavaScript" src="./my-script.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>