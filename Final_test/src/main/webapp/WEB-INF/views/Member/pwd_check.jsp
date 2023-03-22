<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 비밀번호 찾기</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/pwdcheck.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
   <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>비밀번호 찾기</h3>
          <form>
            <label for="name">이름</label>
            <input type="text" class="_input" name="name" placeholder="실명을 입력해 주세요" id="name">

            <label for="empno">사번</label>
			<input type="text" name="user_id" placeholder="사번을 입력해 주세요" class="input-id _input error_border" id="empno">
	
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
            
            <button class="button sm lib-mt-10 auth" type="button" id="auth_email_btn" style="color: rgb(153, 153, 153);">인증하기</button>
            
            <div class="row row-container" style="" id="auth_email_content">
            	<div class="body multi_column" id="_input-auth-num-email-body" style="flex: 1 0; width: 100%;">
                	<div class="column_wrap borders">
                    	<input type="tel" name="auth_num_email" class="_input clear focusInteraction" id="_input-auth-num-email" placeholder="인증 번호를 입력해 주세요">
                    	<span class="icon_input" style="right: 10px;">
							<span class="limit_time" id="limit_time_email" style="color: rgb(48, 144, 214);">09:53</span>
						</span>
                    </div>
	                <div class="button_wrap">
		                <button class="button primary sm tablet-only" type="button" onclick="on_click_auth_num_email()">확인
		                </button>
	                </div>
                </div>
                	<p class="warning_message color-blue" id="valid_check_msg_email_auth" style="display: none;"></p>
            </div>

			<div class="find-userinfo__btn_text">
            	<a href="id_check">아이디를 찾으시나요?</a>
            </div>

          </form>
        </div>


      </div>
  </div>

  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>