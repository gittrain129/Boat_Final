/**
근태관리 자바스크립트
* 
 */
/*
헤더의 
	<span id="loginid">${pinfo.username}</span>님(로그아웃)
	값을 글쓴이 값으로 설정필요
*/

	//실시간 시계

	setInterval(time,1000);

	function time()
	{        
	var today = new Date();
 	$('#date-box').text(today.toLocaleString());
 	}

$(function(){

 //출퇴근 버튼 클릭시 시간 설정
moment.locale('ko');
var currenttime= moment().format('YYYY-MM-DD HH:mm');
//출근시간 :2023-03-23 15:38
var resulttime= moment().format('MM-DD HH:mm');
console.log("resulttime : "+resulttime)
//로그인한 아이디  폼에 입력
$(".empno").val($("#loginid").text());

$('#start-btn').click(function(){
        
      //  let val =$('#on').val(currenttime);

        $('#result-box').children('div:eq(0)').text('시작 :'+ currenttime);

        console.log("출근시간="+currenttime);

        if($(this).hasClass("btn")){
                $(this).addClass('c-btn')       
                        .removeClass('btn');
                        //하얗게
                $('#end-btn').addClass('btn')       
                        .removeClass('c-btn');
                        //파랗게
                
        }
        
})


$('#end-btn').click(function(){
        
       // let val =$('#off').val(currenttime);
        $('#off').val(currenttime);
        console.log("퇴근시간="+currenttime);

        $('#result-box').children('div:eq(1)').text('종료 :'+currenttime);
        if($(this).hasClass("btn")){
        $(this).addClass('c-btn')
                .removeClass('btn');       
                
                //하얗게
        $('#start-btn').addClass('btn')       
                .removeClass('c-btn');
                //파랗게
        }
})



//오늘날짜 이후는 선택못하게 제한설정
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("end-day").setAttribute("max", today);
document.getElementById("start-day").setAttribute("max", today);

})