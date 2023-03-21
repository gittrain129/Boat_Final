<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Main/header.jsp" />
	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/filelist.css">
<style>
.float-right{float:right!important}
</style>
</head>
<body>
  <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">자료실 게시판</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a class="text-white" href="#"></a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#"></a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page"></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
<section class="container">
	<!--<div class="row">  -->
		<!-- <div class="col-lg-9 col-12 mb-4"> -->
		<h3 class="border-bottom pb-1 mb-4">자료실 게시판
			<a href="new-discussion.html" class="btn btn-success btn-sm float-right"><i class="fas fa-plus"></i> 수정
			</a>
		</h3>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="bg-light">
					<th>즐겨칮기</th>
						<th title="Discussion List">제목</th>
						<th class="bg-light" title="Created By">작성자</th>
						<th title="Total Replies">조회수</th>
						<th title="Last Updated">작성일</th>
						<th title="Last Updated">파일1</th>
						<th title="Last Updated">파일2</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td></td>
						<td>
						
							<a href="discussion-detail.html">자료실게시판 제목1
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Carroll Hintz</small></a></td>
						<td>538</td>
						<td>1 week ago</td>
						<td></td><td></td>
					</tr>
					<tr>
					<td></td>
						<td>
						
							<a href="discussion-detail.html">자료실게시판 제목1
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Carroll Hintz</small></a></td>
						<td>538</td>
						<td>1 week ago</td>
						<td></td><td></td>
					</tr>
					<tr>
					<td></td>
						<td>
						
							<a href="discussion-detail.html">자료실게시판 제목1
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Carroll Hintz</small></a></td>
						<td>538</td>
						<td>1 week ago</td>
						<td></td><td></td>
					</tr>
							
														</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<nav class="pt-3" aria-label="Page navigation example">
							  <ul class="pagination">
							    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
							    <li class="page-item active"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item"><a class="page-link" href="#">Next</a></li>
							  </ul>
							</nav>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	
	<!-- <div class="col-lg-3 col-12">
	<div class="list-group mb-4 shadow">
		<li class="list-group-item list-group-item-info"><strong>Recent Discussion</strong></li>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">Discussion 1 <span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">Discussion 1 <span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">Discussion 1 <span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">Discussion 1 <span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">Discussion 1 <span class="float-right badge badge-primary">123</span></a>
		<a href="discussion-detail.html" class="list-group-item list-group-item-action">Discussion 1 <span class="float-right badge badge-primary">123</span></a>
	</div>
	
	<div class="list-group mb-4 shadow">
		<li class="list-group-item list-group-item-info"><strong>Recent Users</strong></li>
		<a href="profile.html" class="list-group-item list-group-item-action">User 1 <span class="float-right badge badge-info">123</span></a>
		<a href="profile.html" class="list-group-item list-group-item-action">User 1 <span class="float-right badge badge-info">123</span></a>
		<a href="profile.html" class="list-group-item list-group-item-action">User 1 <span class="float-right badge badge-info">123</span></a>
		<a href="profile.html" class="list-group-item list-group-item-action">User 1 <span class="float-right badge badge-info">123</span></a>
		<a href="profile.html" class="list-group-item list-group-item-action">User 1 <span class="float-right badge badge-info">123</span></a>
		<a href="profile.html" class="list-group-item list-group-item-action">User 1 <span class="float-right badge badge-info">123</span></a>
	</div>
</div>	 -->
	</div>
</section>
<script type="text/javascript" src="public/lib/feather/feather.min.js"></script>
<script>
  feather.replace({
  	width:20
  })
</script>
	
	<footer class="container-fluid mt-5 bg-light border-top">
	<div class="pt-4 container">
    <!--     <div class="row">
          <div class="col-12 col-md">
            <img class="mb-2" src="../../assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
            <small class="d-block mb-3 text-muted">&copy; 2017-2018</small>
          </div>
          <div class="col}.float-right{float:right!important}-6 col-md">
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
        </div> -->
      </div>
	</footer>
</body>
</html>