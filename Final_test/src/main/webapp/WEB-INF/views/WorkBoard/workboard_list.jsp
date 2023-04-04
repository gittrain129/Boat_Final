<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크보드 게시판</title>

	<jsp:include page="../Main/header.jsp"/>
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
		 const btn = document.querySelector('.pl on');
		    const list = document.querySelector('.listbox');
		    btn.addEventListener('click', () => {
		        list.classList.toggle('on');
		    });
		    list.addEventListener('click', (event) => {
		        if (event.target.nodeName === "BUTTON") {
		            btn.innerText = event.target.innerText;
		            list.classList.remove('on');
		        }
		    });
	</script>
	
	
</head>
<body>

	<section class="container" style="margin-top:150px !important;">
	<div class="row">
		<div class="col-lg-9 col-12">
		
	<div class="container">
	   <form action="add" method="post" enctype="multipart/form-data" name="boardform">
	
		<h3>워크보드 게시판</h3>
		<hr class="border-secondary mb-4" />
			
		
		<div class="table-responsive  mt-4">
			<table class="table">
				<tbody>
					<tr>					
						<th></th>
						<td>
							
						</td>
					</tr>
					<tr>					
						<th style="width:120px;">카테고리</th>
						<td>
							<select name="likeLanguage" id="" class="pl">
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
							<input name="BOARD_SUBJECT" id="board_subject" type="text" maxlength="100"
	    	   					class="form-control" placeholder="제목을 입력해주세요">			
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="BOARD_CONTENT" id="board_content" 
	    		 				cols="67" rows="5" class="form-control" placeholder="내용을 입력해주세요"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type=submit class="btn btn-primary" style="background-color:#1ca7ff; border-color:#1ca7ff;">등록</button>
	  						<button type=reset class="btn btn-danger">취소</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	  </form>
	</div>
		
			
		<tbody>
		    <c:set var="num" value="${listcount-(page-1)*limit}"/>
		    <c:forEach var="b" items="${boardlist}">
		      <tr>

		         <td><%-- 제목 --%>
		         	<div>
		         		<c:if test="${b.BOARD_RE_LEV == 0}"> <%-- 원문인 경우 --%>
		         			&nbsp;
		         		</c:if>
		         		
		         		<a href="detail?num=${b.BOARD_NUM}">
		         			  <c:out value="${b.BOARD_SUBJECT}" escapeXml="true"/><%-- escapeXml="true" : HTML 태그를 화면에 그 --%>
		         			  <span class="gray small">[<c:out value="${b.CNT}"/>]</span> <%-- excapeXml="ture" : HTML 태그를 화 --%>
		         		</a>
		         	</div>
		         </td>
		         <td><div>${b.BOARD_NAME}</div></td>
		         <td><div>${b.BOARD_DATE}</div></td>
		         <td><div>${b.BOARD_READCOUNT}</div></td>
		        </tr>
		       </c:forEach>
		    </tbody>
		
		<hr class="border-danger mb-4 mt-4" />
	
	<tbody>
	    <c:set var="num" value="${listcount-(page-1)*limit}"/>
	    <c:forEach var="b" items="${boardlist}">
	    	
			<div class="card">
			  <div class="card-header">
			    <td><%-- 제목 --%>
		         	<div>
		         		<c:if test="${b.BOARD_RE_LEV == 0}"> <%-- 원문인 경우 --%>
		         			&nbsp;
		         		</c:if>
		         		
		         		<a href="detail?num=${b.BOARD_NUM}">
		         			  <c:out value="${b.BOARD_SUBJECT}" escapeXml="true"/><%-- escapeXml="true" : HTML 태그를 화면에 그 --%>
		         			  <span class="gray small">[<c:out value="${b.CNT}"/>]</span> <%-- excapeXml="ture" : HTML 태그를 화 --%>
		         		</a>
		         	</div>
		         </td>
			  </div>
			  <div class="card-body">
			    <div class="row">
					<div class="col-sm-2">
					  	<a href="#">
					  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
					  	</a>
					  	<h6 class="mt-2"><a href="#"><td><div>${b.BOARD_NAME}</div></td></a></h6>
					  	<small class="text-muted">122309</small>
					 </div>
					  <div class="col-sm-9 border-left border-secondary">
					    <p>내용</p>
					  </div>
				</div>
			  </div>
			  <div class="card-footer text-muted">
			  	2일 전
			  </div>
			</div>
		</c:forEach>
	</tbody>

		
		<hr class="border-danger mb-4 mt-4" />
		
	
	<tbody>
	    <c:set var="num" value="${listcount-(page-1)*limit}"/>
	    <c:forEach var="b" items="${boardlist}">
	    	
			<div class="card">
			  <div class="card-header">
			    <td><%-- 제목 --%>
		         	<div>
		         		<c:if test="${b.BOARD_RE_LEV == 0}"> <%-- 원문인 경우 --%>
		         			&nbsp;
		         		</c:if>
		         		
		         		<a href="detail?num=${b.BOARD_NUM}">
		         			  <c:out value="${b.BOARD_SUBJECT}" escapeXml="true"/><%-- escapeXml="true" : HTML 태그를 화면에 그 --%>
		         			  <span class="gray small">[<c:out value="${b.CNT}"/>]</span> <%-- excapeXml="ture" : HTML 태그를 화 --%>
		         		</a>
		         	</div>
		         </td>
			  </div>
			  <div class="card-body">
			    <div class="row">
					<div class="col-sm-2">
					  	<a href="#">
					  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
					  	</a>
					  	<h6 class="mt-2"><a href="#"><td><div>${b.BOARD_NAME}</div></td></a></h6>
					  	<small class="text-muted">122309</small>
					 </div>
					  <div class="col-sm-9 border-left border-secondary">
					    <p>내용</p>
					  </div>
				</div>
			  </div>
			  <div class="card-footer text-muted">
			  	2일 전
			  </div>
			</div>
		</c:forEach>
	</tbody>
			
				
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
				  	<h6 class="mt-2"><a href="#">아이디</a></h6>
				  	<small class="text-muted">122309</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>내용</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2일 전
		  </div>
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
				  	<h6 class="mt-2"><a href="#">아이디</a></h6>
				  	<small class="text-muted">122309</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>내용</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2일 전
		  </div>
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
				  	<h6 class="mt-2"><a href="#">아이디</a></h6>
				  	<small class="text-muted">122309</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>내용</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2일 전
		  </div>
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
				  	<h6 class="mt-2"><a href="#">아이디</a></h6>
				  	<small class="text-muted">122309</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>내용</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2일 전
		  </div>
		</div>
		
		
		
		<hr class="border-danger mb-4 mt-4" />
		
		
	
	</div>

	<div class="col-lg-3 col-12" >
	<div class="list-group mb-4 shadow" style="margin-top:550px !important;">
		<li class="list-group-item list-group-item-info" style="background-color:#90d5ff; color: #000000; font-size: smaller;"><strong>카테고리</strong></li>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">홍보팀</a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">개발팀</a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">인사팀</a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">기획팀</a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">영업팀</a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">동호회</a>
	</div>
	
	
</div>	
	</div>
</section>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/sceditor/minified/themes/default.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/sceditor/minified/sceditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/sceditor/minified/formats/bbcode.js"></script>


	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/bootstrap-4/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/workboard_lib/bootstrap-4/js/popper.min.js"></script>
	
	<jsp:include page="../Main/footer.jsp"/>
	
</body>
</html>