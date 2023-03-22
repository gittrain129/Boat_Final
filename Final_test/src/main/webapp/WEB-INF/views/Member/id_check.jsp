<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 아이디 찾기</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/idcheck.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
   <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>아이디 찾기</h3>
          <form>
            <label for="name">이름</label>
            <input type="text" class="_input" name="name" placeholder="실명을 입력해 주세요." id="name">

            <label for="sub_title">이메일</label>
            <div class="body multi_column" id="_input-email-body">
            	<div class="column_wrap">
                	<input type="text" name="email" class="clear focusInteraction" id="sub_title" placeholder="이메일">
                    <span class="whelk clear">@</span>
                    <div class="auto_complete_wrap" id="auto_complete">
                    	<input type="text" name="email_domain" id="email_domain" class="clear focusInteraction" placeholder="직접 입력" autocomplete="off" style="width: 150px; padding-right: 30px;">
                        <ul class="content" style="display: none;"></ul>
                    </div>
                </div>
            </div>
            
            <div id="form-controls">
              <button type="submit"  class="btn-primary">아이디찾기</button>
            </div>
            
            <div class="find-userinfo__btn_text">
            	<a href="pwd_check">비밀번호를 찾으시나요?</a>
            </div>


          </form>
        </div>


      </div>
  </div>

  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>