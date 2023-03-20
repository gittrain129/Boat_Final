<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>업무 게시판 - write</title>
<link rel="stylesheet" type="text/css" href="jkKim/css/all.css" />
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
 
 <!-- 임시 css링크 -->
 <link rel="stylesheet" href="jkKim/css/writeform.css">

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
                    <li class="breadcrumb-item text-primary active" aria-current="page">Our Team</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container mt-5">
		<h2 class="text-center mb-5">업무 게시판</h2>
		<form>
			<div class="mb-3">
				<label for="subject" class="form-label">제목</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="password" name="password">
			</div>
			
			
<div class="mb-3 row">

  <label for="team" class="col-sm-2 col-form-label">Team
  <div class="col-sm-4">
    <input type="text" class="form-control" id="team" name="team">
  </div>
  </label>
  
  <label for="team" class="col-sm-2 col-form-label">직책
  <div class="col-sm-4">
    <input type="text" class="form-control" id="position" name="position">
  </div>
  </label>
  
   <label for="team" class="col-sm-2 col-form-label">이름
  <div class="col-sm-4">
    <input type="text" class="form-control" id="name" name="name">
  </div>
  </label>
 
 
  <label for="team" class="col-sm-2 col-form-label">게시물 유형
  <div class="col-sm-2">
    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        일반게시물
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="#">일반게시물</a></li>
        <li><a class="dropdown-item" href="#">공지사항</a></li>
        
      </ul>
    </div>
  </div>
  </label>
  
</div>



			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" id="content" name="content" rows="5"></textarea>
			</div>
			<div class="mb-3">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">취소</button>
			</div>
		</form>
	</div>
	
	<!-- Bootstrap JavaScript -->

</body>
</html>