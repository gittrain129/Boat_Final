<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 아이디 찾기</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/idlist.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 </head>
 <body>
   <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>아이디 받기</h3>
          <form>
            <div class="idpw_userinfo">

            	<!-- <span class="sub_title"></span> -->
            	<div class="find-userinfo">
                	<div class="find-userinfo__item id_list">
                        <div class="find-userinfo__list id_list">
		                    <input id="7" class="btn_radio" type="radio" name="user_id" checked="">
	                        <label for="7">admin</label>
	                        <input type="hidden" name="search_type_7" value="email">
	                        <input type="hidden" name="user_name_7" value="양은정">
	                        <input type="hidden" name="param_7" value="/78Yrck93nh1btNMyyhys+70Bb5yOeiUls98fvIIVYrc3ZOhz+YQmO73SVKBT94AfbvlW07qWn0JWJCcKc75K/KqZBnb6Z0wJlpYoU+GvZQ=">
                    	</div>
                	
                        <div class="find-userinfo__list id_list">
	                        <input id="10" class="btn_radio" type="radio" name="user_id">
	                        <label for="10">admin2</label>
	                        <input type="hidden" name="search_type_10" value="email">
	                        <input type="hidden" name="user_name_10" value="양은정">
	                        <input type="hidden" name="param_10" value="T27oSkYTcy2UJfhdJyMl6oLnbGLg63QJAtNW/ifTA+UeEX8sqMEb/xLZOSH5ECWFSQnRX8BhU97jeH6wlJ+0ko6CzRNvb0Wod817yjVXHtw=">
                    	</div>
                    </div>
                </div>
                

	            <div class="brick-idpw_2022__findinfo">
	                <a href="/login/login_form">로그인하기</a>
	                <a href="/login/pwd_check_form.php">비밀번호를 찾으시나요?</a>
	            </div>
            </div>


          </form>
        </div>


      </div>
  </div>

  

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
 </body>
</html>