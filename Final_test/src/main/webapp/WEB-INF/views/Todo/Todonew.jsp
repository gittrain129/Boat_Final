<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- 내 할일 TODO 추가 Modal -->
 
<div class="modal fade" id="addTodo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 할 일 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color:black;">
      일정<br>
      <form action="add"	method = 'post'>
        <input type="text" name="T_CONTENT" class = "form-control" id = 'title'>
     
		
		<div class="cal_time" style="margin-top:15px" >
		 <label>일정 시작 날짜: </label><br>
                    <div class="form-group"style="margin-top:15px">
                      <input
                        type="DATE"
                        name="START_DATE"
                        class="form-control time"
                      />
                    </div>
                    
           <label style="margin-top:15px" >일정 종료 날짜: </label><br>
                    <div class="form-group" style="margin-top:15px" >
                      <input
                        type="DATE"
                        name="END_DATE"
                        class="form-control time"
                      />
                    </div>
            </div><!-- cal_time-->
                
                <script>
                $(document).ready(function(){
                    const loginid =$('#loginid').text();

					if($('#allday').is(':checked')){
						console.log($('#allday').is(':checked'))
						$('.time').attr('readonly',true);
						
					}
                })
	        	</script>
      
			 <input type="hidden" name ="EMPNO" value="23100001" id="empno">
			 <input type="hidden" name ="DEPT" value="인사팀" id="dept">
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id ="undo">돌아가기</button>
               <button type="submit" class="btn btn-primary" id ="saveBtn">&nbsp;&nbsp;일정 저장&nbsp;&nbsp;</button>
            </div>
         </form>
        </div>
    </div>
  </div>
</div>

<!-- 내 할일 TODO 추가 Modal end-->

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
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTodo">
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
                                        <c:forEach var="mt" items="${MyTodo}">
                                           
                                        <tr>
                                            <td> 
                                          <a href="#">${mt.t_CONTENT}</a>
                                          </td>
                                            <td>${mt.START_DATE}</td>
                                            <td>${mt.END_DATE}</td>
                                        </tr>
                                    
                                    </c:forEach>
                                <c:if test="${listcount==0}">
		                            <h3 style="text-align: center">등록된 글이 없습니다.</h3>
	                            </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                <table class="table" cellspacing="0">
                                 <c:forEach var="mt" items="${MyTodo}">
                                    <thead>
                                        <tr>
                                            <th>${mt.t_CONTENT}</th>
                                            <th><div class='progress'></div></th>
                                            <th></th>
                                        </tr> 
                                      
                                    </thead>
                               </c:forEach>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                
                                <%--아코디언 시작 --%>
                                <div class="accordion" id="accordionExample">
                                  
                               
                                 
                                    <%--  <c:forEach var="i" begin="0" end="${fn:length(MDT.name)}"> </c:forEach> 
                                     --%>

                                            <c:set var = "num" value ="0"/>
                                  <c:forEach var="MDT" items="${MydeptList}"> 
                                            
                                   <div class="accordion-item">
                                       <h2 class="accordion-header" id="${'heading'}${num}">
                                         <button class="accordion-button collapsed"
                                          type="button" data-bs-toggle="collapse" data-bs-target="#${'collapse'}${num}" 
                                          aria-expanded="false" aria-controls="${'collapse'}${num}">
                                                ${MDT.NAME} <div class="progress"></div>	
                                         </button>
                                       </h2>
                                     
                                     
                                    <div id="${'collapse'}${num}" class="accordion-collapse collapse" aria-labelledby="${'heading'}${num}" data-bs-parent="#accordionExample">
                    <c:set var = "num" value ="${num+1}"/>
                                   
                     <div class="accordion-body">
                    <div class="ibox-content forum-container">
                                
                                    
                   <div class="forum-title">
                       <div class="pull-right forum-desc">
                           <samll></samll>
                       </div>
                       <h3>${MDT.DEPT}  ${MDT.NAME} </h3>
                   </div>
   
                   <div class="forum-item active">
                       <div class="row">
                           <div class="col-md-9">
                               <div class="forum-icon">
                                   <i class="fa fa-shield"></i>
                               </div>
                               <a href="forum_post.html" class="forum-item-title">진행중</a>
                               <div class="forum-sub-title">
                              
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
                   <!--   <div class="forum-item active"> -->
         
                  
                                       
                                     </div>
                                     <!--  <div class="ibox-content forum-container"> -->
                                   </div>
                                   <!--<div class="accordion-body">  -->
                                 </div>
                                <!--   <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample"> -->
                               </div>
                                <!--    <div class="accordion-item"> -->
                         </c:forEach>
                                       
                               </div>
                               <%-- 아코디언 끝 --%>
                             
                             
                                    
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