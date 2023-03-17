<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
 <head> 
  
  <title>업무 게시판</title>
  <link rel="stylesheet" type="text/css" href="/jkKim/css/all.css" />
	
 </head>
 <body>
 <jsp:include page="../Main/header.jsp"/>
 
	<section class="container">
	<div class="row">
		<div class="col-lg-9 col-12 mb-4">
		<h3 class="border-bottom pb-1 mb-4">Discussions
			<a href="new-discussion.html" class="btn btn-success btn-sm float-right"><i class="fas fa-plus"></i> Create New</a>
		</h3>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="bg-light">
						<th title="Discussion List"><i data-feather="list"></i></th>
						<th class="bg-light" title="Created By"><i data-feather="user-check"></i></th>
						<th title="Total Replies"><i data-feather="hash"></i></th>
						<th title="Last Updated"><i data-feather="clock"></i></th>
					</tr>
				</thead>
				<tbody>
																				<tr>
						<td>
							<a href="discussion-detail.html">Quos ut recusandae et consequuntur.
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Carroll Hintz</small></a></td>
						<td>538</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Id temporibus eius tempore nihil.
							<span class="badge badge-pill badge-warning float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Hans Pfannerstill</small></a></td>
						<td>256</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Qui id corporis nihil magnam.
							<span class="badge badge-pill badge-warning float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Mr. Felton Paucek II</small></a></td>
						<td>444</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Aut fugiat et consequuntur eveniet veniam placeat.
							<span class="badge badge-pill badge-warning float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Max Nikolaus</small></a></td>
						<td>892</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">In et magnam nesciunt aperiam atque est culpa.
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Geovanny Stark</small></a></td>
						<td>215</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Aliquid incidunt non unde eveniet possimus exercitationem qu...
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Max Nikolaus</small></a></td>
						<td>983</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Aspernatur optio consequatur quos ipsum qui sint.
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Carroll Hintz</small></a></td>
						<td>634</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Quidem aut cupiditate qui nihil hic.
							<span class="badge badge-pill badge-warning float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Mr. Felton Paucek II</small></a></td>
						<td>555</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Iusto explicabo ea in odio architecto.
							<span class="badge badge-pill badge-primary float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Hans Pfannerstill</small></a></td>
						<td>334</td>
						<td>1 week ago</td>
					</tr>
															<tr>
						<td>
							<a href="discussion-detail.html">Autem id consequatur consectetur et nobis consequuntur nulla...
							<span class="badge badge-pill badge-warning float-right">Admin</span>
							</a>
						</td>
						<td><a href="profile.html"><small>Geovanny Stark</small></a></td>
						<td>909</td>
						<td>1 week ago</td>
					</tr>
														</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
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
	
	
	</div>
</section>
<script type="text/javascript" src="public/lib/feather/feather.min.js"></script>
<script>
  feather.replace({
  	width:20
  })
</script>
	

 </body>
</html>