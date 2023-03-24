<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>업무 게시판</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jkKim/css/all.css" />

</head>
<body>
	<jsp:include page="../Main/header.jsp" />
	
	<!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">업무게시판</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page">Our Team</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

	<section class="container">
		<div class="row">
		
		
			<!-- <div class="col-lg-9 col-12 mb-4"> -->
<div class="col-lg-12 col-12 mb-2 d-flex align-items-center justify-content-between">
  <h3 class="pb-1 mb-2 flex-grow-1 align-self-start justify-content-start"> 업무용 게시판 </h3>
  <div class="d-flex align-items-center ml-auto">
    <div class="dropdown" style="margin-right: 20px;">
      <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
        Dropdown link
      </a>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
        <li><a class="dropdown-item" href="#">Action</a></li>
        <li><a class="dropdown-item" href="#">Another action</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
      </ul>
    </div>
    <div class="d-flex align-items-center ml-3">
      <input type="text" name="search" id="search" class="form-control" placeholder="Search...">
      <button class="btn ml-2" type="button"><i class="bi bi-search"></i></button>
    </div>
    <a href="boardWrite" class="btn btn-success btn-sm ml-3"><i class="fas fa-plus"></i> 글쓰기</a>
  </div>
</div>





				<div class="table-responsive">
					<table class="table table-bordered table-hover mx-auto">
						<thead>
							<tr class="bg-light">
								<th title="like" style="text-align: center; vertical-align: middle">즐겨<br>찾기</th>
								<th title="Discussion List" style="text-align: center; vertical-align: middle">제목</th>
								<th class="bg-light" title="Created By" style="text-align: center; vertical-align: middle">작성자</th>
								<th title="Total Replies" style="text-align: center; vertical-align: middle">조회수</th>
								<th title="Last Updated" style="text-align: center; vertical-align: middle">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td title="like" class="text-center"><i class="bi bi-bookmark-star"></i></td>
								
								<td style="display: flex; align-items: center;">
  								<a href="discussion-detail.html" style="flex: 1; ">100% 가나다라마바사 한국어로 적어보기</a>
  								<div class="ml-auto"><span class="badge badge-pill badge-primary float-right" style="background-color: #ffcb6b;">공지</span></div>
								</td>


								<td><div style="display: flex; justify-content: center; align-items: center;"><small>김정근</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">538</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1시간</div></td>

							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td><a href="discussion-detail.html" style="flex: 1; font-size:95%">95% 가나다라마바사 한국어로 적어보기<span class="badge badge-pill badge-warning float-right" style="background-color: #ffcb6b;">공지</span> </a></td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>홍길동</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td style="display: flex; align-items: center;">
								<a href="discussion-detail.html" style="flex: 1; font-size:90%">90% 가나다라마바사 한국어로 적어보기</a>
								<div><span	class="badge badge-pill badge-warning" style="background-color: #89a5ea;">new</span></div>
								<div><span	class="badge badge-pill badge-warning float-right" style="background-color: #89a5ea;">기획팀</span></div>
								</td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Mr. Felton Paucek II</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								
								<td style="display: flex; align-items: center;">
								<a href="discussion-detail.html" style="flex: 1;">Qui id corporisnihil magnam.</a>
  								<div class="ml-auto"><span class="badge badge-pill badge-primary float-right" style="background-color: #89a5ea;">홍보팀</span></div>
								</td>
								
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Max Nikolaus</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td style="display: flex; align-items: center;">
								<a href="discussion-detail.html" style="flex: 1;">In et magnam nesciunt aperiam atque est culpa.</a>
								<div class="ml-auto"><span class="badge badge-pill badge-primary float-right" style="background-color: #89a5ea;">홍보팀</span></div>
								</td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Geovanny	Stark</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td><a href="discussion-detail.html">Aliquid incidunt non unde eveniet possimus exercitationem qu... <span class="badge badge-pill badge-primary float-right" style="background-color: #89a5ea;">개발팀</span> </a></td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Max Nikolaus</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td><a href="discussion-detail.html">Aspernatur optio consequatur quos ipsum qui sint. <span class="badge badge-pill badge-primary float-right" style="background-color: #89a5ea;">개발팀</span></a></td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Carroll Hintz</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td><a href="discussion-detail.html">Quidem aut	cupiditate qui nihil hic. <span	class="badge badge-pill badge-warning float-right" style="background-color: #89a5ea;">기획팀</span></a></td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Mr. Felton Paucek II</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td><a href="discussion-detail.html">Iusto explicabo eain odio architecto. <span class="badge badge-pill badge-primary float-right" style="background-color: #89a5ea;">기획팀</span></a></td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Hans Pfannerstill</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star"></i></td>
								<td><a href="discussion-detail.html">Autem id consequatur consectetur et nobis consequuntur nulla... <span class="badge badge-pill badge-warning float-right" style="background-color: #89a5ea;">기획팀</span></a></td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Geovanny Stark</small></dvi></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<nav class="pt-3" aria-label="Page navigation example">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
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


		
	</section>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js"></script>
	<script>
		feather.replace({
			width : 20
		})
	</script>


</body>
</html>