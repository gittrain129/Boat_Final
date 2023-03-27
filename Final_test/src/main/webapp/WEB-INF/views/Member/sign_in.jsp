<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 로그인</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/login.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/signin.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 	<script>
 		var result="${result}";
 		if(result == 'joinSuccess'){
 			alert("회원가입을 축하합니다.")
 		}else if("${loginfail}" == "loginFailMsg"){
 			alert("아이디나 비밀번호 오류 입니다.")
 		}
 	</script>
 </head>
 <body>
   <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3 class="fw-bold text">로그인</h3>
          <form name="loginform" action="${pageContext.request.contextPath}/member/loginProcess" method="post">
            <label for="name">사번</label>
            <i class= "fas fa-user"></i>
            <input type="text" name="EMPNO" id="name" class="form-control" placeholder="사번을 입력해주세요">

            <label for="password">비밀번호</label>
            <i class= "fas fa-lock"></i>
            <input type="password" name="PASSWORD" id="password" class="form-control" placeholder="비밀번호를 입력해주세요">
		    <i class= "fa fa-solid fa-eye-slash" ></i>

            <div>
	        	<input type="checkbox" id="terms" name="remember-me">
	        	<label for="terms" class="terms_lable">로그인 유지하기</label>
			</div>
			 
            <div id="form-controls">
              <button type="submit"  class="btn btn-primary py-3 px-5">로그인</button>
              <!--<button type="button" id="toggleSignIn">Sign In</button> -->
            </div>
            
            <div class="sns_login">
            	<div class="brick-login_2023__sns"> 다른 계정으로 로그인 하기 </div>
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
            
            
            <div class="findinfo">
            	<a href="id_check">아이디 찾기</a>
                <a href="pwd_check">비밀번호 찾기</a>
                <a href="sign_up">회원 가입</a>
            </div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          </form>
        </div>


      </div>
  </div>

  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>