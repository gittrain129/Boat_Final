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
 let dept = $(#loginDept).text();

 
//실시간 시계

setInterval(time,1000);

function time()
{        
var today = new Date();
$('#date-box').text(today.toLocaleString());
}



$(function(){

//  if($('#onTimeText').text()===''){
//         $('#start-btn').addClass('btn')       
//         .removeClass('c-btn');

//  }
//  if($('#offTimeText').text()==''){
//         $('#start-btn').addClass('btn')       
//         .removeClass('c-btn');

//  }



$('#start-btn').click(function(){
        console.log("보낼 empno ......"+empno);
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
                if($(this).hasClass("btn")){
                        $(this).addClass('c-btn')
                                .attr('disabled')       
                                .removeClass('btn')
                                .attr('disabled', true);
                                //하얗게
                        $('#end-btn').addClass('btn')       
                                .removeClass('c-btn')
                                .attr('disabled', false);
                                //파랗게
                }
                //출근시간 표시
                
        }, error: function(error){
                console.log("hi")
                console.log(error);
        }
})//ajax

//$('#result-box').children('div:eq(0)').text('시작 :'+ currenttime.substring(11,16));

      

        
})

$('#end-btn').click(function(){
        
        console.log("퇴근시간="+currenttime);
        //퇴근시간 db 입력
        $.ajax({
                url : 'off',
                data : {'EMONO':empno,
                        'OFF_TIME':currenttime},
                type :'post',
                beforeSend: function (jqXHR, settings) {
                         jqXHR.setRequestHeader(header, token);
                              },
                success : function(rdata){
                        console.log("퇴근 success");
                        //버튼 색변경
                        if($('#end-btn').hasClass("btn")){
                                $(this).addClass('c-btn')       
                                        .removeClass('btn')
                                        .attr('disabled', true);
                                        //하얗게
                                $('#start-btn').addClass('btn')       
                                        .removeClass('c-btn')
                                        .attr('disabled', true);
                                        //파랗게
                        }
                        //출근시간 표시
                     // $('#result-box').children('div:eq(1)').text('종료 :'+currenttime.substring(11,16));
        
                }, error: function(){
                        console.log("hi")
                        console.log('error');
                }


    
        })//ajax

})

//오늘날짜 이후는 선택못하게 제한설정
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("end-day").setAttribute("max", today);
document.getElementById("start-day").setAttribute("max", today);

})