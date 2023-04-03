/**
근태관리 자바스크립트
* 
 */
/*
헤더의 
	<span id="loginid">${pinfo.username}</span>님(로그아웃)
	값을 글쓴이 값으로 설정필요
*/

let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
 //출퇴근 버튼 클릭시 시간 설정
 moment.locale('ko');
 var currenttime= moment().format('YYYY-MM-DD HH:mm');
 //출근시간 :2023-03-23 15:38
 var resulttime= moment().format('MM-DD HH:mm');
 //로그인한 아이디  폼에 입력
 let empno =$("#loginid").text();
 let dept = $('#loginDept').text();

 
//실시간 시계

setInterval(time,1000);

function time()
{        
var today = new Date();
$('#date-box').text(today.toLocaleString());
}



$(function(){
     //   console.log($('#start-btn').prop('disabled')==false);
        //true
 let endtimeeeeeee=$('#offTimeText').text()
 let starttimeeeeeee=$('#onTimeText').text()
console.log(endtimeeeeeee==='')
console.log(endtimeeeeeee)

 if(endtimeeeeeee===''&&starttimeeeeeee===''){
        $('#end-btn').addClass('c-btn');
                        //.addClass('btn');
                        //.attr('disabled', true);

 }
 if(starttimeeeeeee&&endtimeeeeeee===''){
        $('#start-btn').removeClass('btn')
                        .addClass('c-btn');
        $('#end-btn').removeClass('c-btn')
                        .addClass('btn'); 
                       // .attr('disabled', true);       
}
if(starttimeeeeeee&&endtimeeeeeee){
        $('#start-btn').removeClass('btn')
                         .addClass('c-btn'); 
        $('#end-btn').removeClass('btn')
                        .addClass('c-btn'); 
}
//console.log(Typeof($('#offTimeText').text()))


//출근버튼 클릭
$('#start-btn').click(function(){

       // console.log($('#start-btn').attr('disabled')==true);
       // console.log("보낼 empno ......"+empno);
       // console.log("보낼 dept ......"+dept);

        //버튼클릭시 1. 알럿창 2. 값전송 db 저장
        if($('#start-btn').hasClass('c-btn')){
                toastr.options.escapeHtml = true;
                toastr.options.closeButton = true;
                toastr.options.newestOnTop = false;
                toastr.options.progressBar = true;
                toastr.info('오늘은 이미 출근 하셨습니다.', '근태관리', {timeOut: 3000});
        }else{
      //출근시간 db 입력
      $.ajax({
        url : 'on',
        data : {'EMPNO':empno,
                'ON_TIME':currenttime
                ,'DEPT':dept},
        type :'post',
        beforeSend: function (jqXHR, settings) {
                 jqXHR.setRequestHeader(header, token);
              	},
        success : function(rdata){
                //버튼 색변경
                console.log("출근 success");
                if($('#start-btn').hasClass('btn')){
                        $('#start-btn').removeClass('btn')
                                .addClass('c-btn')
                                .css('pointer-events','none');  }
                                //하얗게
                if($('#end-btn').hasClass('c-btn')){  
                      $('#end-btn').removeClass('c-btn')
                                .addClass('btn')       
                                .attr('disabled', false);
                                //파랗게
                        }
                
                //출근시간 표시.substr(0,10)
                console.log(rdata.ON_TIME);
                let attTiemeee=rdata.ON_TIME;
             //  $('#onTimeText').text(rdata.ON_TIME);
             //  $('#attTime').text(attTiemeee);
             //  $('#attColor').css('background','#55a94b')

        }, error: function(error){
                console.log("hi")
                console.log(error);
        }
        })//ajax
        }
        
})

//퇴근 버튼 클릭시
$('#end-btn').click(function(){
        if($('#end-btn').hasClass('c-btn')){
                toastr.options.escapeHtml = true;
                toastr.options.closeButton = true;
                toastr.options.newestOnTop = false;
                toastr.options.progressBar = true;
                toastr.info('오늘은 이미 퇴근 하셨습니다.', '근태관리', {timeOut: 3000});
         }else{
        console.log("퇴근시간="+currenttime);
        //퇴근시간 db 입력
        $.ajax({
                url : 'off',
                data : {'EMPNO':empno,
                        'OFF_TIME':currenttime},
                type :'post',
                beforeSend: function (jqXHR, settings) {
                         jqXHR.setRequestHeader(header, token);
                              },
                success : function(rdata){
                        console.log("퇴근 success");
                        //버튼 색변경
                        if($('#end-btn').hasClass("btn")){
                                $('#end-btn').removeClass('btn')
                                        .addClass('c-btn')     
                                         .attr('disabled', true);  
                                         //하얗게

                           //     $('#start-btn') .removeClass('c-btn')
                           //                     .addClass('btn')       
                           //                    .attr('disabled', true);
                                        //파랗게
                        }
                        console.log(rdata.OFF_TIME);

                        //퇴근시간 표시
                        $('#offTimeText').text(rdata.OFF_TIME);
                        $('#attColor').css('background','white');
                        $('#attTime').text('');


                }, error: function(){
                        console.log("hi")
                        console.log('error');
                }


    
        })//ajax
	}
})

//오늘날짜 이후는 선택못하게 제한설정
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("end-day").setAttribute("max", today);
document.getElementById("start-day").setAttribute("max", today);

})