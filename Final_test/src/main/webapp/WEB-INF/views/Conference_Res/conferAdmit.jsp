<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
   <meta charset="utf-8">
    <title>BOAT - 회의실 예약 승인시스템</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<style>
.project-item {
    min-height: 200px; /* Set a minimum height */
    min-width: 200px; /* Set a minimum width */
    height: 100%; /* Ensure each item takes up the full height of the container */
    display: flex; /* Use flexbox layout to align content */
    flex-direction: column; /* Align content vertically */
    justify-content: space-between; /* Add spacing between elements */
}

</style>

</head>
<body>
 <jsp:include page="../Main/header.jsp"/>

   <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">회의실 예약 / 비품 대여 승인</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a class="text-white" href="#">회의실</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">노트북</a></li>
                     <li class="breadcrumb-item"><a class="text-white" href="#">프로젝터</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

	<!-- 탭 시작 -->
	    <div class="container">
      <div class="row">
        <div class="col">
          <p>회의실 예약 승인</p>
         
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">전체</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd" >회의실 예약</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc" >비품</a>
              </li>
                
              
             <!--  drop down 임시 삭제
              <li class="nav-item">
                 <div class="dropdown" >
              <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
             회의실
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">회의실</a>
                <a class="dropdown-item" href="#">비품 대여</a>
             </div>
            </div>   
              </li>
               -->
              
             </ul> 
            
            
            
            
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                  <!-- Project Start -->
    <div class="container-xxl py-5">
        <div class="container">
              <div class="row row-cols-1 row-cols-md-4 g-4">
               
                <c:forEach var="r" items="${reservation}">          
                <div class="col">
                    <div class="project-item border rounded h-100 p-4" data-dot="01">
                        <div class="position-relative mb-4">
                            <c:choose>
                   			 <c:when test="${r.RENTAL eq '대회의실'}">
                        		<img class="img-fluid rounded" src="${pageContext.request.contextPath}/jkKim/image/large.jpg" alt="">
                           		<a href="${pageContext.request.contextPath}/jkKim/image/large.jpg" data-lightbox="project"><i class="fa fa-eye fa-2x"></i></a>
                        		
                    		</c:when>
                    		<c:when test="${r.RENTAL eq '회의실1'}">
                        		<img class="img-fluid rounded" src="${pageContext.request.contextPath}/jkKim/image/small.jpg" alt="">
                        		<a href="${pageContext.request.contextPath}/jkKim/image/small.jpg" data-lightbox="project"><i class="fa fa-eye fa-2x"></i></a>
                       		</c:when>
                       		<c:when test="${r.RENTAL eq '회의실2'}">
                        		<img class="img-fluid rounded" src="${pageContext.request.contextPath}/jkKim/image/small2.jpg" alt="">
                        		<a href="${pageContext.request.contextPath}/jkKim/image/small2.jpg" data-lightbox="project"><i class="fa fa-eye fa-2x"></i></a>
                       		</c:when>
                    		</c:choose>
                        </div>
                        <h6>${r.RENTAL}</h6>
                        <span>신청자: ${r.ID}</span>
                        <span>일정 : ${r.START_T} - ${r.END_T}</span>
                        <c:choose>
                        <c:when test="${r.STATUS ==0 }">
                      <button type="button" class="btn btn-primary" onclick="modal('${r.ID }','${r.RENTAL}','${r.START_TIME }','${r.START_T}','${r.END_TIME }','${r.END_T}','${r.CONTENT}')">처리대기</button>
				      	</c:when>
				      	<c:when test="${r.STATUS ==1 }">
				      <button type="button" class="btn btn-success" onclick="modal('${r.ID }','${r.RENTAL}','${r.START_TIME }','${r.START_T}','${r.END_TIME }','${r.END_T}','${r.CONTENT}')">처리완료</button>
				      	</c:when>
				      	<c:when test="${r.STATUS ==2 }">
				      <button type="button" class="btn btn-danger" onclick="modal('${r.ID }','${r.RENTAL}','${r.START_TIME }','${r.START_T}','${r.END_TIME }','${r.END_T}','${r.CONTENT}')">반려</button>
				      	</c:when>
				      
				      </c:choose>
                    </div>
                </div>
            </c:forEach>
                 
        
            
            </div>
        </div>
    </div>
    
    <div class="center-block">
			<ul class="pagination justify-content-center">
				<c:if test="${page<=1}">
					<li class="page-item">
						<a class="page-link gray">이전&nbsp;</a>
					</li>
				</c:if>
				<c:if test="${page>1}">
					<li class="page-item">
						 <a href="#" class="page-link">이전&nbsp;</a>
					</li>
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a==page }">
						<li class="page-item active">
							<a class="page-link">${a}</a>
						</li>
					</c:if>
					<c:if test="${a!=page }">
						<li class="page-item">
							<a href="#" class="page-link">${a}</a>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage }">
						<li class="page-item">
							<a class="page-link gray">&nbsp;다음</a>
						</li>
				</c:if>
				<c:if test="${page < maxpage }">
						<li class="page-item">
							<a href="#" class="page-link">&nbsp;다음</a>
						</li>
				</c:if>
		
			</ul>			
		</div>
    <!-- Project End -->
             
                
              </div>
              <div class="tab-pane fade" id="asd">
                 <div id='calendar'></div>
              </div>
              <div class="tab-pane fade" id="zxc">
               <div id='calendar'></div>
            </div>
        </div>
      </div>
    </div>
</div>
<!-- 탭 끝 -->


    <!-- modal -->
    <div class="modal fade" id="res_Modal" tabindex="-1" role="dialog" aria-labelledby="res_ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="res_ModalLabel">대여 신청</h5>
       </div>
      <div class="modal-body">
        <form id="res_Form">
        
         <div class="form-group">
            <label for="rental">신청자</label>
            <input type="text" class="form-control" id="rental_id" name="rental" readonly>
          </div>
        
          <div class="form-group" style="display:none">
            <label for="rental">대여대상</label>
            <input type="hidden" id="rental" name="rental">
          </div>
        
          <div class="form-group">
            <label for="startTime">대여시작 시간</label>
            <input type="text" class="form-control" id="startTime" readonly>
            <input type="hidden" id="startTimeISO" name="startTimeISO">
          </div>
          <div class="form-group">
            <label for="endTime">대여종료 시간</label>
            <input type="text" class="form-control" id="endTime" readonly>
             <input type="hidden" id="endTimeISO" name="endTimeISO">
          </div>
          <div class="form-group">
            <label for="content">용도</label>
            <textarea class="form-control" id="content" rows="3"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-secondary" onclick="$('#res_Modal').modal('hide')">취소</button>
        <button type="button" class="btn btn-danger" id="reject_button" onclick="reject()">거절</button>
        <button type="button" class="btn btn-primary" onclick="confirm()">승인</button>
    
      </div>
    </div>
  </div>
</div>



<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

function modal(id,rental,start_time,start_t,end_time,end_t,content) {
	  $('#rental_id').val(id);	
	  $('#rental').val(rental);
	  $('#startTimeISO').val(start_time);
	  $('#startTime').val(start_t);
	  $('#endTimeISO').val(end_time);
	  $('#endTime').val(end_t);
	  $('#content').val(content);
	  $('#res_Modal').modal('show');
	}
	
function confirm() {
	var id = $('#rental_id').val();
	var rental = $('#rental').val();
	var start_time = $('#startTimeISO').val();
	var end_time =  $('#endTimeISO').val();
	
	console.log(id);
	console.log(rental);
	console.log(start_time);
	console.log(end_time);
	
	   $.ajax({
           url: "${pageContext.request.contextPath}/confer/admit_ajax/",
           type: 'POST',
           data: {
               "start_time": start_time,
               "end_time": end_time,
               "rental": rental,
               "id": id
           },
           beforeSend : function(xhr)
           {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
             xhr.setRequestHeader(header, token);         
          },
           success: function(response) {
               $('#res_Modal').modal('hide');
               document.location.reload(); //나중에 삭제해야댐 확인용
           },
           error: function(request,error) {
               
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
       }); //ajax 끝
}//confirm 끝

$(document).ready(function() {
	  $('.page-link').click(function(e) {
	    e.preventDefault();
	    var page = $(this).text();
	    var tab = $('.nav-tabs .active').text();
	    console.log(page);
	    var url = "admit?page=" +page+ "&tab=" +tab;
	    window.location.href = url;
	  });
	});

	
</script>














  

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>