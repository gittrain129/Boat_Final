<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>BOAT - 채팅</title>
	<link href="${pageContext.request.contextPath}/resources/ejyang/css/chat.css" type="text/css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<jsp:include page="../Main/header.jsp" />
	<script>
		$(function(){
			wsOpen()
		});
	
		var ws;
		
		function wsOpen(){
			ws = new WebSocket("ws://" + location.host + "/boat/chating"+$("#roomNumber").val());
			wsEvt();
		}
		
		function wsEvt() {
			ws.onopen = function(data){
				//소켓이 열리면 동작
			}
			
			ws.onmessage = function(data) {
				//메시지를 받으면 동작
				var msg = data.data;
				console.log('msg='+msg)
				
				//채팅 말풍성
				var input = '';//나
				var output = '';//상대방
				
				if(msg != null && msg.trim() != ''){
					var d = JSON.parse(msg);
					console.log('d='+d)
					console.log('d.type='+d.type)
					console.log('memberinfo.EMPNO='+${memberinfo.EMPNO})
					
					if(d.type == "getId"){
						var si = d.sessionId != null ? d.sessionId : "";
						if(si != ''){
							$("#sessionId").val(si); 
						}
					}else if(d.type == "message"){
							
						if(d.sessionId == $("#sessionId").val()){
							
							input += '<li class="left clearfix">';
							input += '<span class="chat-img pull-left">';
							input += '<img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar">';
							input += '</span>';
							input += '<div class="chat-body clearfix">';
							input += '<div class="header">';
							input += '<strong class="primary-font fs-6">나</strong>';
							input += '<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 12 mins ago</small>';
							input += '</div>';
							input += '<p class="me fs-6">' + d.msg + '</p>';
							input += '</div>';
							input += '</li>';
							
							$(".chat").append(input);	
						}else{
							
							output += '<li class="right clearfix">';
							output += '<span class="chat-img pull-right">';
							output += '<img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">';
							output += '</span>';
							output += '<div class="chat-body clearfix">';
							output += '<div class="header">';
							output += '<strong class="primary-font fs-6">'+d.userName+'</strong>';
							output += '<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 13 mins ago</small>';
							output += '</div>';
							output += '<p class="others fs-6">' + d.msg + '</p>';
							output += '</div>';
							output += '</li>';
							
							$(".chat").append(output);
						}
							
					}else{
						console.warn("unknown type!")
					}
				}
				
				const chatContainer = document.querySelector(".chat-message");
				setTimeout(() => {
					  chatContainer.scrollTop = chatContainer.scrollHeight;
					}, 100);
				
			}

			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){ //enter press
					send();
				}
			});
		}
		
		<!-- 
		function chatName(){
			var userName = $("#userName").val();
			if(userName == null || userName.trim() == ""){
				alert("사용자 이름을 입력해주세요.");
				$("#userName").focus();
			}else{
				wsOpen();
				$(".yourName").hide();
				$(".yourMsg").show();
			}
		}
		-->
		
		function send() {
			var message = $("#chatting").val().trim();
			if (!message) {
				toastr.options.escapeHtml = true;
	 		    toastr.options.closeButton = true;
	 		    toastr.options.newestOnTop = false;
	 		    toastr.options.progressBar = true;
	 		    toastr.info('내용을 입력해 주세요.', '채팅', {timeOut: 3000});
				return; 
			}
			
			var option ={
				type: "message",
				roomNumber: $("#roomNumber").val(),
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val(),
				msg : $("#chatting").val()
			}
			
			ws.send(JSON.stringify(option))
			$('#chatting').val("").focus();
			
		}
		
	</script>
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


<div class="container bootstrap snippets bootdey">
	<div class="row">
		<div class="col-md-4 bg-white ">
			<div class=" row border-bottom padding-sm" style="height: 40px;">Member</div>
			<ul class="friend-list">
				<li class="active bounceInDown">
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
						<div class="friend-name">
							<strong>John Doe</strong>
						</div>
						<div class="last-message text-muted">Hello, Are you there?</div>
						<small class="time text-muted">Just now</small>
						<small class="chat-alert label label-danger">1</small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_2.jpg" alt="" class="img-circle">
						<div class="friend-name">
						<strong>Jane Doe</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">5 mins ago</small>
						<small class="chat-alert text-muted"><i class="fa fa-check"></i></small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_3.jpg" alt="" class="img-circle">
						<div class="friend-name">
						<strong>Kate</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">Yesterday</small>
						<small class="chat-alert text-muted"><i class="fa fa-reply"></i></small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
						<div class="friend-name">
						<strong>Kate</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">Yesterday</small>
						<small class="chat-alert text-muted"><i class="fa fa-reply"></i></small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_2.jpg" alt="" class="img-circle">
						<div class="friend-name">
						<strong>Kate</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">Yesterday</small>
						<small class="chat-alert text-muted"><i class="fa fa-reply"></i></small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_6.jpg" alt="" class="img-circle">
						<div class="friend-name">
						<strong>Kate</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">Yesterday</small>
						<small class="chat-alert text-muted"><i class="fa fa-reply"></i></small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_5.jpg" alt="" class="img-circle">
						 <div class="friend-name">
						<strong>Kate</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">Yesterday</small>
						<small class="chat-alert text-muted"><i class="fa fa-reply"></i></small>
					</a>
				</li>
				<li>
					<a href="#" class="clearfix">
						<img src="https://bootdey.com/img/Content/user_2.jpg" alt="" class="img-circle">
						<div class="friend-name">
						<strong>Jane Doe</strong>
						</div>
						<div class="last-message text-muted">Lorem ipsum dolor sit amet.</div>
						<small class="time text-muted">5 mins ago</small>
						<small class="chat-alert text-muted"><i class="fa fa-check"></i></small>
					</a>
				</li>
			</ul>
		</div>

		<!-- 채팅 상세 -->
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		<div class="col-md-8 bg-white ">
		<div class="chat-message">
			<ul class="chat">
			<!-- 채팅 말풍선 -->
			</ul>
		</div>
		<!-- 메세지 작성 -->
		<div class="chat-box bg-white">
			<div class="yourName">
				<span>사용자명</span>
				<input id="userName" value="${memberinfo.DEPT}&nbsp;${memberinfo.NAME}">
			</div>
			<div class="yourMsg input-group">
				<input type="text" class="form-control border no-shadow no-rounded" placeholder="보내실 메시지를 입력하세요."
						id="chatting">
				<span class="input-group-btn">
					<button onclick="send()" class="btn btn-outline-primary no-rounded" type="button" id="sendBtn">전송</button>
				</span>
			</div>
		</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

	
</script>
<jsp:include page="../Main/footer.jsp" />
</body>
</html>