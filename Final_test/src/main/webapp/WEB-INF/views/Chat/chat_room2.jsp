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
			<div class="input-group">
				<input class="form-control border no-shadow no-rounded" placeholder="Type your message here">
				<span class="input-group-btn">
					<button class="btn btn-success no-rounded" type="button">Send</button>
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