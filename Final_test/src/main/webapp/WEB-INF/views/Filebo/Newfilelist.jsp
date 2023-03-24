<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../Main/header.jsp" />
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jhLee/css/filelist.css">
<style>
.float-right{float:right!important}


input[class='sharch']:focus{
 outline: none;
  width: 300px;
  text-align: left;
  border : none!important;}
  
  
.searchimg {
	width : 20px;
}


img {
	width: 10px
}
.search{text-align:right}
.btn-secondary {
color: white;
    background-color: #009CFF;
    border-color: #009CFF;
}
.btn-secondary:focus ,.btn-secondary:active {
    color: white;
    background-color:  #009CFF;
    border-color:  #009CFF;
    box-shadow: 0 0 0 0;
/*     box-shadow: 0 0 0 0.25rem rgba(101,101,101,0.5); */
}
.btn-secondary:hover {
    color: white;
    background-color: #009CFF;
    border-color: #009CFF;
}
.btn-check:focus+.btn, .btn:focus {
    outline: 0;
    box-shadow: 0 0 0 0;
}
#searhcbtn2{
border : none;
background-color: white;
}

</style>

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
		 
		 <!--검색 및 글쓰기  -->
   			<div class = 'search '>
     		
     
      
        

        <div class="btn-group search form-group">
        
           <input type="hidden" name = "searchsel" id = "searcselhval" value =" ${searchsel}">
            <div class="dropdown" >
    		  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    	    검색옵션
   			   </a>
		      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		        <li><a class="dropdown-item" href="#">작성자</a></li>
		        <li><a class="dropdown-item" href="#">제목</a></li>
		      </ul>
  		  </div>
 
          <input class ="search form-control" type="text" name="searchinput" id = "searchinput" value="${searchinput}" >
          		
          <button type="submit" class = "searchbutton search" id="searhcbtn2">
        	<img src="${pageContext.request.contextPath}/resources/jhLee/img/2.png"  class ="searchimg">
          </button>
          </div>
        </label>
        
			<a href="${pageContext.request.contextPath}/Filebo/writee" class="btn btn-success btn-sm float-right">
			<i class="fas fa-plus"></i> 글쓰기
			</a>
		</div>
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
						
							<%--<a href="detail?num=${b.BOARD_NUM}">자료실게시판 제목1
							
							<a href="detail">자료실게시판 제목1
							 --%>
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
	
	
	</div>
</section>
<script type="text/javascript" src="public/lib/feather/feather.min.js"></script>
<script>
  feather.replace({
  	width:20
  })
</script>
	
	<jsp:include page="../Main/footer.jsp" />
