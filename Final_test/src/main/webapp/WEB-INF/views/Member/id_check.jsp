<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 아이디 찾기</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/idcheck.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/idcheck.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
   <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>아이디 찾기</h3>
          <form action="id_list" method="get">
            <label for="name">이름</label>
            <input type="text" class="_input" name="name" placeholder="실명을 입력해 주세요." id="name">
            <div id="validationServerUsernameFeedback" class="invalid-feedback fw-bold">
				이름(실명)을 입력해 주세요
			</div>

            <label for="email" class="mt-4">이메일</label>
            <input type="email" name="email" class="clear focusInteraction" id="email" placeholder="이메일">
            <div id="validationServerUsernameFeedback2" class="invalid-feedback fw-bold">
				올바른 이메일을 입력해주세요
			</div>
            
            <div id="form-controls">
              <button type="submit"  class="btn btn-primary py-3 px-5 mt-4 w-100" disabled>아이디찾기</button>
            </div>
            
            <div class="find-userinfo__btn_text">
            	<a href="pwd_check">비밀번호를 찾으시나요?</a>
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