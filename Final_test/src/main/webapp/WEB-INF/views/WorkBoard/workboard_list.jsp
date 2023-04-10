<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크보드 게시판</title>

	<jsp:include page="../Main/header.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/Kimsj/js/workboard.js"></script>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/fa-5/css/all.css" />  	
	<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/bootstrap-4/css/bootstrap.min.css" />  -->
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
		.pl{
		    width: 200px;
		    border: 1px solid #C4C4C4;
		    box-sizing: border-box;
		    border-radius: 10px;
		    padding: 12px 13px;
		    font-family: 'Roboto';
		    font-style: normal;
		    font-weight: 400;
		    font-size: 14px;
		    line-height: 16px;
		}
		
		.pl:focus{
		    border: 1px solid #9fdaff;
		    box-sizing: border-box;
		    border-radius: 10px;
		    outline: 3px solid #d2eeff;
		    border-radius: 10px;
		}
		.navbar .navbar-nav .nav-link {
		    color: #FFFFFF;
		}

	</style>
	
	<script>
	let result="${result}";
	if(result == 'passFail') {
		alert("비밀번호가 일치하지 않습니다.")
	}
	$(function(){
		$("form[action=delete]").submit(function() {
			if($("#board_pass").val() == '') {
				alert("비밀번호를 입력하세요");
				$("#board_pass").focus();
				return false;
			}
		})
	})
	</script>
	
	
</head>
<body>
<input type="hidden" id="login_id" value="${EMPNO}" name="loginid"> <%-- view.js에서 사용하기 위해 추가합니다. --%>
<input type="hidden" id="login_name" value="${NAME}" name="loginname">
<input type="hidden" id="login_dept" value="${DEPT}" name="logindept">
<input type="hidden" id="login_img" value="${PROFILE_FILE}" name="loginimg">
	<div class="container" style="margin-top:150px !important;">

		<div class="row">

			<div class="col-lg-9 col-12"> <!-- 왼쪽 row -->
				
				<div id="workboard_view">

					<h3>워크보드 게시판</h3>
					

										
					<div class="table-responsive  mt-4">
						<table class="table">	
							<tbody>
								<tr>					
									<th style="width:120px;">카테고리</th>
									<td>
										<select name="category" id="category" class="pl">
								            <option value="0" selected>선택해주세요</option>
								            <option value="list">홍보팀</option>
								            <option value="list">개발팀</option>
								            <option value="list">인사팀</option>
								            <option value="list">기획팀</option>
								            <option value="list">동호회</option>
								        </select>
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td>
										<input name="SUBJECT" id="subject" type="text" maxlength="100"
				    	   					class="form-control" placeholder="제목을 입력해주세요">			
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td>
										<textarea name="CONTENT" id="content" 
				    		 				cols="67" rows="5" class="form-control" placeholder="내용을 입력해주세요"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button id="write"  class="btn btn-info float-right" style="background-color:#1ca7ff; border-color:#1ca7ff; color:white;">등록</button>
				  						<button type=reset class="btn btn-danger">취소</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		
			
						<hr class="border-danger mb-4 mt-4" />
						
						
					<div id="workboard_card">
						<table class="table table-striped">	
							<tbody>	
							
							</tbody>
						</table>
					</div>
					
				<!--	<hr class="border-danger mb-4 mt-4" />
					
					
					<div id="workboard_card">
						<table class="table table-striped">	
							<tbody>	
							<div class="card">
							  <div class="card-header">
							    제목
							  </div>
							  <div class="card-body">
							    <div class="row">
									<div class="col-sm-2">
									  	<a href="#">
									  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
									  	</a>
									  	<h6 class="mt-2"><a href="#">this.empno</a></h6>
									  	<small class="text-muted">this.name</small>
									 </div>
									  <div class="col-sm-9 border-left border-secondary">
									    <p>this.content</p>
									  </div>
								</div>
							  </div>
							  <div class="card-footer text-muted">
							  	this.reg_date + img
							  </div>
							</div>
							</tbody>
						</table>
					</div>
							
			
			
						<hr class="border-danger mb-4 mt-4" />
			
					
						<div class="card">
						  <div class="card-header">
						    제목
						  </div>
						  <div class="card-body">
						    <div class="row">
								<div class="col-sm-2">
								  	<a href="#">
								  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
								  	</a>
								  	<h6 class="mt-2"><a href="#"></a></h6>
								  	<small class="text-muted">122309</small>
								 </div>
								  <div class="col-sm-9 border-left border-secondary">
								    <p>내용</p>
								  </div>
							</div>
						  </div>
						</div>
				 -->
			
				</div> <%-- workboard_card end --%>			
			
			</div> <%-- 왼쪽 row end --%>

			<div class="col-lg-3 col-12" >  <%-- 오른쪽 row --%>

			
					<div class="list-group mb-4 shadow" style="margin-top:550px !important;">
						<li class="list-group-item list-group-item-info" style="background-color:#90d5ff; color: #000000; font-size: smaller;"><strong>카테고리</strong></li>
						<a href="discussion-detail.html" class="list-group-item list-group-item-action">홍보팀</a>
						<a href="discussion-detail.html" class="list-group-item list-group-item-action">개발팀</a>
						<a href="discussion-detail.html" class="list-group-item list-group-item-action">인사팀</a>
						<a href="discussion-detail.html" class="list-group-item list-group-item-action">기획팀</a>
						<a href="discussion-detail.html" class="list-group-item list-group-item-action">영업팀</a>
						<a href="discussion-detail.html" class="list-group-item list-group-item-action">동호회</a>
					</div>	
			
						
			</div>  <%-- 오른쪽 row end --%>	

		</div>  <%-- low end --%>
	</div>  <%-- container end --%>

<jsp:include page="../Main/footer.jsp"/>
	
</body>
</html>