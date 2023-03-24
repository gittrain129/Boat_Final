<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 회원가입폼</title>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/joinForm.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/signup.js"></script>
 	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	
	<!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
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
          <h3>회원가입이다</h3>
          <h4>원하시는 회원가입 방법을 선택해주세요.</h4>
          <form>
            <label for="email">이메일</label>
            <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요">
            <p class="css-1u2lazp" style="display: none">올바른 이메일을 입력해주세요.</p>

             
            <div id="form-controls">
              <button type="submit"  class="btn-primary" disabled>이메일로 계속하기</button>
              <!--<button type="button" id="toggleSignIn">Sign In</button> -->
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
  
  
  
  <div id="w-contents" class="join_2022_wrap">
    <!-- <gabia-library /> -->
    <div class="logo_wrap">
        <a href="https://www.gabia.com" class="link_logo">
            <img class="logo" src="https://static.gabia.com/www/common/img/logo.svg" alt="">
        </a>
    </div>
    <form id="member_info" name="member_info" method="post" action="/member/member_register_complete.php">
        <input type="hidden" name="member_id" id="member_id" value="">
        <input type="hidden" name="member_gubun" id="member_gubun" value="">
        <input type="hidden" name="origin_site" value="">
    </form>
    <form class="join_2022_box" name="member">
        <input type="hidden" name="result_nemo" id="result_nemo" value="1">
        <input type="hidden" name="target_url" id="target_url" value="">
        <input type="hidden" name="origin_site" id="origin_site" value="">
        <input type="hidden" name="domain" id="domain" value="">
        <input type="hidden" name="domain_name" id="domain_name" value="">
        <input type="hidden" name="gabia_destination" id="gabia_destination" value="">
        <!-- 리셀러가 초대하여 가입하는 승인 코드 -->
        <input type="hidden" name="reseller_appr_code" id="reseller_appr_code" value="">
        <input type="text" name="user-id" style="opacity: 0;position: absolute;">
        <input type="password" style="opacity: 0;position: absolute;">
        <h2 class="page_title">회원가입</h2>
        <div class="login_info_wrap">
            <h3 class="sub_title">로그인 정보</h3>
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">아이디</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="text" name="user_id" onblur="valid_check_id()" placeholder="6~16자 / 영문 소문자, 숫자 사용 가능" class="input-id _input" id="_label-id">
                    <span id="user_id_alert_icons">
						<img class="icon_check icon_input" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display:none;">
					</span>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_uid" style="display:none;"></p>
                <!-- <span class="warning_message color-orange">영문 또는 숫자 6 ~16자리로 입력해 주세요</span> -->
            </div>
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">
                    비밀번호
                    <gabia-popover class="password_popover" style="display: inline-block; margin-left: 4px;" id="G3305063">
                        <div class="gt-layer-container gt-layer" slot="content" style="display: block;">
                            <div id="_layer-info-pw" class="gt-layer-wrap gt-animate-opacity">
                                <div class="gt-layer-header">비밀번호</div>
                                <div class="gt-layer-body">
                                    <ul class="w-list dot">
                                        <li>비밀번호는 8~16자의 영문(대/소문자 구분), 숫자, 특수문자를 조합하여 구성해 주세요. (예: gabia!234)</li>
                                        <li>허용된 특수문자(! @ # $ ^ * ( ) - _ = + [ ] { } ; : ‘ “ , . &lt; &gt; / ? ~ ` ₩ \)만 사용할 수
                                            있습니다.
                                        </li>
                                        <li>아이디와 동일한 비밀번호는 사용할 수 없습니다.</li>
                                        <li>주민등록번호, 생일, 전화번호 등 타인이 알아내기 쉬운 비밀번호는 유출 위험이 있으니 피해 주세요.</li>
                                        <li>연속된 문자(abcd, 1234) 혹은 키보드 상 연속된 배열(asdf, qwer)로 구성된 비밀번호는 사용을 자제해 주세요.</li>
                                    </ul>
                                </div>
                                <div class="gt-layer-close" data-layer="hide" onclick="document.querySelector('.password_popover').close();">
                                    <img src="https://static.gabia.com/gtris/1.1.0/assets/images/delete.svg" title="닫기" class="gt-block">
                                </div>
                            </div>
                        </div>
                        <span slot="button" class="gt-layer" id="_layer-warning-pw">
							<button type="button" class="gt-open-layer" id="_btn-warning-pw" style="margin-left: 0;"></button>
						</span>
                    </gabia-popover>
                </div>
                <div class="body col-sm-12 col-md-9">
                    <input type="password" name="user_pwd1" class="_input" onblur="make_pwd_input_valid(1)" autocomplete="off" placeholder="8~16자 / 문자, 숫자, 특수 문자 모두 혼용" id="_label-pwd">
                    <span id="user_pwd1_alert_icons" class="icon_input">
						<img class="icon_eye" src="https://static.gabia.com/responsive/assets/images/accounts/ico_eye.svg" alt="" style="display: none; cursor: pointer" onclick="on_click_pwd_icon_eye(1, false)">
						<img class="icon_eye_no" src="https://static.gabia.com/responsive/assets/images/accounts/ico_eye_no.svg" alt="" style="cursor: pointer" onclick="on_click_pwd_icon_eye(1, true)">
						<img class="icon_lock_orange" src="https://static.gabia.com/responsive/assets/images/accounts/ico_lock_orange.svg" alt="" style="display: none;">
						<img class="icon_lock_blue" src="https://static.gabia.com/responsive/assets/images/accounts/ico_lock_blue.svg" alt="" style="display: none;">
						<img class="icon_check" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display: none;">
					</span>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_pwd" style="display:none; width:100%"></p>
                <div class="safety_indicator_wrap" id="safety_indicator_pwd" style="display: none;">
                    <div class="indicator uppercase_lowercase">영문 대/소문자</div>
                    <div class="indicator number">숫자</div>
                    <div class="indicator special_character">특수문자</div>
                </div>
            </div>
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3">비밀번호 확인</div>
                <div class="body col-sm-12 col-md-9">
                    <!-- [D]input에 유효한 값이 들어있지 않다면 error_border 클래스 추가 -->
                    <!-- [D]input에 유효한 값이면 success_border 클래스 추가 -->
                    <input type="password" name="user_pwd2" onblur="make_pwd_input_valid(2)" autocomplete="off" placeholder="비밀번호를 다시 입력해 주세요" id="_label-pwd-ck" class="_input">
                    <span id="user_pwd2_alert_icons" class="icon_input">
						<img class="icon_eye" src="https://static.gabia.com/responsive/assets/images/accounts/ico_eye.svg" alt="" style="display: none; cursor: pointer" onclick="on_click_pwd_icon_eye(2, false)">
						<img class="icon_eye_no" src="https://static.gabia.com/responsive/assets/images/accounts/ico_eye_no.svg" alt="" style="cursor: pointer" onclick="on_click_pwd_icon_eye(2, true)">
						<img class="icon_lock_orange" src="https://static.gabia.com/responsive/assets/images/accounts/ico_lock_orange.svg" alt="" style="display: none;">
						<img class="icon_check" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display: none;">
					</span>
                </div>
                <p class="warning-sign warning_message color-orange" id="valid_check_msg_pwd_re" style="display:none;"></p>
            </div>
        </div>

        <div class="member_info_wrap">
            <h3 class="sub_title">회원 정보</h3>
            <div class="row row-container">
                <div class="head col-sm-12 col-md-3">회원 유형</div>
                <div class="body col-sm-12 col-md-9">
                    <div class="tab_wrap gt-tab">
                        <div class="tab_nav gt-tab-nav" id="_myTab-join">
                            <a href="javascript:void(0);" class="gt-nav-item tab_nav_item private" data-id="_tab-individual">개인</a>
                            <a href="javascript:void(0);" class="gt-nav-item tab_nav_item company" data-id="_tab-company">기업</a>
                        </div>
                    </div>
                </div>
                <!-- TODO: 회원 유형을 선택하지 않고 [가입하기]를 누른 경우 나오는 헬퍼 문구 -->
                <p class="warning_message color-orange" id="valid_check_msg_user_type" style="display: none;">회원 유형을
                    선택해주세요</p>
            </div>

            <!-- 개인 -->
            <div id="_tab-individual" style="display: none;">
                <div class="row row-container">
                    <div class="head col-sm-12 col-md-3">이름</div>
                    <div class="body col-sm-12 col-md-9">
                        <input type="text" name="hanname" class="_input" id="_input-hanname" placeholder="실명을 입력해 주세요.">
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_hanname" style="display: none;"></p>
                </div>
            </div>

            <!-- 기업 -->
            <div id="_tab-company" style="display: none">
                <div class="row row-container">
                    <div class="head col-sm-12 col-md-3">기업명</div>
                    <div class="body col-sm-12 col-md-9">
                        <input type="text" name="hanorg" id="_input-hanorg" class="_input" placeholder="기업명을 입력해 주세요." onblur="valid_check_hanorg();">
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_hanorg" style="display: none;"></p>
                </div>
                <div class="row row-container">
                    <div class="head col-sm-12 col-md-3">사업자등록번호</div>
                    <div class="body col-sm-12 col-md-9">
                        <input type="text" id="_input-co_juno" name="co_juno" class="_input" placeholder="숫자만 입력해 주세요." onblur="valid_check_co_juno();">
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_co_juno" style="display: none;"></p>
                </div>
                <div class="row row-container">
                    <div class="head col-sm-12 col-md-3">담당자명</div>
                    <div class="body col-sm-12 col-md-9">
                        <input type="text" id="_input-co_hanname" name="co_hanname" class="_input" placeholder="실명을 입력해 주세요." onblur="valid_check_co_hanname();">
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_co_hanname" style="display: none;"></p>
                </div>
            </div>

            <!-- tab 공통 -->
            <div id="_myTab-join-common" style="display: none;">
                <div class="row row-container">
                    <div class="head col-sm-12 col-md-3">휴대전화</div>
                    <div class="body col-sm-12 col-md-9 multi_column" id="_input-phone-body">
                        <div class="column_wrap border">
                            <input type="tel" id="_input-phone" name="phone_all" class="_input myphone_number clear focusInteraction" placeholder="숫자만 입력해 주세요." value="010 - ">
                            <span id="phone_all_alert_icons" class="icon_input">
								<img class="icon_check" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display: none">
							</span>
                        </div>
                        <div class="button_wrap">
                            <button class="button outline sm auth_phone_all_btn tablet-only" type="button" id="auth_phone_all_btn">인증(필수)</button>
                        </div>
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_phone_all" style="display:none">
                        <!-- <a href="https://customer.gabia.com/ask/mail#/" target="_self" style="text-decoration: underline;">문의하기 ></a> -->
                    </p>
                    <div class="button_wrap">
                        <button class="button outline sm auth_phone_all_btn tablet-hide" type="button">인증(필수)</button>
                    </div>
                </div>
                <div class="row row-container" style="display: none;" id="auth_phone_content">
                    <div class="head col-sm-12 col-md-3"></div>
                    <div class="body col-sm-12 col-md-9 multi_column" id="_input-auth-num-phone-body">
                        <div class="column_wrap border">
                            <input type="tel" name="auth_num_phone_all" class="_input clear focusInteraction" id="_input-auth-num-phone" placeholder="인증 번호 6자리를 입력해 주세요.">
                            <span class="icon_input" style="right: 10px;">
								<span class="limit_time" id="limit_time_phone">10:00</span>
							</span>
                        </div>
                        <div class="button_wrap">
                            <button class="button primary sm tablet-only" type="button" onclick="on_click_auth_num_phone_all()">확인
                            </button>
                        </div>
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_auth_num" style="display: none;"></p>
                    <div class="button_wrap">
                        <button class="button primary sm tablet-hide" type="button" onclick="on_click_auth_num_phone_all()">확인
                        </button>
                    </div>
                </div>                
                <div class="dontget_authnumber_wrap phone_all" style="display: none;">
					<span class="gt-layer" id="_layer-dontget-authnumber2">
						<gabia-popover class="dontget_authnumber_popover" position="bottom-left" id="G8059982" style="display: inline-block;">
							<div class="toast-popup" slot="content" style="display: block;">
								<div class="title">알림톡으로 인증 번호를 받지 못하셨나요?</div>
								<div class="desc">
									통신사 사정에 따라 알림톡 수신이 최대 5분 정도 지연될 수 있습니다. <br>
									5분 후에도 수신하지 못하셨다면, 인증 번호 재발송을 시도하시거나 메시지 차단 내역, 용량 초과, 데이터 연동 여부 등을 확인해 주세요. <br>
                                    알림톡으로 미수신 시, 문자 메시지로 발송될 수 있습니다. <br>
									(인증 번호 전송은 1일 최대 5회만 가능합니다)
								</div>
								<div class="close-btn" data-layer="hide" onclick="document.querySelector('.dontget_authnumber_popover').close();">
									×
								</div>
							</div>
							<button slot="button" id="_btn-dontget-authnumber2" class="link" type="button">
								인증번호를 받지 못하셨나요?
							</button>
						</gabia-popover>
					</span>
                </div>

                <div class="row row-container">
                    <div class="head col-sm-12 col-md-3">이메일</div>
                    <div class="body col-sm-12 col-md-9 multi_column" id="_input-email-body">
                        <div class="column_wrap border">
                            <input type="text" name="email" class="_input clear focusInteraction" id="_input-email" placeholder="이메일">
                            <span class="whelk clear">@</span>
                            <div class="auto_complete_wrap" id="auto_complete">
                                <input type="text" name="email_domain" id="email_domain" class="_input clear focusInteraction" placeholder="직접 입력" autocomplete="off" style="width: 150px; padding-right: 30px;">
                                <span id="email_domain_alert_icons" class="icon_input">
									<img class="icon_check" src="https://static.gabia.com/responsive/assets/images/accounts/ico_check.svg" alt="" style="display: none">
								</span>
                                <ul class="content" style="display: none;"></ul>
                            </div>
                        </div>
                        <div class="button_wrap">
                            <button class="button outline sm deactive tablet-only auth_email_btn" type="button">인증(선택)</button>
                        </div>
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_email" style="display: none;">@ 뒤의 이메일
                        주소를 정확히 입력해주세요.</p>
                    <div class="button_wrap">
                        <button class="button outline sm deactive tablet-hide auth_email_btn" type="button">인증(선택)</button>
                    </div>
                </div>

                <!-- TODO: 이메일 인증번호 입력폼 -->
                <div class="row row-container" style="display: none;" id="auth_email_content">
                    <div class="head col-sm-12 col-md-3"></div>
                    <div class="body col-sm-12 col-md-9 multi_column" id="_input-auth-num-email-body">
                        <div class="column_wrap border">
                            <input type="tel" name="auth_num_email" class="_input clear focusInteraction" id="_input-auth-num-email" placeholder="인증 번호 6자리를 입력해 주세요.">
                            <span class="icon_input" style="right: 10px;">
								<span class="limit_time" id="limit_time_email">10:00</span>
							</span>
                        </div>
                        <div class="button_wrap">
                            <button class="button primary sm tablet-only" type="button" onclick="on_click_auth_num_email()">확인
                            </button>
                        </div>
                    </div>
                    <p class="warning_message color-orange" id="valid_check_msg_email_auth" style="display: none;">@ 뒤의
                        이메일 주소를 정확히 입력해주세요.</p>
                    <div class="button_wrap">
                        <button class="button primary sm tablet-hide" type="button" onclick="on_click_auth_num_email()">확인
                        </button>
                    </div>
                </div>
                <div class="dontget_authnumber_wrap email" style="display: none;">
					<span class="gt-layer" id="_layer-dontget-authnumber2">
						<gabia-popover class="dontget_authnumber__email_popover" position="bottom-left" id="G9284447" style="display: inline-block;">
							<div class="toast-popup" slot="content" style="display: block;">
								<div class="title">메시지로 인증 번호를 받지 못하셨나요?</div>
								<div class="desc">
									서비스 사정에 따라, 이메일 수신이 최대 5분 정도 지연될 수 있습니다. <br>
									5분 후에도 수신하지 못하셨다면 인증 번호 재발송을 시도하시거나 스팸 메일함, 메일 용량 초과, 메일 차단 여부 등을 확인해 주세요.
								</div>
								<div class="close-btn" data-layer="hide" onclick="document.querySelector('.dontget_authnumber__email_popover').close();">
									×
								</div>
							</div>
							<button slot="button" id="_btn-dontget-authnumber3" class="link" type="button">
								인증번호를 받지 못하셨나요?
							</button>
						</gabia-popover>
					</span>
                </div>
            </div>

            <p class="warning-sign warning_message color-orange" id="_member_info_wrap" style="display:none;"></p>
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
                <div class="body d-flex col-sm-12 col-md-2">
                    <a href="https://policy.gabia.com/" class="detail_link" title="새창" target="_blank">
                        상세보기
                        <i class="far fa-chevron-right"></i>
                    </a>
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
                <div class="body d-flex col-sm-12 col-md-2">
                    <!-- <a
                            href="https://www.gabia.com/agreements/policy_collect"
                            class="detail_link"
                            title="새창"
                            target="_blank"
                    >상세보기<i class="far fa-chevron-right"></i></a> -->
                    <button type="button" class="detail_link" id="privacyConsentToggleButton">
                        상세보기
                        <i class="far fa-chevron-down"></i>
                        <i class="far fa-chevron-up"></i>
                    </button>
                </div>
                <div id="privacyConsentContent" class="privacy_consent_content">
                    <p>가비아는 아래와 같이 회원의 개인정보를 수집 및 이용합니다. 또한, 서비스 제공을 위하여 일부 업무를 외부 업체에 위탁하고 있으며, 위탁받은 업체가 개인정보보호 관계 법령을 위반하지 않도록 관리/감독하고 있습니다.</p>
                    <ul class="mt-25">
                        <li>
                            <p>• 수집항목</p>
                            <ol>
                                <li class="mt-25">
                                    <p>1. 최초 회원가입 시 회원 식별 및 최적화된 서비스 제공을 위해 아래와 같은 정보를 수집합니다.</p>
                                    <p>- 필수 항목: 아이디, 비밀번호, 이름/기업명, 사업자등록번호, 담당자명(기업회원의 경우), 이메일 주소, 휴대전화번호, 가입인증정보</p>
                                </li>
                                <li class="mt-25">
                                    <p>2. 소셜 회원가입 시 SNS 연결 및 원활한 서비스 제공을 위해 아래와 같은 정보를 수집합니다.</p>
                                    <p>- 필수 수집 항목: 이름, 소셜 이메일 주소, 소셜 고유 키 값</p>
                                    <p>- 선택 수집 항목: [카카오] 프로필 정보(프로필 사진)</p>
                                    <p>* 선택 수집 항목은 정보를 제공받으나 저장하지 않습니다.</p>
                                </li>
                            </ol>
                        </li>

                        <li class="mt-25">
                            <p>• 수집 및 목적</p>
                            <ol>
                                <li class="mt-25">
                                    <p>1. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p>
                                    <p>콘텐츠 제공, 물품배송 또는 청구서 등 발송, 본인 인증 및 구매, 요금 결제, 요금추심</p>
                                </li>
                                <li class="mt-25">
                                    <p>2. 회원 관리</p>
                                    <p>회원제 서비스 이용에 따른 본인 확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 미성년자 거래 시, 법정대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</p>
                                </li>
                                <li class="mt-25">
                                    <p>3. 마케팅 및 광고에 활용</p>
                                    <p>신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보 전달 (회원의 개인정보를 광고를 의뢰한 개인이나 단체에 제공하지 않습니다.)</p>
                                </li>
                            </ol>
                        </li>

                        <li class="mt-25" style="font-size: 17px; font-weight: 500;">
                            <p>• 보유 및 이용기간</p>
                            <p>원칙적으로 개인정보 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체없이 복구할 수 없는 방법으로 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
                            <ol>
                                <li class="mt-25">
                                    <p>1. 회사의 내부 방침에 의하여 일정기간 정보를 보관하여, 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</p>
                                    <p>ㆍ보존 이유 : 부정 이용 방지, 서비스 이용 기간 및 요금 관련 분쟁 해결</p>
                                    <p>ㆍ보존 기간 : 회원 탈퇴 완료일로부터 1년</p>
                                </li>
                                <li class="mt-25">
                                    <p>2. 상법, 전자상거래등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</p>
                                    <ul class="mt-25">
                                        <li>
                                            <p>- 계약 또는 청약철회 등에 관한 기록</p>
                                            <p>ㆍ보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률</p>
                                            <p>ㆍ보존 기간 : 5년</p>
                                        </li>
                                        <li>
                                            <p>- 대금결제 및 재화 등의 공급에 관한 기록</p>
                                            <p>ㆍ보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률</p>
                                            <p>ㆍ보존 기간 : 5년</p>
                                        </li>
                                        <li>
                                            <p>소비자의 불만 또는 분쟁처리에 관한 기록</p>
                                            <p>ㆍ보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률</p>
                                            <p>ㆍ보존 기간 : 3년</p>
                                        </li>
                                        <li>
                                            <p>방문에 관한 기록(서비스 이용기록, 접속로그, 접속 IP 정보)</p>
                                            <p>ㆍ보존 이유 : 통신비밀보호법</p>
                                            <p>ㆍ보존 기간 : 3개월</p>
                                        </li>
                                    </ul>
                                </li>
                                <li class="mt-25">
                                    <p>회원은 개인정보 수집 및 이용 동의를 거부할 권리가 있습니다. 다만 개인정보 수집 및 이용 동의를 거부하실 경우, 서비스 이용이 제한되거나 불가할 수 있습니다.</p>
                                </li>
                            </ol>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-10">
                    <label class="checkbox_wrap">
                        <div style="display: flex; flex-direction: column">
                            <div>
                                <input id="ad_type" class="_checkbox" type="checkbox" onchange="on_change_agree_checkbox()">
                                마케팅 활용 및 광고성 정보 수신에 동의합니다.
                                <span class="optional">(선택)</span>
                            </div>
                        </div>
                    </label>
                </div>
                <div class="body d-flex col-sm-12 col-md-2" style="align-self: flex-start">
                    <button type="button" class="detail_link" id="marketingAgreeToggleButton">상세보기 <i class="far fa-chevron-down"></i><i class="far fa-chevron-up"></i></button>
                </div>
                <div id="marketingAgreeToggleLine" style="width: 100%; height: 1px; background-color: #e4e4e4; margin-top: 10px;">
                </div>
                <div id="marketingAgreeTable" class="marketing_agree_table">
                    <table class="w-table type2">
                        <colgroup>
                            <col style="width:33.333%">
                            <col style="width:33.333%">
                            <col style="width:33.333%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>수집 항목</th>
                            <th>수집 및 이용 목적</th>
                            <th>이용 기간</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                필수 동의 사항에서 개인 정보 수집/이용에 동의한 모든 항목 및 이를 조합하여 생성된 정보
                            </td>
                            <td>
                                신규 서비스 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계 및 이벤트 등 광고성 정보
                                전달
                            </td>
                            <td>
                                동의 철회 시 또는 광고성 정보 수신 동의일로부터 2년
                            </td>
                        </tr>
                        <tr>
                            <td>
                                쿠키, 기기/브라우저 관련 데이터, IP 주소, 사이트/앱 활동
                            </td>
                            <td>
                                잠재고객 생성 및 리마케팅 목적의 광고 제공
                            </td>
                            <td>
                                정보수집일로부터 38개월
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="color-blue">회원은 선택 항목의 개인정보 수집 및 이용 동의를 거부할 수 있으며, 거부하더라도 회원 가입 및 서비스
                                이용에는 제한이 없습니다.
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="w-list dot no_child">
                <li>14세 미만은 회원 가입이 제한됩니다.</li>
            </div>
        </div>
        <!--  -->

        <div class="join_button_wrap" id="join_button_wrap">
            <button type="button" class="button">가입하기</button>
        </div>
        <a href="https://customer.gabia.com/ask/mail#/" class="w-white-text" target="_blank">
        <div class="mailinquiry">
            <span>메일로 문의하기</span><img src="https://static.gabia.com/responsive/assets/images/accounts/icon_floting_email.svg" alt="">
        </div>
    </a>
</form></div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <script type="text/JavaScript" src="./my-script.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>