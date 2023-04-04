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
    			<a href="${pageContext.request.contextPath}/board/Write" class="btn btn-success btn-sm ml-3"><i class="fas fa-plus"></i> 글쓰기</a>
  			</div>
		</div>


				<div class="table-responsive">
					<table class="table table-bordered table-hover mx-auto">
						<thead>
							<tr class="bg-light">
								<th title="like" style="text-align: center; vertical-align: middle" onclick=favorite(${b.BOARD_EMPNO})>즐겨<br>찾기</th>
								<th title="Discussion List" style="text-align: center; vertical-align: middle">제목</th>
								<th class="bg-light" title="Created By" style="text-align: center; vertical-align: middle">작성자</th>
								<th title="Total Replies" style="text-align: center; vertical-align: middle">조회수</th>
								<th title="Last Updated" style="text-align: center; vertical-align: middle">작성일</th>
							</tr>
						</thead>
						<tbody>
							 <c:set var="num" value="${listcount-(page-1) * limit }"/>
							 <c:forEach var="b" items="${boardlist }">
							<tr>
								<!-- 즐겨찾기 여부 -->
								<td title="like" class="text-center"><i class="bi bi-star" id="star${b.BOARD_NUM }" onclick="toggle(${b.BOARD_NUM},${b.BOARD_EMPNO })"></i></td>
								
								<!-- 제목 new뱃지 dept뱃지/공지 -->
								<td style="display: flex; align-items: center;">
								 <c:if test="${b.BOARD_RE_LEV !=0 }"><%--답글인경우 --%>
            						<c:forEach var="a" begin="0" end="${b.BOARD_RE_LEV*2 }" step="1">
            						&nbsp;	
            						</c:forEach>
            						<img src='${pageContext.request.contextPath}/resources/image/line.gif'>
         						</c:if>
         						<c:if test="${b.BOARD_RE_LEV ==0 }"><!--  원문 인경우 -->
         	 						&nbsp;
         						</c:if>
								<a href="detail?num=${b.BOARD_NUM }" style="flex: 1; font-size:90%">
								<c:out value="${b.BOARD_SUBJECT}" escapeXml="true"/> 
								<span class="gray small">[<c:out value="${b.CNT}"/>]</span>
								</a>
								
								<c:set var="ntime" value="<%= new java.util.Date() %>" />
								<c:set var="dateFormat" value="yyyy-MM-dd HH:mm:ss" />
								<c:set var="boardDate" value="<%= new java.text.SimpleDateFormat("+ dateFormat+" ).format(+"${b.BOARD_DATE}+") %>" />

<c:if test="${boardDate ge dateFormat}">



	 		      	  			<img src="${pageContext.request.contextPath}/resources/jkKim/image/new.jpg" id="new">
	 		      	  			</c:if>
								<div class="ml-auto"><span	class="badge badge-pill badge-warning float-right" style="background-color: #89a5ea;">${b.BOARD_DEPT }</span></div>
								</td>
								
								
								<!-- 글쓴이 -->
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>${b.BOARD_NAME }</small></div></td>
								
								<!-- 조회수 -->
								<td><div style="display: flex; justify-content: center; align-items: center;">${b.BOARD_READCOUNT }</div></td>
								
								<!-- 올린날짜 -->
								<td><div style="display: flex; justify-content: center; align-items: center;">${b.BOARD_DATE }</div></td>
							</tr>
							</c:forEach>
							
							
							<tr>
								<td title="like" class="text-center"><i class="bi bi-star" ></i></td>
								<td style="display: flex; align-items: center;">
								<a href="discussion-detail.html" style="flex: 1; font-size:90%">90% 가나다라마바사 한국어로 적어보기</a>
								<div><span	class="badge badge-pill badge-warning" style="background-color: #89a5ea;">new</span></div>
								<div class="ml-auto"><span class="badge badge-pill badge-primary float-right" style="background-color: #ffcb6b;">공지</span></div>
								</td>
								<td><div style="display: flex; justify-content: center; align-items: center;"><small>Mr. Felton Paucek II</small></div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">256</div></td>
								<td><div style="display: flex; justify-content: center; align-items: center;">1 week ago</div></td>
							</tr>
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<nav class="pt-3" aria-label="Page navigation example">
										<ul class="pagination">
				<c:if test="${page<=1}">
					<li class="page-item">
						<a class="page-link gray">이전&nbsp;</a>
					</li>
				</c:if>
				<c:if test="${page>1}">
					<li class="page-item">
						<a href="list?page=${page-1}" class="page-link">이전&nbsp;</a>
					</li>
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a==page }">
						<li class="page-item active">
							<a class="page-link">${a}</a>
						</li>
					</c:if>
					<c:if test="${a!=page }">
						<li class="page-item">
							<a href="list?page=${a}" class="page-link">${a}</a>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage }">
						<li class="page-item">
							<a class="page-link gray">&nbsp;다음</a>
						</li>
				</c:if>
				<c:if test="${page < maxpage }">
						<li class="page-item">
							<a href="list?page=${page+1}" class="page-link">&nbsp;다음</a>
						</li>
				</c:if>
		
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

<script src = "${pageContext.request.contextPath}/jkKim/js/list.js"></script>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

function toggle(BOARD_NUM,BOARD_EMPNO) {
	
	
	var star = document.getElementById('star+BOARD_NUM');
	star1.classList.remove('bi-star');
	star1.classList.add('bi-star-fill');
	
	var board_num = BOARD_NUM;
	//var board_empno = BOARD_EMPNO;
	var board_empno = 2310009;
	console.log(board_num);
	console.log(board_empno);
	
	$.ajax({
        url: "${pageContext.request.contextPath}/board/Fav_add",
        type: 'POST',
        data: {
            "BOARD_NUM": board_num,
            "BOARD_EMPNO": board_empno
        },
        beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
          xhr.setRequestHeader(header, token);         
       },
        success: function(response) {
          // 성공시 테이블바디 재구성
        },
        error: function(request,error) {
            
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});//add_ajax 끝
}//toggle 끝

function favorite(BOARD_EMPNO) {
	//var board_empno= BOARD_EMPNO
	var board_empno= 2310009;
	
	$.ajax({
        url: "${pageContext.request.contextPath}/board/Fav_list",
        type: 'POST',
        data: {
               "BOARD_EMPNO": board_empno
        },
        beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
          xhr.setRequestHeader(header, token);         
       },
        success: function(data) {
        	$("tbody").remove();
        	$("tfoot").remove();
        	
        	let output = "<tbody>";
			
			$(data.boardlist).each(
				
				function(index, item){
					
					output += "<tr>"
					output += "<td title='like' class='text-center'><i class='bi bi-star-fill' id='star" + item.board_NUM +"'onclick='toggle("+ item.board_NUM + "," + item.board_EMPNO+ "})'></i></td>"
					
					const blank_count = item.board_RE_LEV * 2 + 1;
					
					let blank = '&nbsp;'; //답글일 때 들여쓰기
					
					for (let i = 0; i<blank_count; i++){
						blank += '&nbsp;&nbsp';
					}
					
					let img="";
					if (item.board_RE_LEV > 0){
						img="<img src='${pageContext.request.contextPath}/resources/image/line.gif'>";
					}
					
					let subject=item.board_SUBJECT.replace(/</g,'&lt')
					subject = subject.replace(/</g,'&gt')
					
					
					output += "<td style='display: flex; align-items: center;'>" + blank + img;
					output += "<a href='detail?num="+item.board_NUM + "' style='flex: 1; font-size:90%''>";
					
					output += subject + '<span class="gray small">['+item.cnt+']</span></a>';
					output += "<div><span	class='badge badge-pill badge-warning' style='background-color: #89a5ea;'>new</span></div>";
					output += "<div class='ml-auto'><span	class='badge badge-pill badge-warning float-right' style='background-color: #89a5ea;'>기획팀</span></div></td>";
					output += "<td><div style='display: flex; justify-content: center; align-items: center;'><small>" +item.board_NAME+" </small></div></td>";
					output += "<td><div style='display: flex; justify-content: center; align-items: center;'>"+item.board_READCOUNT+"</div></td>";
					output += "<td><div style='display: flex; justify-content: center; align-items: center;'>"+item.board_DATE +"</div></td>"
				})
				output += "</tbody>"
				
				console.log(output);
				$('table').append(output); 
				
				
        },
        error: function(request,error) {
            
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});//add_ajax 끝
}
	

</script>
</body>
</html>