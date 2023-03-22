<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크보드 게시판</title>

	<jsp:include page="../Main/header.jsp"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Kimsj/lib2/fa-5/css/all.css" />	
	<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Kimsj/lib2/bootstrap-4/css/bootstrap.min.css" />  -->
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<section class="container" style="margin-top:150px !important;">
	<div class="row">
		<div class="col-lg-9 col-12">
		
	
		<h3>워크보드 게시판</h3>
		<hr class="border-secondary mb-4" />
			
		<h4 class="mb-4 mt-5 border-bottom  p-2">Add Reply</h4>
		<div class="table-responsive  mt-4">
			<table class="table">
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="_subject" class="form-control" name="" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea id="editor" name="_text" class="form-control" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-danger" name="" style="background-color:#1ca7ff; border-color:#1ca7ff;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
			
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		<div class="card">
		  <div class="card-header">
		    Reply Title
		  </div>
		  <div class="card-body">
		    <div class="row">
				<div class="col-sm-2">
				  	<a href="#">
				  		<img class="mr-3 rounded img-thumbnail" src="public/imgs/user.jpg" alt="Generic placeholder image">
				  	</a>
				  	<h6 class="mt-2"><a href="#">Username</a></h6>
				  	<small class="text-muted">Moderator</small>
				 </div>
				  <div class="col-sm-9 border-left border-secondary">
				    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				  </div>
			</div>
		  </div>
		  <div class="card-footer text-muted">
		  	2 days ago
		  </div>
		</div>
		<hr class="border-danger mb-4 mt-4" />
				
		
		
	</div>
	
	<div class="col-lg-3 col-12">
	<div class="list-group mb-4 shadow">
		<li class="list-group-item list-group-item-info"><strong>카테고리</strong></li>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">홍보팀<span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">개발팀<span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">인사팀<span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">기획팀<span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">영업팀<span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">동호회<span class="float-right badge badge-primary">123</span></a>
	</div>
	
	
</div>	
	</div>
</section>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Kimsj/lib2/sceditor/minified/themes/default.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/lib2/sceditor/minified/sceditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/lib2/sceditor/minified/formats/bbcode.js"></script>
<script>
// Replace the textarea #example with SCEditor
var textarea = document.getElementById('editor');
sceditor.create(textarea, {
	format: 'bbcode',
	style: 'lib/sceditor/minified/themes/content/default.min.css'
});
</script>
	
	<footer class="container-fluid mt-5 bg-light border-top">
	<div class="pt-4 container">
        <div class="row">
          <div class="col-12 col-md">
            <img class="mb-2" src="../../assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
            <small class="d-block mb-3 text-muted">&copy; 2017-2018</small>
          </div>
          <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Cool stuff</a></li>
              <li><a class="text-muted" href="#">Random feature</a></li>
              <li><a class="text-muted" href="#">Team feature</a></li>
              <li><a class="text-muted" href="#">Stuff for developers</a></li>
              <li><a class="text-muted" href="#">Another one</a></li>
              <li><a class="text-muted" href="#">Last time</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Resource</a></li>
              <li><a class="text-muted" href="#">Resource name</a></li>
              <li><a class="text-muted" href="#">Another resource</a></li>
              <li><a class="text-muted" href="#">Final resource</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Team</a></li>
              <li><a class="text-muted" href="#">Locations</a></li>
              <li><a class="text-muted" href="#">Privacy</a></li>
              <li><a class="text-muted" href="#">Terms</a></li>
            </ul>
          </div>
        </div>
      </div>
	</footer>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/lib2/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/lib2/bootstrap-4/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Kimsj/lib2/bootstrap-4/js/popper.min.js"></script>
</body>
</html>