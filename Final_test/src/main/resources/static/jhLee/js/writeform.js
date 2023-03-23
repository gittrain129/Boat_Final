$(document).ready(function(){
	
	  $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        lang : "ko-KR",
	        height: 300
	      });
	      
	      
	      


	$('#deptbutton+div a').click(function(){
			const dept =$(this).text();
				console.log(dept)
			const sel =$('#deptsel').text();
			
		$('#deptsel').text(dept);
			console.log(sel)
		
			
		$('#dept').val(dept);
			console.log($('#dept').val())			
	
	})//drop downclick 끝
	
	

$("#upfile").change(function(){
	console.log($(this).val())
	const inputfile = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue').text(inputfile[inputfile.length -1]);
	$('.file2').css('display','block');
	});
$("#upfile2").change(function(){
	console.log($(this).val())
	const inputfile2 = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue2').text(inputfile2[inputfile2.length -1]);
	});
	
	
	//submit 버튼 클릭할 때 이벤트 부분
	$("form").submit(function(){
		
		if($.trim($("#board_subject").val()) == ""){
			alert("제목을 입력하세요");
			$("#board_subject").focus();
			return false;
		}
		
		if($.trim($("#board_name").val()) == ""){
			alert("성함을 입력하세요");
			$("#board_subject").focus();
			return false;
		}
		
		if($.trim($("#board_pass").val()) == ""){
			alert("비밀번호를 입력하세요");
			$("#board_pass").focus();
			return false;
		}
		
		if($.trim($(".board_content").val()) == ""){
			alert("내용을 입력하세요");
			$(".board_content").focus();
			return false;
		}
	});//submit end
	
});//ready() end