<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
   <meta charset="utf-8">
    <title>BOAT - 회의실 예약 시스템</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

       <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>



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
 </style>
    <!-- eventMaxStack? 한번에 여러개 못쓰게 막는 태그인지 체크 -->
    <script>
       
     $(document).ready(function(){
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
        	
        	  headerToolbar: {
                 left: 'prev,next,today,addEventButton',
                 right: 'dayGridMonth,listWeek',
                  center: 'title'
             },
                
                
        	initialView: 'timeGridFourDay',
          	views: {
          		
          	    timeGridFourDay: {
          	      type: 'timeGrid',
          	      duration: { days: 5 }
          	    }},
          	  height: 'auto',
              navLinks: true, // can click day/week names to navigate views
              editable: true,
              selectable: true,
              selectMirror: true,
              nowIndicator: true,
          	locale : 'ko',
          	height:'auto',
          	selectable: true,
          	slotMinTime: '09:00',
          	slotMaxTime: '19:00',
          	customButtons: {
	        	  
                addEventButton: { // 추가한 버튼 설정

                    text : "일정 추가",  // 버튼 내용
                    click : function(){ 
                  	  // 버튼 클릭 시 이벤트 추가
                  	  
						$('#calendarModal #addCalendar')
              		.css('display', 'inline');
                  	  
                        $("#calendarModal").modal("show"); // modal 나타내기

                		
                        $('#calendarModal #modifyCalendar').css('display', 'none');
          				$('#calendarModal #deleteCalendar').css('display', 'none');
          				$('#calendar_title').val('');
                        $('#calendar_content').val('');
                        $('#calendar_start_date').val('');
                        $('#calendar_end_date').val('');
                        
                        $("#calendarModal #calendar_title").attr("readonly",false); 

                      
											}
										}
									}
          	
          	
          	
          	
          	
          	
          	
        });
        calendar.render();
      });

     
    
     
     
     
     
     
     
     
     
     
     
     
    </script>
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
                <a class="nav-link" data-toggle="tab" href="#asd">회의실1</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">회의실2</a>
              </li>
             	 <li class="nav-item" style="display:hidden">
                <a class="nav-link" data-toggle="tab" href="#zxc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
             	</li>
             	<li class="nav-item" style="display:hidden">
                <a class="nav-link" data-toggle="tab" href="#zxc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
             	</li>
             	<li class="nav-item" style="display:hidden">
                <a class="nav-link" data-toggle="tab" href="#zxc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
             	</li>
              
             
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
             </ul> 
            
            
            
            
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                <div id='calendar'></div>
              </div>
              <div class="tab-pane fade" id="asd">
                <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
              </div>
              <div class="tab-pane fade" id="zxc">
                <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
              </div>
            </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
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
    
    
    
    
    
    
    
    
    
    
     <!-- modal 추가 -->

 	<div class="modal fade insertModal" id="calendarModal" tabindex="-1"
 		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<div class="modal-dialog" role="document">
 			<div class="modal-content">
 				<div class="modal-header">
 					<h5 class="modal-title" id="exampleModalLabel">대회의실</h5>

 					<button type="button" class="close" data-dismiss="modal"
 						aria-label="Close" id="xbutton">
 						<span aria-hidden="true">&times;</span>
 					</button>

 				</div>
 				<div class="modal-body">
 					<div class="form-group">
 						<label for="taskId" class="col-form-label">신청자</label> <input
 							type="text" class="form-control" id="calendar_title"
 							name="calendar_title"> <label for="taskId"
 							class="col-form-label">사용 용도</label> <input type="text"
 							class="form-control" id="calendar_content"
 							name="calendar_content"> 
 							<label for="taskId"
 							class="col-form-label">시작 날짜</label> <input type="date"
 							class="form-control" id="calendar_start_date"
 							name="calendar_start_date" value="2023-02-14">
 							
 							<label for="taskId"
 							class="col-form-label">시작 시간</label> <input type="time"
 							class="form-control" id="calendar_end_date"
 							name="calendar_end_date">
 							
 							
 							<label for="taskId"
 							class="col-form-label">종료 시간</label> <input type="time"
 							class="form-control" id="calendar_end_date"
 							name="calendar_end_date">
 					</div>
 				</div>
 				<div class="modal-footer">

 					<button type="button" class="btn btn-success" id="modify"
 						onclick="updatedata(g_arg)">수정</button>
 					<button type="button" class="btn btn-danger" id="delete"
 						onclick="deletecal(g_arg)">삭제</button>

 					<button type="button" class="btn btn-secondary" id="addCalendar">추가</button>

 					<button type="button" class="btn btn-dark" data-dismiss="modal"
 						id="sprintSettingModalClose" data-backdrop="static"
 						data-keybord="false">닫기</button>
 				</div>

 			</div>
 		</div>
 	</div>
 	
 	<jsp:include page="Main/footer.jsp"/>
  </body>
  
</html>