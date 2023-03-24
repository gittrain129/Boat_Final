<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
   <meta charset="utf-8">
    <title>BOAT - 회의실 예약 시스템</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">




    <style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 20px auto;
  }
  
   #mytable {
    max-width: 1100px;
    margin: 20px auto;
  }
    .fc-event-main:hover {
    cursor: pointer;
  }
 </style>

  </head>
 
  <body>
  <jsp:include page="../Main/header.jsp"/>
  
   <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">회의실 예약 / 비품 대여 신청</h1>
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
  
    <div class="container">
      <div class="row">
        <div class="col">
          <p>회의실 예약</p>
         
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">대회의실</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd" >회의실1</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc" >회의실2</a>
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
                <div id='calendar'></div>
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
    
    
    <table class="table table-hover" id="mytable">
  <thead class="table-light">
  <tr>
      <th scope="col">#</th>
      <th scope="col">자산</th>
      <th scope="col">이름</th>
      <th scope="col" style="text-align:center;">예약시간</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>대회의실</td>
      <td>김정근</td>
      <td align="center">23-03-16 14:00 ~ 23-03-16 16:00</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>노트북</td>
      <td>김정근</td>
      <td align="center">23-03-16 14:00 ~ 23-03-16 16:00</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>회의실2</td>
      <td>김정근</td>
      <td align="center">23-03-18 09:00 ~ 23-03-18 10:00</td>
    </tr>
  </tbody>
</table>


    <!-- modal -->
    <div class="modal fade" id="res_Modal" tabindex="-1" role="dialog" aria-labelledby="res_ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="res_ModalLabel">대여 신청</h5>
       </div>
      <div class="modal-body">
        <form id="res_Form">
        
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
        <button type="button" class="btn btn-primary" onclick="reservation()">대여신청</button>
      </div>
    </div>
  </div>
</div>
    


   <script>

       
   $(document).ready(function(){
       var calendarEl = document.getElementById('calendar');
       
       var asdf =   ([<c:forEach items="${list}" var="l">
       {
           start: '${l.start}',
           end: '${l.end}',
           title: '${l.title}'
         },
         </c:forEach>]);
       
       var ttt = $('.nav-tabs .active').text();
       console.log(ttt);
            
       var calendar = new FullCalendar.Calendar(calendarEl, {
           headerToolbar: {
              left: 'title',
              center: '',
              right: 'prev,next today',
       
    	 
           },
           initialView: 'timeGridFiveDay',
           views: {
               timeGridFiveDay: {
                 type: 'timeGrid',
                 duration: { days: 5 },
                 
           
               }
           },
          
           height: 'auto',
           navLinks: true,
           editable: false,
           selectable: true,
           selectMirror: true,
           nowIndicator: true,
           locale : 'ko',
           slotMinTime: '09:00',
           slotMaxTime: '19:00',
           
           selectOverlap: false,
           eventClick: function(info) {
               var title = info.event.title;
               var start = moment(info.event.start).format('MM-DD HH:mm');
               var end = moment(info.event.end).format('MM-DD HH:mm');
               var tab = $('.nav-tabs .active').text();
               var modalTitle = tab + ' 대여 신청';
               
              
              
               
               $('#res_ModalLabel').text('');
               $('#content').text('');
               $('#startTime').val('');
               $('#endTime').val('');
               
               $('#res_ModalLabel').text(modalTitle);
               $('#content').text(title);
               $('#startTime').val(start);
               $('#endTime').val(end);
               
               $('#res_Modal').modal('show');
           },
           select: function(info) {
              
              var startTime = info.start.toISOString();
               var endTime = info.end.toISOString();

               // moment라이브러리로 출력 방식 바꾸기
               var startTimeString = moment(startTime).format('MM-DD HH:mm');
               var endTimeString = moment(endTime).format('MM-DD HH:mm');
               var tab = $('.nav-tabs .active').text();
               var modalTitle = tab + ' 대여 신청';
               
               //저장용데이터
               $('#rental').val(tab);
               $('#startTimeISO').val(startTime);
               $('#endTimeISO').val(endTime);

               // 모달에 띄울 데이터 .val
               $('#res_ModalLabel').text('');
               $('#content').text('');
               $('#startTime').val('');
               $('#endTime').val('');
               
               $('#res_ModalLabel').text(modalTitle);
               $('#startTime').val(startTimeString);
               $('#endTime').val(endTimeString);
               $('#res_Modal').modal('show');
              
             },
              
             
             events: asdf
                  
            
       }); //var calendar 선언
         calendar.render();
       
         $(document).ready(function() {
      	   $('.nav-tabs a').on('click', function (e) {
      		   e.preventDefault();
      		   $('.nav-tabs a').removeClass('active'); 
      		   $(this).addClass('active'); 
      		   var tab_info = $('.nav-tabs .active').text();
      		   console.log(tab_info);
      		   
      		   $.ajax({
      	            type: "GET",
      	            url: "${pageContext.request.contextPath}/confer/view_ajax",
      	            data: {"tab_info": tab_info},
      	            success: function (response) {
      	              calendar.getEventSources().forEach(function(source) {
      	                source.remove();
      	              });
      	              calendar.addEventSource(response);
      	              calendar.refetchEvents();
      	               
      	            },
      	            error: function (error) {
      	            	alert(error);
      	            }
      	        });
      		   
      		   
      		 });

      	 });
       
       
       
   });
  

   
   
   
   
   function reservation() {
       // modal에서 데이터 저장하기
       var startTime =  $('#startTimeISO').val();
       var endTime = $('#endTimeISO').val();
       var content = $('#content').val();
       var rental = $('#rental').val();
       
       console.log('confermain의 ajax중');
       console.log(startTime);
       console.log(endTime);
       console.log(content);
       console.log(rental);
             
       $.ajax({
           url: "${pageContext.request.contextPath}/confer/reservation/",
           type: 'POST',
           data: {
               "start_time": startTime,
               "end_time": endTime,
               "content": content,
               "rental": rental
           },
           success: function(response) {
               $('#res_Modal').modal('hide');
               document.location.reload(); //나중에 삭제해야댐 확인용
           },
           error: function(request,error) {
             
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
       });
   }

 
   
  
   
   
   
   
   
   
   
   
    </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  </body>
  
</html>