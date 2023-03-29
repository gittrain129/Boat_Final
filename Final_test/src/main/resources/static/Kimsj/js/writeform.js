$(document).ready(function() {

	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
			
	/*
		헤더의
		<span id="loginid">${pinfo.username}</span>님(로그아웃)
		값을 글쓴이 값으로 설정합니다.
	*/
	$("#board_name").val($("#loginid").text());
	
	

	
	// submit 버튼 클릭할 때 이벤트 부분
	$("form[action=add]").submit(function() {
		
		if($.trim($("#board_pass").val()) == ""){
			alert("비밀번호를 입력하세요");
			$("#board_pass").focus();
			return false;
		}
		
		if($.trim($("#board_subject").val()) == ""){
			alert("제목를 입력하세요");
			$("#board_subject").focus();
			return false;
		}
		
		if($.trim($("#board_content").val()) == ""){
			alert("내용을 입력하세요");
			$("#board_content").focus();
			return false;
		}
				
	}); //submit end
	
	
	$("#upfile").change(function() {
		console.log($(this).val())  //c:\fakepath\upload.png
		const inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	});
	
});// ready() end