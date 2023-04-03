<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 	<link href="${pageContext.request.contextPath}/resources/ejyang/css/myinfo.css" type="text/css" rel="stylesheet">
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/ejyang/js/myinfo.js"></script>
 	<jsp:include page="../Main/header.jsp" />
 	<style>
 		.mail_input {
		    height: 60px;
		    width: 100%;
		    font-size: 1rem;
		    border: none;
		    outline: none;
		    border-bottom: 1px solid #009CFF;
		}
		
 		._input {
		    height: 60px;
		    width: 100%;
		    font-size: 1rem;
		    border: none;
		    outline: none;
		    border-bottom: 1px solid #cdcdcd;
		}
		
		._input:focus {
			border-color: #009CFF;
		}
		
		.profileimg {
		    position: relative;
		    width: 124px;
		    height: 124px;
		    border-radius: 50%;
		    border: 0;
		    background: none;
		    margin-bottom: 20px;
		}
		.profileimg2 {
		    position: absolute;
		    width: 124px;
		    height: 124px;
		    right: 0;
		    bottom: 0;
		    border-radius: 50%;
		}
		
		.head + .body {
			margin-bottom: 5px;
		}
		.head + .body select {
			height: 50px;
			border: none;
			border-bottom: 1px solid #cdcdcd;
			border-radius: 0px;
			padding-left: 2px;
		}
		
		.body select:focus {
			outline: none;
			border-color: #009CFF;
			box-shadow: none;
		}
		
		.password .fa-eye, .password .fa-eye-slash{
		    position: absolute;
		    left: 79%;
		    cursor: pointer;
		    color: rgb(184, 184, 184);
		    top: 996px;
		    font-size: 20px;
		}

		.password_ck .fa-eye, .password_ck .fa-eye-slash{
		    position: absolute;
		    left: 79%;
		    cursor: pointer;
		    color: rgb(184, 184, 184);
		    top: 1061px;
		    font-size: 20px;
		}
 	</style>
 	<script>
 		$(function(){
 			//부서명
 			let department = '${memberinfo.DEPT}'
 			console.log(department)
 				
 			let part = 1;
 			switch(department){
 				case '개발팀':
 					part=2;
 					break;
 				case '인사팀':
 					part=3;
 					break;
 				case '기획팀':
 					part=4;
 					break;
 				case '영업팀':
 					part=5;
 					break;
 			}
 			$('#dept-select option:nth-child('+part+')').prop('selected',true)
 		})
 	</script>
 </head>
 <body>
<div class="gt-relative">
   <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">My BOAT</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                	<!-- 
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page">Our Team</li>
                     -->
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    <div class="container">
      <div class="row">
        <div class="col">
         
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">회원 정보</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">회원 탈퇴</a>
              </li>
             	
              
             
             </ul> 
            
            
            
            
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                <div id='calendar'></div>
              </div>
              <div class="tab-pane fade" id="zxc">
					<div id='calendar'></div>
              </div>
        </div>
      </div>
    </div>
  </div>
  
  
  
  	<!-- 내용 -->
    <div class="container">
	  <div class="row" style="margin-top: 30px;">
	  
	    <!-- 왼쪽 -->
	    <div class="col border-end mt-5">
	      <div class="left ps-3 pe-3">
			<div class="containers">
				<div class="gt-mb-15">
					<span class="text-dark" style="font-size:3rem;">${memberinfo.EMPNO} / ${memberinfo.JOB}</span> 
					<span class="fs-3 text-dark ms-4">${memberinfo.NAME}</span> 
				</div>
			</div> 
			
			<!----> 
			<div class="mt-5 row">
				<div class="title-area col-sm-12 col-md-3 pt-3">
					<i class="fas fa-chevron-right text-dark"></i> 
					<span class="title fs-5 text-dark">메일</span> <!----> 
				</div> 
				<div class="body col-sm-12 col-md-7 ">
	            	<input type="email" name="EMAIL" class="mail_input" id="email" value="${memberinfo.EMAIL}" 
	                    	readonly>
	            </div>
			</div> 
			
			
			<!----> 
			<div class="mt-5">
				<div class="title-area">
					<i class="fas fa-chevron-right text-dark"></i> 
					<span class="title fs-5 text-dark">SNS 연동</span> <!----> 
				</div> 
				<div class="mt-3">
					<table class="table">
						<thead class="table-light">
							<tr>
								<th class="text-center">구분</th> 
								<th class="text-center">연동</th>
							</tr> 
						</thead>
						<colgroup>
							<col width="75%"><col>
						</colgroup> 
						<tbody>
							<!-- 구글 --> 
			                <tr>
			                	<td class="pb-0 pt-3 ps-3">구글
			                	  <c:if test="${memberinfo.GOOGLELOGIN == null}">
			                    		<p></p>
			                      </c:if>
			                      <c:if test="${memberinfo.GOOGLELOGIN != null}">
			                    		<p>${memberinfo.REGISTER_DATE} 연동 완료</p>
			                      </c:if>
			                    </td>
			                    <td class="text-center align-middle">
			                    	<c:if test="${memberinfo.GOOGLELOGIN == null}">
			                    		<span>비연동</span>
			                    	</c:if>
			                    	<c:if test="${memberinfo.GOOGLELOGIN != null}">
			                    		<span>연동</span>
			                    	</c:if>
			                    </td>
			                </tr>
			                
							<!-- 네이버 --> 
							<tr>
								<td class="pb-0 pt-3 ps-3">네이버
			                      <c:if test="${memberinfo.NAVERLOGIN == null}">
			                    		<p></p>
			                      </c:if>
			                      <c:if test="${memberinfo.NAVERLOGIN != null}">
			                    		<p>${memberinfo.REGISTER_DATE} 연동 완료</p>
			                      </c:if>
			                    </td> 
			                    <td class="text-center align-middle">
			                    	<c:if test="${memberinfo.NAVERLOGIN == null}">
			                    		<span>비연동</span>
			                    	</c:if>
			                    	<c:if test="${memberinfo.NAVERLOGIN != null}">
			                    		<span>연동</span>
			                    	</c:if>
			                    </td>
			                </tr> 
			                
			                
			            </tbody>
			       </table>
				</div> 
				
			</div> 
		  </div>
	    </div>
	    
	    <div class="col">
	      <div class="right" style="padding-left: 60px;">
	      	<div class="mt-5">
				<div class="title-area">
					<i class="fas fa-chevron-right text-dark"></i> 
					<span class="title fs-5 text-dark">내 정보</span> <!----> 
				</div> 
				
				<!-- 사진 -->
	            <div class="profile d-flex justify-content-center">
	            	<label for="upfile" class="profileimg text-center" style="background-size: cover; cursor:pointer;">
	            		<img alt="profile" class="profileimg2" style="cursor:pointer;" src="${pageContext.request.contextPath}/${PROFILE_FILE}">	
			 	  	</label>
		            <input type="file" name="uploadfile" id="upfile" accept="image/.jpg, .jpeg, .png, .gif" hidden="">
	            </div>
	            <div class="body col-sm-12 col-md-12 text-center mb-5">
					<button type="button" id="profilebtn" class="btn btn-outline-primary w-25" onclick="onClickUpload();">프로필사진 수정</button>
		        </div>
	            
	            <!-- 부서명 -->
	            <div class="row row-container align-items-center">
	                <div class="head col-sm-12 col-md-3 fw-bold">부서명</div>
	                
	                <div class="body col-sm-12 col-md-8">
		                <select class="col-sm-12 col-md-9 form-select" id="dept-select" name="DEPT">
						  <option value="홍보팀">홍보팀</option>
						  <option value="개발팀">개발팀</option>
						  <option value="인사팀">인사팀</option>
						  <option value="기획팀">기획팀</option>
						  <option value="영업팀">영업팀</option>
						</select>
	                </div>
	            </div>
				
				<!-- 비번 -->
	            <div class="row row-container align-items-center">
	                <div class="head col-sm-12 col-md-3 fw-bold">비밀번호
	                </div>
	                <div class="body col-sm-12 col-md-8 password">
	                    <input type="password" name="PASSWORD" class="_input" autocomplete="off" 
	                    	placeholder="6~16자 / 문자, 숫자, 특수 문자 모두 혼용 가능" id="_label-pwd" maxlength="16"
	                    	value="${memberinfo.PASSWORD_OG}">
	                	<i class= "fa fa-solid fa-eye-slash" ></i>
	                </div>
	                <div id="validationServerUsernameFeedback3" class="invalid-feedback fw-bold">
				        영문, 숫자, 특수 문자 6~16자리로 입력해 주세요
				    </div>
	            </div>
	            
	            <!-- 비번확인 -->
	            <div class="row row-container align-items-center">
	                <div class="head col-sm-12 col-md-3 fw-bold">비밀번호 확인</div>
	                <div class="body col-sm-12 col-md-8 password_ck">
	                    <input type="password" name="user_pwd2" autocomplete="off" 
	                    	placeholder="비밀번호를 다시 입력해 주세요" id="_label-pwd-ck" class="_input" maxlength="16">
	                	<i class= "fa fa-solid fa-eye-slash" ></i>
	                </div>
	            </div>
	            
	            <!-- 이름 -->
	            <div class="row row-container align-items-center">
	                <div class="head col-sm-12 col-md-3 fw-bold">이름</div>
	                <div class="body col-sm-12 col-md-8">
	                    <input type="text" name="NAME" placeholder="이름을 입력해 주세요" class="input-id _input" id="_label-name"
	                    		value="${memberinfo.NAME}">
	                </div>
	                <div id="validationServerUsernameFeedback5" class="invalid-feedback fw-bold">
				        이름을 입력해 주세요
				    </div>
	            </div>
				
			</div>
	      </div>
	    </div>
	    
	    <div id="form-controls" class="d-flex justify-content-center" style="margin: 70px 0 50px 0;">
	      <div class="text-center">
        	<button type="submit" class="submit btn-primary btn py-2 px-3 fw-bold text" style="width:100px;">변경하기</button>
        	<button type="button" class="submit btn-light btn py-2 px-3 fw-bold text ms-1" style="width:100px;">취소</button>
          </div>
        </div>
	    
	    
	  </div>
	</div>

</div>

  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <jsp:include page="../Main/footer.jsp" />
 </body>
</html>