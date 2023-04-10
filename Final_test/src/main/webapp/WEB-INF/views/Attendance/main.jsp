<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <!-- 데이트 피커 -->


<title>일별근무시간</title>
<jsp:include page="../Main/header.jsp" />

<%-- <sec:authorize access="isAnonymous()">
		<sec:authentication property="principal" var="pinfo"/>
		
		<c:if test="${pinfo.username=='admin'}">
		 </c:if>
      </sec:authorize>
		--%>

<%-- <script src="${path}/resources/js/attendance/board.js" defer ></script>--%>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/attandance.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/attandance2.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.26.0/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/jhLee/js/attandance.js" ></script>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
                    <!-- <li class="breadcrumb-item"><a class="text-white" href="#"></a></li> -->
                    <!-- <li class="breadcrumb-item"><a class="text-white" href="#"></a></li> -->
                    <li class="breadcrumb-item text-primary active" aria-current="page"></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
<main class="main-box">
  <div id="right-content">
        <div id="clock" class="box">
            <div id="date-box">
          
            </div>
              <div id="TTime"></div>
            <div id="btn-box">
            
            <!--출근버튼  -->
                <form action="${pageContext.request.contextPath}/Attendance/on" method="post">
                <input type="hidden" name="ON_TIME"  value="" id="on">
                <input type="hidden" class ="empno" name="EMPNO" value="">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input type="button" id="start-btn" class="btn" value="출근">
                
                </form>
                
                
            <!--퇴근버튼  -->
                <form action="${pageContext.request.contextPath}/Attendance/off" method="post">
                
                <input type="hidden" name="OFF_TIME" value="" id="off"          >
                <input type="hidden" class ="empno" name="EMPNO" value="">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input type="button"  id="end-btn" class="c-btn" value="퇴근">
                
                
                </form>
            
            
            </div>
            <div id="result-box">
                <div>시작:<span id="onTimeText">${fn:substring(TodayMyatt.ON_TIME,11,16)}</span> </div>
                <div>종료:<span id="offTimeText">${fn:substring(TodayMyatt.OFF_TIME,11,16)}</span> </div>
            </div>
        </div>
        <div id="work-week" class="box">
            <div id="week-header">이번주 근로시간</div>
            <div id="select-week">
                <form>
                <input id="startWork" type="date" style="width: 100px;" name="start" value="2022-01-08">
                        ~
                <input id="endWork" type="date" style="width: 100px;" name="end" value="2023-01-14">


            </form>
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
        <input type="text" name="daterange" value="01/01/2018 - 01/15/2018" />

            </div>
        </div>

    <div id="main-content">
        <div>
        <%-- 검색창 form--%>
            <form action="${pageContext.request.contextPath}/attendance/list" method="post">
            
            
             <div id="search-box" class="box">
              <div class=""></div>
                <h1>근태관리</h1>
                 <div class="mgr">${JOB}</div>
                 <div class="name">${NAME}</div>
              </div>
              
            </form> 
           <%-- 검색창 form--%>        
        </div>
        <div>
            <div id="notice-box" class="box">
                <button id="Exceldown" class = 'Excel'>Excel로 다운받기</button>
                <div class="list-box">
                    <div class="first-item">
                        <p>날짜</p>
                        <p>성명</p>
                        <p>시작시간</p>
                        <p>종료시간</p>
                        <p></p>
                        <p>총 근무시간</p>
                    </div>
                        <c:forEach items="${attlist}" var="x">
                            <div class="list-item">
                                <p>${fn:substring(x.ON_TIME,5,10)}</p>
                                <p>${x.NAME}</p>
                                <p>${fn:substring(x.ON_TIME,11,16)}</p>
                                <p>${fn:substring(x.OFF_TIME,11,16)}</p>
                                <p></p>
                                <p>${x.WORK_TIME}</p>
                            </div>
                        </c:forEach>
                </div>
           
            </div>
        </div>
    </div>
  

</main>
<jsp:include page="../Main/footer.jsp" />
</body>
</html>