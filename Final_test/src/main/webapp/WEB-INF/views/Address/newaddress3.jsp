<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>BOAT - 주소록 </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<style>
.team-item .team-social{flex-wrap : wrap;
}
.emails{
   width: 100%;
}

</style>
  
 </head>
<body>

 <jsp:include page="../Main/header.jsp"/>
 <script src = "${pageContext.request.contextPath}/jkKim/js/addresslist.js"></script>

 <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white animated slideInDown mb-3">Our Team</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                	<li class="breadcrumb-item active"><a href="javascript:go(1,'전체부서')">전체부서</a></li>
                	<li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'홍보팀')">홍보팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'개발팀')">개발팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'인사팀')">인사팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'기획팀')">기획팀</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="javascript:go(1,'영업팀')">영업팀</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

  <!-- Team Start -->
    <div class="container-xxl pb-5" id="address-container">
    <div>
        <div class="container" id="addressbody">
        
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="section-title bg-white text-center text-primary px-3">${dept }</h6>
                <h1 class="display-6 mb-4">${title1 }<br> ${title2 }</h1>
            </div>
            
           
            <div class="row g-4">
            
            <c:forEach var="b" items="${boardlist }">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item text-center p-4">
					<img class="image-fluid border rounded-circle w-75 p-2 mb-4" style="height:230.98px;"
     				src="${pageContext.request.contextPath}/resources/${b.PROFILE_FILE}" 
       				onerror="this.src='${pageContext.request.contextPath}/resources/img/team-1.jpg';"
					>
      
                      
                        <div class="team-text">
                            <div class="team-title">
                                <h5>${b.DEPT} / ${b.NAME }</h5>
                                <span>${b.JOB }</span>
                                
                            </div>
                            <div class="team-social">
                            
                            	<span class="emails">${b.EMAIL}</span>
                                <c:if test="${b.AUTH == 'ROLE_ADMIN' || b.AUTH =='ROLE_MGR' }">
                                <a class="btn btn-square btn-primary rounded-circle" href=""><i class="bi bi-pencil-square"></i></a>
                                </c:if>
                                <a class="btn btn-square btn-primary rounded-circle" href=""><i class="bi bi-envelope"></i></a>   
                            </div>
                        </div>
                    </div>
                </div>
                
           </c:forEach>
            </div>
             </div>
             
         <nav class="pt-3 d-flex justify-content-center align-items-center" aria-label="Page navigation example" id="navpage">
  			<ul class="pagination mb-0 ">
  			
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
            </div>
            
       
    </div>
    <!-- Team End -->
    

    
     <jsp:include page="../Main/footer.jsp"/>
<script>
$(document).on('click', '#copy-email', function(){
	  // 클릭된 이메일 주소를 가져옵니다.
	  var email = $(this).prev('.emails').text();
	  
	  // 클립보드에 이메일 주소를 복사합니다.
	  var temp = $('<input>');
	  $('body').append(temp);
	  temp.val(email).select();
	  document.execCommand('copy');
	  temp.remove();
	  
	  // 알림 메시지를 표시합니다.
	  alert(email + '이(가) 복사되었습니다.');
	});

</script>
     
</body>
</html>