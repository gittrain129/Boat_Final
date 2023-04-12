<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	

	
	
</head>
<body>
<input type="hidden" id="login_id" value="${EMPNO}" name="loginid"> <%-- view.js에서 사용하기 위해 추가합니다. --%>
<input type="hidden" id="login_name" value="${NAME}" name="loginname">
<input type="hidden" id="login_dept" value="${DEPT}" name="logindept">
<input type="hidden" id="login_img" value="${pageContext.request.contextPath}/resources/${PROFILE_FILE}" name="loginimg">
	
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">워크보드</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                	<li class="breadcrumb-item active"><a href="javascript:go(1,'전체보기')">전체보기</a></li>
                	<li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'자유')">자유</a></li>
                	<li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'홍보팀')">홍보팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'개발팀')">개발팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'인사팀')">인사팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'기획팀')">기획팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'영업팀')">영업팀</a></li>
                	<li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'동호회')">동호회</a></li>
                	<li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'취미')">취미</a></li>
                </ol>
            </nav>
        </div>
    </div>
	
	<div class="container" style="margin-top:150px !important;">


				
				<div id="workboard_view" style="width: 1000px; margin: auto;">

					<h3>워크보드 게시판</h3>
					

										
					<div class="table-responsive  mt-4">
						<table class="table">	
							<tbody>
								<tr>					
									<th style="width:120px;">카테고리</th>
									<td>
										<select name="category" id="category" class="pl">
								            <option value="0" selected>선택해주세요</option>
								            <option value="list">자유</option>
								            <option value="list">홍보팀</option>
								            <option value="list">개발팀</option>
								            <option value="list">인사팀</option>
								            <option value="list">기획팀</option>
								            <option value="list">영업팀</option>
								            <option value="list">동호회</option>								            
								            <option value="list">취미</option>
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
				  						<button id="cancle" type=reset class="btn btn-danger">취소</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		
			
						
						
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
			

	</div>  <%-- container end --%>

<jsp:include page="../Main/footer.jsp"/>
	
</body>
</html>