var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

function go(page) {
	var empno = $("#hidden-empno").val();
	const data = `BOARD_EMPNO=${empno}&page=${page}`;
	console.log(data)
	ajax(data);
}


function setPaging(href,digit){
	let active="";
	let gray="";
	if(href==""){ //href가 빈문자열인 경우
	console.log('href빈문자');
		if(isNaN(digit)){//이전&nbsp; 또는 다음&nbsp;
		
			gray="gray";
		}else{
			
			active="active";
		}
	}
	let output = '<li class="page-item ' + active + '">';
	let anchor = "<a class='page-link " + gray + "'" + href + ">" + digit + "</a></li>";
	console.log(anchor);
	//let anchor = `<a class='page-link ${gray}' ${href}>${digit}</a></li>`;
	output += anchor;
	return output;
}

function ajax(sdata){
	console.log(sdata)
	
	$.ajax({ //줄보기로 개수 바꾸면 그거에 맞게 새로고침안하고 변하게 하기 위해서 ajax쓴다.
		type : "POST",
		data : sdata,
		url : "../../boat/board/Fav_list",
		dataType : "json",
		cache : false,
		beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
        	xhr.setRequestHeader(header, token);			
        },
		success : function(data){
			$("tbody").remove();
        	
			let output = "<tbody>";
			
			$(data.boardlist).each(
				
				function(index, item){
					
					
					output += "<tr>"
			            output += "<td title='즐겨찾기' class='text-center'><i class='bi bi-star-fill' style='color:#ffd699' id='star" + item.board_NUM +"' onclick='toggle("+ item.board_NUM + ", ${EMPNO})'></i></td>"
			            const blank_count = item.board_RE_LEV * 2 + 1;
			            let blank = '&nbsp;'; //답글일 때 들여쓰기
			            for (let i = 1; i<blank_count; i++){
			                blank += '&nbsp;&nbsp';
			            }
			            let img="";
			            if (item.board_RE_LEV > 0){
			                img="<img src='${pageContext.request.contextPath}/resources/image/line.gif'>";
			            }
			            let subject=item.board_SUBJECT.replace(/</g,'&lt');
			            subject = subject.replace(/>/g,'&gt');
			            output += "<td style='display: flex; align-items: center;'>" + blank + img;
			            output += "<a href='detail?num="+item.board_NUM + "' style='flex: 1; font-size:90%''>";
			            output += subject + '<span class="gray small " style="margin-left:5px">['+item.cnt+']</span>';
			            //콘트롤러에서 nowday 보내줘야함********************
			            if(item.board_DATE > data.nowday){
			            	output += "<span class='badge badge-pill badge-warning' style='background-color: #89a5ea; margin-left:3px;'>new</span>";
			            }
			            output += "</a>";
			            if(item.board_NOTICE == 1){
			           		 output += "<span class='badge badge-pill badge-warning float-right' style='background-color: #ffcb6b;'>공지</span></td>";
			            }else if (item.board_NOTICE ==0){
				            output += "<span class='badge badge-pill badge-warning float-right' style='background-color: #89a5ea;'>"+item.board_DEPT+"</span></td>";

			            }
			            output += "<td><div style='display: flex; justify-content: center; align-items: center;'><small>" +item.board_NAME+" </small></div></td>";
			            output += "<td><div style='display: flex; justify-content: center; align-items: center;'>"+item.board_READCOUNT+"</div></td>";
			            output += "<td><div style='display: flex; justify-content: center; align-items: center;'>"
			            if(item.board_DATE != data.today){
			            	output += item.board_DATE.substring(5,10);
			            }
			            if( item.board_DATE.substring(0,10) == data.today ){
			            	output += " " + item.board_DATE.substring(11,16);
			            }
			            
			            "</div></td>"
			            output += "</tr>";
				})
				output += "</tbody>"
				
				$(output).insertAfter($("thead"));
				
			$(".pagination").empty();
			
				output = "";
			
				let digit = '이전&nbsp;';
				let href="";
				if(data.page > 1){
  				href = 'href=javascript:go(' + (data.page-1) + ')';
				}
				output += setPaging(href, digit);
			
				for (let i = data.startpage; i <= data.endpage; i++){
					console.log('for문')
  					digit = i;
  					href ="";
  					console.log('여기옴 i = '+ i);
  					console.log('여기옴 data.startpage =' + data.startpage);
  					console.log('여기옴 data.endtpage =' + data.endpage);
  					console.log('여기옴 data.page =' + data.page)
  						if ( i != data.page){
    							href = 'href=javascript:go(' + i + ')';
  					}			
  					   if (i == data.page) {
  					   			console.log('여기옴 i == data.page')
    							output += '<li class="page-item active"><a class="page-link">' + digit + '</a></li>';
  					} else {
    							output += setPaging(href, digit);
  				}
				}
			
				digit = '다음&nbsp;';
				href="";
					if (data.page < data.maxpage) {
  					href = 'href=javascript:go(' + (data.page + 1) + ')';
					}
					output += setPaging(href,digit);
				
				$('.pagination').append(output);

			}, //success end
			error : function() {
				console.log('에러');
			}
	})//ajax end
}//function ajax end


   $('#viewcount').change(function(){
      go(1); //보여줄 페이지를 1페이지로 설정
   });





//검색용
$(document).ready(function() {
    
  $('form').submit(function(event) {
    event.preventDefault();
	var search1 = $('input[name="search"]').val();
    var option1 = $('ul.dropdown-menu li a.active').text();
    $('#hidden-state').val('search');

    
    $.ajax({
      url: '../board/search',
      type: 'POST',
      data: {
        "search1": search1,
        "option1": option1,
        "dept": '부서별보기',
        "order": '정렬옵션'
      },
      beforeSend : function(xhr)
		        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
		          xhr.setRequestHeader(header, token);         
		       },
      success: function(data) {
        
       $("tbody").remove();
        	
			let output = "<tbody>";
			
			$(data.boardlist).each(
				
				function(index, item){
					
					
					output += "<tr>"
			            output += "<td title='즐겨찾기' class='text-center'><i class='bi bi-star-fill' style='color:#ffd699' id='star" + item.board_NUM +"' onclick='toggle("+ item.board_NUM + ", ${EMPNO})'></i></td>"
			            const blank_count = item.board_RE_LEV * 2 + 1;
			            let blank = '&nbsp;'; //답글일 때 들여쓰기
			            for (let i = 1; i<blank_count; i++){
			                blank += '&nbsp;&nbsp';
			            }
			            let img="";
			            if (item.board_RE_LEV > 0){
			                img="<img src='${pageContext.request.contextPath}/resources/image/line.gif'>";
			            }
			            let subject=item.board_SUBJECT.replace(/</g,'&lt');
			            subject = subject.replace(/>/g,'&gt');
			            output += "<td style='display: flex; align-items: center;'>" + blank + img;
			            output += "<a href='detail?num="+item.board_NUM + "' style='flex: 1; font-size:90%''>";
			            output += subject + '<span class="gray small " style="margin-left:5px">['+item.cnt+']</span>';
			            //콘트롤러에서 nowday 보내줘야함********************
			            if(item.board_DATE > data.nowday){
			            	output += "<span class='badge badge-pill badge-warning' style='background-color: #89a5ea; margin-left:3px;'>new</span>";
			            }
			            output += "</a>";
			            if(item.board_NOTICE == 1){
			           		 output += "<span class='badge badge-pill badge-warning float-right' style='background-color: #ffcb6b;'>공지</span></td>";
			            }else if (item.board_NOTICE ==0){
				            output += "<span class='badge badge-pill badge-warning float-right' style='background-color: #89a5ea;'>"+item.board_DEPT+"</span></td>";

			            }
			            output += "<td><div style='display: flex; justify-content: center; align-items: center;'><small>" +item.board_NAME+" </small></div></td>";
			            output += "<td><div style='display: flex; justify-content: center; align-items: center;'>"+item.board_READCOUNT+"</div></td>";
			            output += "<td><div style='display: flex; justify-content: center; align-items: center;'>"
			            if(item.board_DATE != data.today){
						  	output += item.board_DATE.substring(5,10);
			            }
			            if( item.board_DATE.substring(0,10) == data.today ){
			            	output += " " + item.board_DATE.substring(11,16);
			            }
			            
			            "</div></td>"
			            output += "</tr>";
				})
				output += "</tbody>"
				
				$(output).insertAfter($("thead"));
				
			$(".pagination").empty();
			
				output = "";
			
				let digit = '이전&nbsp;';
				let href="";
				if(data.page > 1){
  				href = 'href=javascript:go(' + (data.page-1) + ')';
				}
				output += setPaging(href, digit);
			
				for (let i = data.startpage; i <= data.endpage; i++){
					console.log('for문')
  					digit = i;
  					href ="";
  					console.log('여기옴 i = '+ i);
  					console.log('여기옴 data.startpage =' + data.startpage);
  					console.log('여기옴 data.endtpage =' + data.endpage);
  					console.log('여기옴 data.page =' + data.page)
  						if ( i != data.page){
    							href = 'href=javascript:go(' + i + ')';
  					}			
  					   if (i == data.page) {
  					   			console.log('여기옴 i == data.page')
    							output += '<li class="page-item active"><a class="page-link">' + digit + '</a></li>';
  					} else {
    							output += setPaging(href, digit);
  				}
				}
			
				digit = '다음&nbsp;';
				href="";
					if (data.page < data.maxpage) {
  					href = 'href=javascript:go(' + (data.page + 1) + ')';
					}
					output += setPaging(href,digit);
				
				$('.pagination').append(output);
      },
      error: function(error) {
        
        console.error(error);
      }
    });
  });

  
  $('ul.dropdown-menu li a').click(function(event) {
     var option = $(this).text();
    $(this).parents('.dropdown').find('.dropdown-toggle').text(option);
    $(this).addClass('active');
    $(this).parent().siblings().find('a').removeClass('active');
  });



  $('#drop-dept li a').click(function(event) {
  	var dept = $(this).text();
  	var order = $('#drop-order li a').text();
  	var state = $('#hidden-state').val();
  	var empno = $('#hidden-empno').val();
  	if(state == 'main'){
  	url= list_ajax
  	
  	} else if(state == 'fav') {
  	
  	} else if(state == 'search'){
  	
  	}
     
  });
  
   $('#drop-order li a').click(function(event) {
   var order = $(this).text();
   var dept = $('#drop-dept li a').text();
   var state = $('#hidden-state').val();
     
  });
  

  
  
});





