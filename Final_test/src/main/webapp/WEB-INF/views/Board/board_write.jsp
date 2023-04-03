<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>업무 게시판 - write</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jkKim/css/all.css" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

<!-- 임시 css링크 -->

</head>
<body>
	<jsp:include page="../Main/header.jsp" />

	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
		<div class="container text-center py-5">
			<h1 class="display-4 text-white animated slideInDown mb-3">업무게시판</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb justify-content-center mb-0">
					<li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
					<li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
					<li class="breadcrumb-item text-primary active" aria-current="page">Our
						Team</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->


	<div class="container mt-5">
		<form action = "${pageContext.request.contextPath}/board/add" method="post" enctype="multipart/form-data" name="boardform">
		<h2 class="text-center mb-5">업무 게시판</h2>
		 
			<div class="form-group">
				<label for="board_subject">제목</label>
				 <input	name="BOARD_SUBJECT" id="board_subject"  maxlength="50" class="form-control"  placeholder="제목">
			</div>
			
			<div class="form-group">
				<label for="board_password">비밀번호</label>
				 <input	type="password" class="form-control" id="board_pass" name="BOARD_PASS">
			</div>

			
			<div class="form-group">
				<label for="board_dept" class="col-sm-2 col-form-label">DEPT
				<input type="text" class="form-control" id="board_dept" name="BOARD_DEPT"/>
				</label> 
			
			
			
				<label for="board_job" class="col-sm-2 col-form-label">직책 
				<input type="text" class="form-control" id="board_job" name="BOARD_JOB">
				</label>
			
			
			
				 <label for="board_name" class="col-sm-2 col-form-label">이름
				 <input	type="text" class="form-control" id="board_name" name="BOARD_NAME">
				 </label>
			
			
			
				 <label for="notice" class="col-sm-2 col-form-label">게시물 유형
				 <input	type="hidden" class="form-control" id="board_notice" name="BOARD_NOTICE">
  				 	
						<button class="btn btn-secondary dropdown-toggle" type="button"  id="dropdownMenuButton" data-bs-toggle="dropdown" 	aria-expanded="false">일반게시물</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" onclick="select('일반게시물')">일반게시물</a></li>
								<li><a class="dropdown-item" onclick="select('공지사항')">공지사항</a></li>
							</ul>
					
				</label>
			</div>
			
			
			
			<div class="form-group">
			<label for="board_content" class="form-label">내용</label>
			<textarea class="form-control" id="board_content" name="BOARD_CONTENT" rows="5"></textarea>
			</div>
			
			<div class="form-group">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-secondary">취소</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>

	<!-- Bootstrap JavaScript -->
	
<script src = "${pageContext.request.contextPath}/jkKim/js/writeform.js"></script>
<script>
function select(con) {
		var val = con.innerText;
		var hidden = document.querySelector('#board_notice');
		hidden.value = val;
}
</script>
</body>
</html>