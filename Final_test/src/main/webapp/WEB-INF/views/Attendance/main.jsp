<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별근무시간</title>
<jsp:include page="../Main/header.jsp" />
<%-- <script src="${path}/resources/js/attendance/board.js" defer ></script>--%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/attandance.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/attandance2.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.26.0/moment-with-locales.min.js"></script>
</head>

<style>
.page-header{margin : 0!important}
</style>

<body>

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">근태관리</h1>
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
        <div id="clock" class="box">
            <div id="date-box">${day}</div>
            <div id="time-box">${time}</div>
            <div id="btn-box">
            <!--출근버튼  -->
                <form action="${pageContext.request.contextPath}/attendance/on" method="post">
                <input type="hidden" value="" id="on"          >
                
                <input type="button" name="on" id="start-btn" class="btn" value="출근">
                
                </form>
            <!--퇴근버튼  -->
                <form action="${pageContext.request.contextPath}/attendance/off" method="post">
                
                <input type="hidden" value="" id="off"          >
                
                <input type="button" name="off" id="end-btn" class="c-btn" value="퇴근">
                
                
                </form>
            
            <script>
  			$(function(){
  				moment.locale('ko');
  			var currenttime= moment().format('MMMM Do YYYY, h:mm:ss a');
  			
  	      
  	      
            $('#start-btn').click(function(){
            	
            var val =$('#on').val(currenttime);
            console.log("출근시간="+currenttime);
            	
            })
            
            
            $('#end-btn').click(function(){
            	
            var val =$('#off').val(currenttime);
            $('#off').val(currenttime);
            console.log("퇴근시간="+currenttime);
            	
            })
            
  			})
			</script>
            
            </div>
            <div id="result-box">
                <div>시작: ${todayWork.start}</div>
                <div>종료: ${todayWork.end}</div>
            </div>
        </div>
        <div id="work-week" class="box">
            <div id="week-header">이번주 근로시간</div>
            <div id="select-week">
                <input id="start-day" type="date" style="width: 100px;" name="start" value="2022-01-08">
                        ~
                <input id="end-day" type="date" style="width: 100px;" name="end" value="2023-01-14">
            </div>
            <div id="work-time">
                총 근무시간 &nbsp&nbsp 
                <div class="progress">
                    <div class="progress-bar" style="width:80%;">80%</div>
                </div>
            </div>
            <div id="work-time2">
                           
              
            </div>
        </div>
        <div id="rest-information" class="box">
        <div id="information-header">부서별 근무시간</div>
           
            </div>
        </div>

    <div id="main-content">
        <div>
        <%-- 검색창 form--%>
            <form action="${pageContext.request.contextPath}/attendance/list" method="post">
            
            
             <div id="search-box" class="box">
              <h1>근태관리</h1>
              </div>
              
            </form> 
           <%-- 검색창 form--%>        
        </div>
        <div>
            <div id="notice-box" class="box">
                <div class="list-box">
                    <div class="first-item">
                        <p>날짜</p>
                        <p>성명</p>
                        <p>시작시간</p>
                        <p>종료시간</p>
                        <p>추가근무시간</p>
                        <p>총 근무시간</p>
                    </div>
                        <c:forEach items="${voList}" var="x">
                            <div class="list-item">
                                <p>${x.workDay}</p>
                                <p>${x.name}</p>
                                <p>${x.start}</p>
                                <p>${x.end}</p>
                                <p>${x.workoverTime}</p>
                                <p>${x.workTime}</p>
                            </div>
                        </c:forEach>
                </div>
              <%--   <div class="page-box">
                	<span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/attendance/board?page=1'"</c:if>> keyboard_double_arrow_left </span>
                    <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/attendance/board?page=${pv.currentPage - 1}'"</c:if>> chevron_left </span>
                    <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                    <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/attendance/board?page=${i}'">${i}</div>
                    </c:forEach>
                    <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/attendance/board?page=${pv.currentPage + 1}'"</c:if>> chevron_right </span>
                    <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1 and pv.maxPage eq pv.currentPage}">onclick="location.href='/sixman/attendance/board?page=${pv.maxPage}'"</c:if>> keyboard_double_arrow_right </span>
                </div> --%>
            </div>
        </div>
    </div>
  

</main>
<jsp:include page="../Main/footer.jsp" />
</body>
</html>