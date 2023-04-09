<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>BOAT - 채팅</title>
	<link href="${pageContext.request.contextPath}/resources/ejyang/css/chat.css" type="text/css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<jsp:include page="../Main/header.jsp" />
</head>
<body>


  <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">채팅</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                	<!-- 
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page">Our Team</li>
                     -->
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

		<!-- 채팅 컨테이너 -->
		<div class="row rounded-lg overflow-hidden shadow">
			<!-- 채팅방 목록 -->
			<div class="col-5 px-0">
				<div class="bg-white">
				
				    <div class="bg-gray px-4 py-2 bg-light">
				      	<p class="h5 mb-0 py-1">User List</p>
				    </div>

					<div class="messages-box">
			      		<div class="list-group rounded-0" id="userList">
			      		<%-- 채팅방 동적 생성 --%>
		      			</div>
			    	</div>
		  		</div>
			</div>
			<!-- 채팅방 목록 -->
			
			<!-- 채팅창 -->
			<div class="col-7 px-0">
			
				<div class="px-4 pt-5 chat-box bg-white" id="message">
				<%-- 메세지 동적 생성 --%>
				</div>
				
				<!-- 메세지 입력 창 -->
	        	<div class="input-group">
		          	<input type="text" id="chat" placeholder="메세지를 입력하세요." class="form-control rounded-0 border-0 py-4 bg-light">
		          	<div class="input-group-append">
		            	<button type="button" class="btn btn-link bg-white" id="sendBtn" onclick="send('message');">
		            		<i class="fa fa-paper-plane"></i>
		            	</button>
		          	</div>
	        	</div>
				<!-- 메세지 입력 창 -->
	    	</div>
		</div>
		<!-- 채팅창 -->

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

<script>
<!-- 변수 선언 -->
//let webSocket; 		// 웹소켓 전역변수//헤더에 있음
let uuid; 			// 상대방 고유 UUID

// HTML 전송 공통 AJAX
function ajaxForHTML(url, data, contentType, type){
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
	let htmlData;
	
	// HTML AJAX 통신
	$.ajax({
	    url : url,
	    data: data,
	    contentType: contentType,
	    type:type,
	 	// html(jsp)로 받기
	    dataType: "html",
	    async: false,
	    beforeSend : function(xhr)
		{   
			xhr.setRequestHeader(header, token);			
		},
	    // 성공 시
	    success:function(data){
	    	htmlData = data;
	    },
	    error:function(jqxhr, textStatus, errorThrown){
	       alert("ajax 처리 실패");
	    }
	});
	
	return htmlData;
}

$(function(){
	$("#userList").html(ajaxForHTML("userList", "GET"));
})

<!-- webSocket 연결
function connect(){
			
	// webSocket 연결되지 않았을 때만 연결
	if(webSocket == undefined){
		console.log("undefined")
		// webSocket URL
		let wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chating";
		// 연결
		webSocket = new WebSocket(wsUri);
		if(webSocket){
			webSocket.onopen = onOpen;
			webSocket.onmessage = onMessage;
			/* webSocket.onclose = onClose; */
		}
	}else{
		document.getElementById("message").innerHTML+="<br/>" + "<b>이미 연결되어 있습니다!!</b>";
	}
}
-->

<!-- webSocket 연결 성공 시 -->
function onOpen(){
	// 첫 로그인 시
	if("${sessionScope.loginUser}" === ""){
   		send('login');
	}
	// 새로고침 시
	else{
		send('onLineList');
	}
}

<!-- webSocket 메세지 발송 -->
function send(handle, secret){
	
	let data = null;
	let chatMessage = document.getElementById("chat");
	
	if(handle === "message"){
		if(!chatMessage.value){
			return;
		}
		
		data = {
			"handle" : "message",
			"content" : chatMessage.value
		}
		
		// 1:1 채팅방의 경우 uuid 추가
		if(secret === true){
			data.uuid = uuid;
		}
		
		// 채팅 메세지 초기화
		chatMessage.value = "";
	}else if(handle === "login"){
		data = {
			"handle" : "login"
		}
	}else if(handle === "logout"){
		data = {
			"handle" : "logout",
			"uuid" : "${sessionScope.loginUser.EMPNO}" || document.getElementById("loginUuid").value,
		}
	}else if(handle === "onLineList"){
		data = {
			"handle" : "onLineList"
		}
	}
	
	let jsonData = JSON.stringify(data);
	console.log("jsonData="+jsonData)
	console.log("webSocket="+webSocket)
	webSocket.send(jsonData);
}

//엔터로 채팅 전송
$(document).on('keydown', '#chat', function(e){
    if(e.keyCode == 13 && !e.shiftKey) {
    	
    	send('message',true);
    }
});

<!-- webSocket 메세지 수신 시 -->
function onMessage(evt){			
	
	// 수신한 메세지 (,)로 자르기
	let receive = evt.data.split(",");
	console.log("receive="+receive)
	let data = {};
	let count = 0;
		
	if(receive[0] === "message"){
		console.log("if(receive[0] == message")
        data = {
        	 "handle" : receive[0],
           	 "sender" : receive[1],
           	 "content" : receive[2],
           	 "uuid" : receive[3]
        }
	}else if(receive[0] === "login"){
        data = {
           	 "handle" : receive[0],
             "uuid" : receive[1]
        }
	}else if(receive[0] === "logout"){
        data = {
           	 "handle" : receive[0],
             "uuid" : receive[1]
        }
   	}else if(receive[0] === "onLineList"){
		data.handle = receive[0];
		for(let i = 1; i < receive.length; i++){
			data[count++] = receive[i];
		}
	}
	
    console.log("receivedata="+data[0])
    writeResponse(data);
}

<!-- webSocket 메세지 화면에 표시해주기 -->
function writeResponse(data){
	console.log("data="+data[0])
	// JSON.stringify() : JavaScript 객체 → JSON 객체 변환
	
	if(data.handle == "message"){
    	// HTML 데이터 받기
    	let messageData = ajaxForHTML("message", 
				        			  JSON.stringify(data), 
				        			  "application/json", "GET");
    	console.log("messageData="+messageData)
    	
    	// 채팅방에 메세지 추가
    	document.getElementById("message").innerHTML += messageData;
    	
    	// 채팅방 목록에 알림 효과
    	$("#" + data.uuid).addClass('temp');
    	
    	// 스크롤 하단 고정
    	$('#message').scrollTop($('#message').prop('scrollHeight'));
    	
	}else if(data.handle === "login"){
    	// [상대방 → 나] 로그인 표시
    	document.getElementById(data.uuid).innerHTML = "로그인";
	}else if(data.handle === "logout"){
		// [상대방 → 나] 로그인 제거
		document.getElementById(data.uuid).innerHTML = "";
	}else if(data.handle === "onLineList"){
		// [유저 목록 → 나] 로그인 표시
		for(let i = 0; i < Object.keys(data).length - 1; i++){
			document.getElementById(data[i]).innerHTML = "로그인";
		}
	}
}

//채팅창 공백
function chatClear(){
	document.getElementById("message").innerHTML=" ";
}

//채팅방 입장
function roomEnter(room){ 
	
	let bb = document.getElementsByClassName('active')[0];
	
	// 1. 채팅방 목록 리스트 CSS 변경
	// 활성화 되어 있는 방 클릭 시 [효과 X]
	if($(room).hasClass("active")){
		return;
	}
	if(bb !== undefined){
    	bb.classList.add('list-group-item-light');
    	bb.classList.remove('active', 'text-white');
	}
	
	room.classList.add('active', 'text-white');
	room.classList.remove('list-group-item-light');
	
	// 2. 현재 열려있는 채팅방 초기화

	// 3. secret true값으로 메세지 보내기
	// send('message', true);
	
	// 3. 상대방 UUID로 session 찾기 (1. 입장과 동시에 채팅방 집어넣기 or 첫 메세지 보낼 때 연결하기)
	uuid = room.dataset.uuid;
	
	// 4. 메세지 보내기 onClick 이벤트 변경
	$("#sendBtn").attr("onClick", "send('message', true)");
}

</script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<jsp:include page="../Main/footer.jsp" />
</body>
</html>