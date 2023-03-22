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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/Todonew2.css">
  
  
  <%--tab 전환에 필요 bootstrap4 --%>
  
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  
  
</head>

<style>

</style>
<style>
.page-header{margin : 0!important}
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
<jsp:include page="../Main/footer.jsp" />

</body>
</html>