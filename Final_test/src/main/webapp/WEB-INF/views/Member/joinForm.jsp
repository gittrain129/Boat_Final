<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 회원가입</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/joinForm.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/joinForm.js"></script>
 	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	
	<!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <style>
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
		
		/*보트 로고*/
		@font-face {
		    font-family: 'BMJUA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		.text-primary{
			 font-family:'BMJUA';
			 http://localhost:9700/boat/index
		}
		/*전체 폰트*/
		@font-face {
		     font-family: 'S-CoreDream-3Light';
		     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
		     font-weight: normal;
		     font-style: normal;
		}
		*{
			 font-family: 'S-CoreDream-3Light';
			 font-weight : 700!important;
		}
		
		/*전체 폰트*/
		.flex-shrink-0{font-family : 'Pretendard-Regular';}
 </style>
 </head>
 <body>
 
 <!-- 로고 -->
 <a href="/boat/index" class="navbar-brand p-0">
 	<h1 class="text-center fw-bold text-primary m-0"><i class="bi bi-tsunami"></i>BOAT</h1>
 </a>
                
  
  <div id="w-contents" class="container join_2022_wrap">
    <form class="join_2022_box" name="member">
        <h2 class="page_title">회원가입</h2>
        <div class="login_info_wrap">
            <h3 class="sub_title">로그인 정보</h3>
            <!-- 사진 -->
            <div class="profile">
            	<button class="bF7skra2CCu8uPGJJ3Jw" style="background-image: url(../img/ano.png); background-size: cover;">
	            	<svg width="36" height="36" fill="none" class="g68VV5Ghc0ymGpbFWhEx">
		            	<circle cx="18" cy="18" r="18" fill="#000"></circle>
		            	<path d="M11.375 22.658v2.969h2.969l8.756-8.756-2.97-2.969-8.755 8.756zm14.02-8.083a.788.788 0 000-1.116l-1.852-1.852a.788.788 0 00-1.116 0l-1.45 1.448 2.97 2.97 1.448-1.45z" fill="#fff"></path>
	            	</svg>
	            	<input type="file" name="file" accept="image/.jpg, .jpeg, .png, .gif" class="gzQjiZ66mBZWb7UEN7T0" hidden="">
            	</button>
            </div>
            
            <!-- 입력 -->
            <!-- 부서명 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">부서명</div>
                
                <div class="body col-sm-12 col-md-9">
	                <select class="col-sm-12 col-md-9 form-select" aria-label="Default select example">
					  <option selected>Open this select menu</option>
					  <option value="1">One</option>
					  <option value="2">Two</option>
					  <option value="3">Three</option>
					</select>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_uid" style="display:none;"></p>
                <!-- <span class="warning_message color-orange">영문 또는 숫자 6 ~16자리로 입력해 주세요</span> -->
            </div>
            
            <!-- 사원번호 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">사원번호</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="text" name="user_id" onblur="valid_check_id()" placeholder="6~16자 / 영문 소문자, 숫자 사용 가능" class="input-id _input" id="_label-id">
                    <span id="user_id_alert_icons">
						<img class="icon_check icon_input" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display:none;">
					</span>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_uid" style="display:none;"></p>
                <!-- <span class="warning_message color-orange">영문 또는 숫자 6 ~16자리로 입력해 주세요</span> -->
            </div>
            
            <!-- 비번 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">비밀번호
                </div>
                <div class="body col-sm-12 col-md-9">
                    <input type="password" name="user_pwd1" class="_input" onblur="make_pwd_input_valid(1)" autocomplete="off" placeholder="8~16자 / 문자, 숫자, 특수 문자 모두 혼용" id="_label-pwd">
                	<i class= "fa fa-solid fa-eye-slash" ></i>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_pwd" style="display:none; width:100%"></p>
                <div class="safety_indicator_wrap" id="safety_indicator_pwd" style="display: none;">
                    <div class="indicator uppercase_lowercase">영문 대/소문자</div>
                    <div class="indicator number">숫자</div>
                    <div class="indicator special_character">특수문자</div>
                </div>
            </div>
            
            <!-- 비번확인 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">비밀번호 확인</div>
                <div class="body col-sm-12 col-md-9">
                    <!-- [D]input에 유효한 값이 들어있지 않다면 error_border 클래스 추가 -->
                    <!-- [D]input에 유효한 값이면 success_border 클래스 추가 -->
                    <input type="password" name="user_pwd2" onblur="make_pwd_input_valid(2)" autocomplete="off" placeholder="비밀번호를 다시 입력해 주세요" id="_label-pwd-ck" class="_input">
                	<i class= "fa fa-solid fa-eye-slash" ></i>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_pwd_re" style="display:none;"></p>
            </div>
            
            <!-- 이름 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">이름</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="text" name="user_id" onblur="valid_check_id()" placeholder="6~16자 / 영문 소문자, 숫자 사용 가능" class="input-id _input" id="_label-id">
                    <span id="user_id_alert_icons">
						<img class="icon_check icon_input" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display:none;">
					</span>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_uid" style="display:none;"></p>
                <!-- <span class="warning_message color-orange">영문 또는 숫자 6 ~16자리로 입력해 주세요</span> -->
            </div>
            
            <!-- 메일 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">메일</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="email" name="email" placeholder="이메일을 입력해주세요" class="_input" id="email" value="${email}">
                    <span id="user_id_alert_icons">
						<img class="icon_check icon_input" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display:none;">
					</span>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_uid" style="display:none;"></p>
                <!-- <span class="warning_message color-orange">영문 또는 숫자 6 ~16자리로 입력해 주세요</span> -->
            </div>
            
            
        </div>


        <!-- 가입 약관 동의 -->
        <div class="policy_agree_wrap">
            <h3 class="sub_title">가입 약관 동의</h3>
            <div class="row row-container align-items-center">
                <div class="col-sm-12">
                    <label class="checkbox_wrap font-bold">
                        <input id="agree_all" class="_checkbox" type="checkbox" onchange="all_allow(this)">
                        모든 약관에 동의합니다.
                    </label>
                </div>
            </div>
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-10">
                    <label class="checkbox_wrap">
                        <input id="agree_chk" class="_checkbox" type="checkbox" onchange="on_change_agree_checkbox()">
                        가비아 이용 약관에 동의합니다.
                        <span class="essential">(필수)</span>
                    </label>
                </div>
            </div>
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-10">
                    <label class="checkbox_wrap">
                        <input id="agree_chk2" class="_checkbox" type="checkbox" onchange="on_change_agree_checkbox()">
                        개인정보 수집 및 이용에 동의합니다.
                        <span class="essential">(필수)</span>
                    </label>
                </div>
            </div>
            
            <div id="marketingAgreeToggleLine" style="width: 100%; height: 1px; background-color: #e4e4e4; margin-top: 10px;">
                </div>
            
            <div class="w-list dot no_child">
                <li>14세 미만은 회원 가입이 제한됩니다.</li>
            </div>
        </div>
        <!--  -->

        <div id="form-controls">
        	<button type="submit"  class="btn-primary">로그인</button>
        </div>
        
	</form>
  </div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <script type="text/JavaScript" src="./my-script.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>