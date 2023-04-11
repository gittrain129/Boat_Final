<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<title>BOAT - 회원 정보/권한 수정</title>
 	<jsp:include page="../Main/headertag.jsp"/>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/joinForm.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/jkKim/js/adminForm.js"></script>
 	
 	<meta name="_csrf" content="${_csrf.token }">
  	<meta name="_csrf_header" content="${_csrf.headerName }">
 	
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
    <form class="join_2022_box" name="joinform" action="modify_process" method="post" enctype="multipart/form-data" name="boardform">
        <h2 class="page_title fw-bold">회원 정보/권한 수정</h2>
        <div class="login_info_wrap">
            <h3 class="sub_title fs-5 text fw-bold">회원 정보</h3>
            
            
            <!-- 사진 -->
            <div class="profile">
			<c:set var="profile_src" value="${memberlist[0].PROFILE_FILE.replaceAll('\\\\\\\\', '/')}" />
			  	<label for="upfile" class="bF7skra2CCu8uPGJJ3Jw pe-auto" style="background-image: url(/boat/resources/${profile_src}); background-size: cover; cursor:pointer;">
            		<img alt="profile" class="bF7skra2CCu8uPGJJ3Jw" style="display:none; cursor:pointer;" src="${memberlist[0].PROFILE_FILE }">	
		 	  	  	<svg width="36" height="36" fill="none" class="g68VV5Ghc0ymGpbFWhEx">
				          	<circle cx="18" cy="18" r="18" fill="#000"></circle>
				          	<path d="M11.375 22.658v2.969h2.969l8.756-8.756-2.97-2.969-8.755 8.756zm14.02-8.083a.788.788 0 000-1.116l-1.852-1.852a.788.788 0 00-1.116 0l-1.45 1.448 2.97 2.97 1.448-1.45z" fill="#fff"></path>
			           </svg>
		 	  	</label>
	            <input type="file" name="uploadfile" id="upfile" accept="image/.jpg, .jpeg, .png, .gif" hidden="">
            </div>
            <div class="body col-sm-12 col-md-12 text-center mb-2">
				<button type="button" id="profilebtn" class="btn btn-outline-primary w-25" onclick="onClickUpload();">프로필사진 등록</button>
	        </div>
            <div id="validationServerUsernameFeedback7" class="invalid-feedback fw-bold ps-0 text-center">
				프로필 사진을 등록해 주세요
			</div>
            
            <!-- 입력 -->
            <!-- 부서명 -->
            <div class="row row-container align-items-center mt-3">
                <div class="head col-sm-12 col-md-3 fw-bold">부서명</div>
                
                <div class="body col-sm-12 col-md-9">
  					<select class="col-sm-12 col-md-9 form-select" aria-label="Default select example" name="DEPT" id="deptSelect">
					  <option selected>${memberlist[0].DEPT}</option>
					  <option value="홍보팀">홍보팀</option>
					  <option value="개발팀">개발팀</option>
					  <option value="인사팀">인사팀</option>
					  <option value="기획팀">기획팀</option>
					  <option value="영업팀">영업팀</option>
					</select>
                </div>
                <div id="validationServerUsernameFeedback" class="invalid-feedback fw-bold">
			        부서명을 선택해 주세요
			    </div>
            </div>
            
            <!-- 사원번호 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3 fw-bold">사원번호</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="text" name="EMPNO" placeholder="부서명을 선택하면 사원번호가 자동 생성됩니다"  value = "${memberlist[0].EMPNO }"class="input-empno _input" id="_label-id" readOnly>
                </div>
                <div id="validationServerUsernameFeedback2" class="invalid-feedback fw-bold">
			        부서명을 선택해 주세요
			    </div>
            </div>
            
            <!-- 비번 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3 fw-bold">비밀번호
                </div>
                <div class="body col-sm-12 col-md-9">
                    <input type="password" name="PASSWORD" class="_input" autocomplete="off" placeholder="6~16자 / 문자, 숫자, 특수 문자 모두 혼용 가능"
                    	    id="_label-pwd" maxlength="16" value="${memberlist[0].PASSWORD_OG }">
                	<i class= "fa fa-solid fa-eye-slash" ></i>
                </div>
                <div id="validationServerUsernameFeedback3" class="invalid-feedback fw-bold">
			        영문, 숫자, 특수 문자 6~16자리로 입력해 주세요
			    </div>
            </div>
            
            <!-- 비번확인 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3 fw-bold">비밀번호 확인</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="password" name="user_pwd2" autocomplete="off" placeholder="비밀번호를 다시 입력해 주세요" 
                    	   id="_label-pwd-ck" class="_input" maxlength="16">
                	<i class= "fa fa-solid fa-eye-slash" ></i>
                </div>
                <div id="validationServerUsernameFeedback4" class="invalid-feedback fw-bold">
			        비밀번호와 동일하게 입력해 주세요
			    </div>
            </div>
            
            <!-- 이름 -->
            <div class="row row-container align-items-center">
                <div class="head col-sm-12 col-md-3 fw-bold">이름</div>
                <div class="body col-sm-12 col-md-9">
                    <input type="text" name="NAME" placeholder="이름을 입력해 주세요" class="input-id _input" id="_label-name"
                    		value="${memberlist[0].NAME }">
                </div>
                <div id="validationServerUsernameFeedback5" class="invalid-feedback fw-bold">
			        이름을 입력해 주세요
			    </div>
            </div>
            
            <!-- 메일 -->
	            <div class="row row-container align-items-center">
	                <div class="head col-sm-12 col-md-3 fw-bold">메일</div>
	                <div class="body col-sm-12 col-md-9">
	                    <input type="email" name="EMAIL" placeholder="이메일을 입력해주세요" class="_input" id="email" value="${memberlist[0].EMAIL}" readonly>
	                </div>
	                <div id="validationServerUsernameFeedback6" class="invalid-feedback fw-bold">
				        올바른 이메일을 입력해주세요
				    </div>
				    
	            </div>
            
			<div class="row row-container align-items-center">
				 	<div class="head col-sm-12 col-md-3 fw-bold">부서장 설정</div>
    		<div class="body col-sm-12 col-md-9">
    				
        			<div class="form-check form-switch">
    				<input class="form-check-input" type="checkbox" id="mgrSwitch" name="AUTH" value="ROLE_MGR" ${memberlist[0].AUTH == 'ROLE_MGR' ? 'checked' : ''}>
    				<label class="form-check-label" for="mgrSwitch">MGR</label>
					</div>
        			
   			 </div>
			</div>
		
       

        <div id="form-controls">
        	<button type="submit"  class="submit btn-primary btn py-3 px-5 w-100 fw-bold fs-5 text" disabled>가입하기</button>
        </div>
        
        </div>
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
        
		
		
        
  </div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <script type="text/JavaScript" src="./my-script.js"></script>
  <script>
  $(document).ready(function() {
    var deptValue = $('#deptSelect').val();
    $('label[for="mgrSwitch"]').text(deptValue +' 팀장');
  });
  
 $('label[for="mgrSwitch"]').text($("#deptSelect option:selected").val()+' 팀장');
  
  // select 태그의 change 이벤트를 감지하여 label 태그의 내용을 업데이트
  $("#deptSelect").change(function() {
    $('label[for="mgrSwitch"]').text($(this).find("option:selected").val()+ ' 팀장');
  });
  
  const mgrSwitch = document.getElementById("mgrSwitch");
  mgrSwitch.addEventListener("change", () => {
    const submitBtn = document.querySelector(".submit");
    if (mgrSwitch.checked) {
      submitBtn.disabled = false;
      mgrSwitch.value = "ROLE_MGR";
    } else {
      
      mgrSwitch.value = "ROLE_MEMBER";
    }
  });
  
  
</script>
  <jsp:include page="../Main/footer.jsp" />
  <script>
  </script>
 </body>
</html>