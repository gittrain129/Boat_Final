<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script>
  var paging = "";
	            		  
	            		  //이전페이지
	            		  if(response[0].maxpage <=1){
	            		  paging += '<li class="page-item" id="prev-btn"><a class="page-link gray" href="#" data-page="이전">이전</a></li>';
	            		  }else{
	            		  paging += '<li class="page-item" id="prev-btn"><a class="page-link" href="#" data-page="이전">이전</a></li>';
	            		  }
	            		  
	            		  
	            		  //1페이지 고정생성
	            		  paging += `<li class="page-item active"><a class="page-link" href="#" data-page=1>1</a></li>`;
	            		  
	            		  //본페이지
	            		  for (var i = 2; i <= response[0].maxpage; i++) {
	            		      paging += `<li class="page-item"><a class="page-link" href="#" data-page=`+i+`>`+i+`</a></li>`;
	            		  }
	            		  
	            		  var max = response.length;
	            		  if(response[max-1].page >= response[0].maxpage){
		            		  paging += '<li class="page-item" id="next-btn"><a class="page-link gray" href="#" data-page="다음">다음</a></li>';
		            		  }else{
		            		  paging += '<li class="page-item" id="next-btn"><a class="page-link" href="#" data-page="다음">다음</a></li>';
		            		  }
	            		  
	            		  

	            		  $("#pagination").append(paging);

	            		  if (response[0].maxpage <= 1) {
	            		      // If there is only one page, disable the prev and next buttons
	            		      $("#prev-btn").addClass("disabled");
	            		      $("#next-btn").addClass("disabled");
	            		      $("#prev-btn a").addClass("gray");
	            		      $("#next-btn a").addClass("gray");
	            		  }
						
	            		  
	            		  $("#prev-btn").on("click", function(event) {
	            		      event.preventDefault();
	            		      if (!$(this).hasClass("disabled")) {
	            		         var page = parseInt($(".page-item.active a").data("page"));
	            		         
	            		         console.log('여기');
	            		          console.log(page);
	            		          
	            		          if (page > 1) {
	            		              page--;
	            		              var tab = $('.nav-tabs .active').text();
	            		              var url = "admitTab_ajax_page?page=" +page+ "&tab=" +tab;
	            		              window.location.href = url;
	            		          }
	            		      }
	            		  });

	            		  $("#next-btn").on("click", function(event) {
	            		      event.preventDefault();
	            		      if (!$(this).hasClass("disabled")) {
	            		          var page = parseInt($(".page-item.active a").data("page"));
	            		          var maxPage = parseInt($("#pagination li:nth-last-child(2) a").data("page"));
	            		          	            		          
	            		          if (page < maxPage) {
	            		              page++;
	            		              var tab = $('.nav-tabs .active').text();
	            		              var url = "admitTab_ajax_page?page=" +page+ "&tab=" +tab;
	            		              window.location.href = url;
	            		          }
	            		      }
	            		  });

	            		  
	            		  $("#pagination").on("click", "a.page-link", function(event) {
	            		      event.preventDefault();
	            		      alert($(this).text());
	            		      var compare = $(this).text();
	            		      if(compare !== '이전' && compare !== '다음' ){
	            		      var page = $(this).data("page");
	            		      var tab = $('.nav-tabs .active').text();
	            		      var url = "admitTab_ajax_page?page=" +page+ "&tab=" +tab;
	            		      window.location.href = url;
	            		      
	            		      $(".page-item.active").removeClass("active");
	            		      $(this).parent().addClass("active");
	            		      }
	            		  });

	            	




	            	</script>






























</html>