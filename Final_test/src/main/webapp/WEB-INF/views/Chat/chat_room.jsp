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
		var ws;
		
		function wsOpen(){
			ws = new WebSocket("ws://" + location.host + "/boat/chating");
			wsEvt();
		}
		
		function wsEvt() {
			ws.onopen = function(data){
				//소켓이 열리면 동작
			}
			
			ws.onmessage = function(data) {
				//메시지를 받으면 동작
				var msg = data.data;
				if(msg != null && msg.trim() != ''){
					var d = JSON.parse(msg);
					if(d.type == "getId"){
						var si = d.sessionId != null ? d.sessionId : "";
						if(si != ''){
							$("#sessionId").val(si); 
						}
					}else if(d.type == "message"){
						if(d.sessionId == $("#sessionId").val()){
							$(".chat-body").append("<p class='me'>나 :" + d.msg + "</p>");	
						}else{
							$(".chat-body").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
						}
							
					}else{
						console.warn("unknown type!")
					}
				}
			}

			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){ //enter press
					send();
				}
			});
		}
		
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
		
		function send() {
			var option ={
				type: "message",
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val(),
				msg : $("#chatting").val()
			}
			ws.send(JSON.stringify(option))
			$('#chatting').val("");
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
		<div class="col-md-8 bg-white ">
		<div class="chat-message">
			<ul class="chat">
			<li class="left clearfix">
				<span class="chat-img pull-left">
					<img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">John Doe</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 12 mins ago</small>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
			</li>
			<li class="right clearfix">
				<span class="chat-img pull-right">
					<img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">Sarah</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 13 mins ago</small>
					</div>
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at.
					</p>
				</div>
			</li>
			<li class="left clearfix">
				<span class="chat-img pull-left">
					<img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">John Doe</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 12 mins ago</small>
					</div>
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					</p>
				</div>
			</li>
			<li class="right clearfix">
				<span class="chat-img pull-right">
					<img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">Sarah</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 13 mins ago</small>
					</div>
					<p>
					 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at.
					</p>
				</div>
			</li>
			<li class="left clearfix">
				<span class="chat-img pull-left">
					<img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">John Doe</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 12 mins ago</small>
					</div>
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					</p>
				</div>
			</li>
			<li class="right clearfix">
				<span class="chat-img pull-right">
					<img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">Sarah</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 13 mins ago</small>
					</div>
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at.
					</p>
				</div>
			</li>
			<li class="right clearfix">
				<span class="chat-img pull-right">
					<img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">Sarah</strong>
						<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 13 mins ago</small>
					</div>
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at.
					</p>
				</div>
			</li>
		</ul>
		</div>
		<!-- 메세지 작성 -->
		<div class="chat-box bg-white">
			<div class="yourName">
				<span>사용자명</span>
				<input type="text" class="form-control border no-shadow no-rounded" placeholder="Type your message here"
						name="userName" id="userName">
				<span class="input-group-btn">
					<button onclick="chatName()" class="btn btn-success no-rounded" type="button" id="startBtn">Send</button>
				</span>
			</div>
			<div class="yourMsg">
				<span>메시지</span>
				<input type="text" class="form-control border no-shadow no-rounded" placeholder="보내실 메시지를 입력하세요."
						id="chatting">
				<span class="input-group-btn">
					<button onclick="send()" class="btn btn-success no-rounded" type="button" id="sendBtn">Send</button>
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