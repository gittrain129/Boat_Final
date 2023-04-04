let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

$(document).ready(function(){


	//submit할때 이벤트 부분
	$("form[action=add]").submit(function(){
		
		if($.trim($("#board_pass").val()) ==""){
			alert("비밀번호를 입력하세요");
			$("#board_pass").focus();
			return false;
		}
		if($.trim($("#board_subject").val()) ==""){
			alert("제목을 입력하세요");
			$("#board_subject").focus();
			return false;
		}
		if($.trim($("#board_content").val()) ==""){
			alert("내용을 입력하세요");
			$("#board_content").focus();
			return false;
		}
	}); //submit end
	

	
	
	
}); //ready() end