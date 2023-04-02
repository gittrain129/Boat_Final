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
    
    
<div class="container">

 <form action="/confer/add" method="post" enctype = "multipart/form-data" name ="boardform">
 
 	<h1>업무게시판 글쓰기</h1>
     
    <div class="form-group">
        <label for="board_subject">제목</label>
        <input name="board_subject" id="board_subject" type="text" maxlength="100"
        class="form-control" placeholder="제목을 입력하세요">
    </div>
    
    
    <input type ="hidden" name ="empno" value="${member.empno}">
 	

 	<div class="form-group">
         <label for="board_pass">비밀번호</label>
 		<input name="board_pass" id="fileboard_pass" type="password" maxlength="30"
 		class="form-control" placeholder="비밀번호를 입력하세요">
    </div>

    <div class="form-group">
        <label>글쓴이</label><br>
        <div class="btn-group" id = "">
            <button type="button" class="btn btn-secondary" id ="deptsel" >${member.dept}</button>
            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" id = "deptbutton">
            </button>
            
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">홍보팀</a>
                <a class="dropdown-item" href="#">개발팀</a>
                <a class="dropdown-item" href="#">인사팀</a>
                <a class="dropdown-item" href="#">기획팀</a>
                <a class="dropdown-item" href="#">영업팀</a>
              </div>
            </div>
       		<input name="board_name" id="board_name" type="text"  class="form-control writer"
       			placeholder="이름을 입력하세요" value ="${member.name}">
            <input type="hidden" name = "dept" id = "dept" value = "${member.dept}">
  	  </div>
        
    

 	
 		<label for="board_content">내용</label>
 		<textarea name="board_content" id="summernote"  class="form-control"></textarea>
 	
 	

 	
 	<div class="form-group">
 		<button type="submit" class="btn btn-primary">등록</button>
 		<button type="reset" class="btn btn-danger" onclick="history.go(-1)">취소</button>
 	</div>
 </form>
</div><!-- container끝 -->


</body>
</html>