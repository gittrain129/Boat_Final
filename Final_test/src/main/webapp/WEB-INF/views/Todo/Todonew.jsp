<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별근무시간</title>
<jsp:include page="../Main/header.jsp" />
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceBoard.css'/>" /> --%>
<!-- <script src="${path}/resources/js/attendance/board.js" defer ></script> -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/Todonew.css">
  
  
  <%--tab 전환에 필요 bootstrap4 --%>
  <%-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
  
  
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  
  
</head>

<style>

.main-box{
    display: grid;
    grid-template-columns: 1fr; 
    gap: 40px
}

#main-content{
    display: grid;
    grid-template-rows: 1fr 9fr;
    gap: 40px
}

#right-content{
    display: grid;
    grid-template-rows: 1fr 0.7fr 1fr;
    gap: 30px
}

#search-box{
    gap: 10px;
	padding: 20px;
    display: flex;
    width: 100%;
    height: 100%;
    text-align:center;
}
h1{
    color : gray;
}
#search-box{
    display: grid;
   /*  grid-template-columns: 1fr 0.7fr 0.7fr 0.7fr 0.7fr 3fr 1fr 4fr; */
}
#search-box div{
    display: flex;
    justify-content: center;
    align-items: center;
}
#search-font{
    font-size: 1.2em;
    font-weight: 600;
    display: flex;
    justify-content: center;
    align-items: center;
}

#notice-box{
    padding: 40px;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    gap: 15px;
}

#clock{
    padding: 20px;
    display: grid;
    grid-template-rows: 0.5fr 1fr 1.5fr 0.3fr;
    width: 100%;
    height: 100%;
    gap: 15px;
}
#date-box{
    color: var(--main-color-dark);
    font-size: 1.3em;
    font-weight: 200;
    display: flex;
    justify-content: center;
}
#time-box{
    color: var(--main-color-dark);
    font-size: 2.9em;
    font-weight: 500;
    display: flex;
    justify-content: center;
}
#btn-box{
    display: flex;
    justify-content: center;
    gap: 30px;
}
#btn-box > form > .btn{
    width: 120px;
    height: 70px;
    cursor: pointer;
    font-size: 1.7em;
    font-weight: 500;
    border: none;
}
#btn-box > form > .c-btn{
    width: 120px;
    height: 70px;
    cursor: pointer;
    font-size: 1.7em;
    font-weight: 500;
}
#work-week{
    padding: 20px;
    display: grid;
    grid-template-rows: 1fr 1fr 1.5fr 1.5fr;
    width: 100%;
    height: 100%;
    gap: 15px
}
#rest-information{
    padding: 20px;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr;
    width: 100%;
    height: 100%;
    gap: 15px;
}
#result-box{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
#result-box > div{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.4em;
    font-weight: 530;
}
#week-header{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5em;
    font-weight: 500;
}
#select-week{
    display: flex;
    justify-content: center;
    align-items: center;
}
#information-header{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5em;
    font-weight: 500;
}
#work-time, #work-time2{
    display: flex;
    align-items: center;
    font-size: 1em;
    font-weight: 530;
}
#restinfo1, #restinfo2, #restinfo3,#restinfo4,#restinfo5{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
#restinfo2, #restinfo3{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
    background-color: #E2E2E2;
}
#restinfo1{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 65px;
    background-color: #E2E2E2;
}
#restinfo4{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 58px;
    background-color: #E2E2E2;
}
#restinfo5{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 40px;
    background-color: #E2E2E2;
}
#restinfo-title1,#restinfo-title2,#restinfo-title3,#restinfo-title4,#restinfo-title5{
    color: blue;
}
.title-box{
    display: flex;
    align-items: center;
    gap: 20px;
}

.b-title{
    display: flex;
    align-items: center;
    justify-content: center;

    width: 130px;
    padding: 15px;
    border-bottom: 1px solid var(--main-color);
    font-size: 1.5em;
    font-weight: 500;
}

.hilight{
    color: var(--main-color);
}

.header-box{
    padding: 0 50px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.header-box .btn{
    padding-right: 15px;
    width: 100px;
}

.search-bar{
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: var(--bo-20);
    border-radius: 50px;
    padding: 5px 10px;
}

.search-bar input{
    width: 120px;
    height: 15px;
    border: none;
    background: none;
    outline: none;
    font-size: 12px;
    color: var(--bo-80);
}

.search-bar span{
    font-size: 1.3em;
    color: gray;
}

.list-box{
    width: 100%;
    height: 100%;
    align-self: center;
}

.list-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1.5fr 1.5fr 1.5fr;
    height: 6%;
    border-bottom: 1px solid var(--bo-20);
    cursor: pointer;
}
.list-item p{
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.list-item p:not(:nth-of-type(2)){
    justify-content: center;
}
/* .list-item:hover p{
    color: var(--main-color);
} */
.first-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1.5fr 1.5fr 1.5fr ;
    height: 8%;
    border-top: 1px solid var(--bo-80);
    border-bottom: 1px solid var(--bo-80);
    font-size: 1em;
    font-weight: 600;
}
.first-item p{
    display: flex;
    align-items: center;
    justify-content: center;
}

.page-box{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    align-self: center;
}
.page-btn{
    display: flex;
    align-items: center;
    justify-content: center;
    width: 25px;
    height: 25px;
    border-radius: 5px;
    cursor: pointer;
}
.page-btn:hover{
    border: 1px solid var(--main-color);
}
.checked-p-btn{
    background-color: var(--main-color);
    color: white;
}
.page-box span{
    color: var(--bo-60);
    cursor: pointer;
}
.page-box span:hover{
    color: black
}

#date-btn{
    /* padding-right: 15px; */
    width: 100px;
    border: none;
}

.progress {
    margin-left: 25px;
    background-color: #D3D3D3;
    border-radius: 15px;
    height: 20px;
    width: 130px;
}

.progress-bar {
    display: flex;
    align-items: center;
    justify-content: center;
    background-image: repeating-linear-gradient(
    to left,
    #12887A,
    #2fa597,
    #59c0b4);
    box-shadow: 0 5px 5px -6px #12887A, 0 3px 7px #2fa597;
    border-radius: 15px;
    color: #fff;
    height: 100%;
    width: 0;
    transition: 1s ease 0.3s;
}

.project-tab {
    padding: 10%;
    margin-top: -8%;
}
.project-tab #tabs{
    background: #007b5e;
    color: #eee;
}
.project-tab #tabs h6.section-title{
    color: #eee;
}
.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #0062cc;
    background-color: transparent;
    border-color: transparent transparent #f3f3f3;
    border-bottom: 3px solid !important;
    font-size: 16px;
    font-weight: bold;
    margin-bottom : 30px;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 16px;
    font-weight: 600;
}
.project-tab .nav-link:hover {
    border: none;
}
.project-tab thead{
    background: #f3f3f3;
    color: #333;
}
.project-tab a{
    text-decoration: none;
    color: #333;
    font-weight: 600;
    
}
/* 추가 css */
.todocontainer{margin-top : 50px;}
.btn{margin-left : 20px;}
<%-- 아코디언 바디 --%>

.white-bg {
    background-color: #ffffff;
}
.page-heading {
    border-top: 0;
    padding: 0 10px 20px 10px;
}

.forum-post-container .media {
  margin: 10px 10px 10px 10px;
  padding: 20px 10px 20px 10px;
  border-bottom: 1px solid #f1f1f1;
}
.forum-avatar {
  float: left;
  margin-right: 20px;
  text-align: center;
  width: 110px;
}
.forum-avatar .img-circle {
  height: 48px;
  width: 48px;
}
.author-info {
  color: #676a6c;
  font-size: 11px;
  margin-top: 5px;
  text-align: center;
}
.forum-post-info {
  padding: 9px 12px 6px 12px;
  background: #f9f9f9;
  border: 1px solid #f1f1f1;
}
.media-body > .media {
  background: #f9f9f9;
  border-radius: 3px;
  border: 1px solid #f1f1f1;
}
.forum-post-container .media-body .photos {
  margin: 10px 0;
}
.forum-photo {
  max-width: 140px;
  border-radius: 3px;
}
.media-body > .media .forum-avatar {
  width: 70px;
  margin-right: 10px;
}
.media-body > .media .forum-avatar .img-circle {
  height: 38px;
  width: 38px;
}
.mid-icon {
  font-size: 66px;
}
.forum-item {
  margin: 10px 0;
  padding: 10px 0 20px;
  border-bottom: 1px solid #f1f1f1;
}
.views-number {
  font-size: 24px;
  line-height: 18px;
  font-weight: 400;
}
.forum-container,
.forum-post-container {
  padding: 30px !important;
}
.forum-item small {
  color: #999;
}
.forum-item .forum-sub-title {
  color: #999;
  margin-left: 50px;
}
.forum-title {
  margin: 15px 0 15px 0;
}
.forum-info {
  text-align: center;
}
.forum-desc {
  color: #999;
}
.forum-icon {
  float: left;
  width: 30px;
  margin-right: 20px;
  text-align: center;
}
a.forum-item-title {
  color: inherit;
  display: block;
  font-size: 18px;
  font-weight: 600;
}
a.forum-item-title:hover {
  color: inherit;
}
.forum-icon .fa {
  font-size: 30px;
  margin-top: 8px;
  color: #9b9b9b;
}
.forum-item.active .fa {
  color: #1ab394;
}
.forum-item.active a.forum-item-title {
  color: #1ab394;
}
@media (max-width: 992px) {
  .forum-info {
    margin: 15px 0 10px 0;
    /* Comment this is you want to show forum info in small devices */
    display: none;
  }
  .forum-desc {
    float: none !important;
  }
}





.ibox {
  clear: both;
  margin-bottom: 25px;
  margin-top: 0;
  padding: 0;
}
.ibox.collapsed .ibox-content {
 /*font-size : 0.3rem;*/
  display: none;
}
.ibox.collapsed .fa.fa-chevron-up:before {
  content: "\f078";
}
.ibox.collapsed .fa.fa-chevron-down:before {
  content: "\f077";
}
.ibox:after,
.ibox:before {
  display: table;
}
.ibox-title {
  -moz-border-bottom-colors: none;
  -moz-border-left-colors: none;
  -moz-border-right-colors: none;
  -moz-border-top-colors: none;
  background-color: #ffffff;
  border-color: #e7eaec;
  border-image: none;
  border-style: solid solid none;
  border-width: 3px 0 0;
  color: inherit;
  margin-bottom: 0;
  padding: 14px 15px 7px;
  min-height: 48px;
}
.ibox-content {
  background-color: #ffffff;
  color: inherit;
  padding: 15px 20px 20px 20px;
  border-color: #e7eaec;
  border-image: none;
  border-style: solid solid none;
  border-width: 1px 0;
}
.ibox-footer {
  color: inherit;
  border-top: 1px solid #e7eaec;
  font-size: 90%;
  background: #ffffff;
  padding: 10px 15px;
}

.message-input {
    height: 90px !important;
}
.form-control, .single-line {
    background-color: #FFFFFF;
    background-image: none;
    border: 1px solid #e5e6e7;
    border-radius: 1px;
    color: inherit;
    display: block;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    width: 100%;
    font-size: 14px;
}
.text-navy {
    color: #1ab394;
}
.mid-icon {
    font-size: 66px !important;
}
.m-b-sm {
    margin-bottom: 10px;
}
				

.nav-tabs{border : none;}
</style>
<%--

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
  5.0 번들에서 모달 작동안함... --%>
<body>

<!-- 내일정 추가 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- 내일정 추가 Modal end -->


<!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">내 할 일 보기</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a class="text-white" href="#"></a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#"></a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page"></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    
    
    <a href="${pageContext.request.contextPath}/Todo/sampleboard">js4이용 샘플보드</a>
    <a href="${pageContext.request.contextPath}/Todo/sampleboard2ar">js4이용 샘플보드</a>
<main class="main-box">
  <div id="right-content">
      
        </div>

    <div id="main-content">
        <div>
             <div id="search-box" class="box">
              <h1>내 할 일 보기</h1>
              </div>
             
        </div>
        <div>
            <div id="notice-box" class="box">
            <div class = 'todocontainer'>
            


<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  <i class="fas fa-plus"></i> 새 일정 추가</a>
</button>
	
	
	<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">할 일 목록</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">진행정도</a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">팀별 할 일 목록</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>내 할일</th>
                                            <th>시작날짜</th>
                                            <th>예상 마감일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">첫 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">두 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">세번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>첫 번째 할 일</th>
                                            <th><div class='progress'></div></th>
                                            <th></th>
                                        </tr> 
                                         <tr>
                                            <th>두 번째 할 일</th>
                                            <th><div class='progress'></div></th>
                                            <th></th>
                                        </tr>
                                          <tr>
                                            <th>세 번째 할 일</th>
                                           <th><div class='progress'></div></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                               
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                
                                <%--아코디언 시작 --%>
                             <div class="accordion" id="accordionExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingOne">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										A사원 <div class="progress"></div>	
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse " aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							       
							         <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>A사원</th>
                                            <th>시작날짜</th>
                                            <th>예상 마감일</th>
                                        </tr>
                                    </thead>
                                
                                    <tbody>
                                     <tr>
                                            <th></th>
                                            <th>그래프</th>
                                            <th></th>
                                        </tr> 
                                        <tr>
                                            <td><a href="#">첫 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">두 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">세번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td><b>더보기</b></td>
                                        </tr>
                                    </tbody>
                                    </table><%--a 사원 todo 끝 --%>
                                    
							      </div>
							    </div>
							  </div>
							    <div class="accordion-item">
								    <h2 class="accordion-header" id="headingTwo">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								        B사원 <div class="progress"></div>	
								      </button>
								       </h2>
							  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      								<div class="accordion-body">
							       
							         <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>b사원</th>
                                            <th>시작날짜</th>
                                            <th>예상 마감일</th>
                                        </tr>
                                    </thead>
                                
                                    <tbody>
                                     <tr>
                                            <th></th>
                                            <th>그래프</th>
                                            <th></th>
                                        </tr> 
                                        <tr>
                                            <td><a href="#">첫 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">두 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">세번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td><b>더보기</b></td>
                                        </tr>
                                    </tbody>
                                    </table><%--a 사원 todo 끝 --%>
                                    
							      </div>
							    </div>
							  </div>
							  
							    <div class="accordion-item">
								    <h2 class="accordion-header" id="headingThree">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								      		C사원 <div class="progress"></div>	
								      </button>
								    </h2>
								    
							     <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      								<div class="accordion-body">
							       <div class="ibox-content forum-container">

                <div class="forum-title">
                    <div class="pull-right forum-desc">
                        <samll></samll>
                    </div>
                    <h3>사원 이지현</h3>
                </div>

                <div class="forum-item active">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="forum-icon">
                                <i class="fa fa-shield"></i>
                            </div>
                            <a href="forum_post.html" class="forum-item-title">진행중</a>
                            <div class="forum-sub-title">
                            첫 번째 할 일
                            </div>
                        </div>
                    
                        <div class="col-md-1 forum-info">
                            <span class="views-number">
                                
                            </span>
                            <div>
                                <small></small>
                            </div>
                        </div>
                        <div class="col-md-1 forum-info">
                            <span class="views-number">
                               
                            </span>
                            <div>
                                <small></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="forum-item">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="forum-icon">
                                <i class="fa fa-bolt"></i>
                            </div>
                            <a href="forum_post.html" class="forum-item-title">두 번째 할 일</a>
                            <div class="forum-sub-title">
                            할일상세보기
                            </div>
                        </div>
                        <div class="col-md-2 forum-info">
                            <span class="views-number">
                            </span>
                            <div>
                                <small>23-03-20</small>
                            </div>
                        </div>
                       
                        <div class="col-md-2 forum-info">
                            <span class="views-number">
                                
                            </span>
                            <div>
                                <small>23-03-20</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="forum-item active">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="forum-icon">
                                <i class="fa fa-calendar"></i>
                            </div>
                              <a href="forum_post.html" class="forum-item-title">두 번째 할 일</a>
                            <div class="forum-sub-title">
                            할일상세보기
                            </div>
                        </div>
                        <div class="col-md-2 forum-info">
                            <span class="views-number">
                            </span>
                            <div>
                               <small>23-03-20</small>
                            </div>
                        </div>
                      
                        <div class="col-md-2 forum-info">
                            <span class="views-number">
                                
                            </span>
                            <div>
                                <small>23-03-20</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="forum-item active">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="forum-icon">
                                <i class="fa fa-calendar"></i>
                            </div>
                              <a href="forum_post.html" class="forum-item-title">두 번째 할 일</a>
                            <div class="forum-sub-title">
                            할일상세보기
                            </div>
                        </div>
                        <div class="col-md-2 forum-info">
                            <span class="views-number">
                            </span>
                            <div>
                                <small>23-03-20</small>
                            </div>
                        </div>
                       
                        <div class="col-md-2 forum-info">
                            <span class="views-number">
                                
                            </span>
                            <div>
                                <small>23-03-20</small>
                            </div>
                        </div>
                    </div>
                </div>
      
               
                                    
							      </div>
							    </div>
							  </div>
							 
							</div><%-- 아코디언 끝 --%>
                             
                             
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </div>
         
            </div>
        </div>
    </div>
  

</main>


</body>
</html>