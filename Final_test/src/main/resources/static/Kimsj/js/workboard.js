	function go(page,category) {
		
		$('.breadcrumb-item').removeClass('active'); 
		$('.breadcrumb-item a').addClass('text-white'); 
		$('a[href="javascript:go(1,\''+category+'\')"]').removeClass('text-white');
		$('a[href="javascript:go(1,\''+category+'\')"]').parent('li').addClass('active'); 
		
		
		const data = `category=${category}&page=${page}`;
		
		ajax(data); 
	}
	
	
	
$(function(){

	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
	$("#workboard_card table").hide(); //1
	let page=1; //더 보기 에서 보여줄 페이지를 기억할 변수
	const count = parseInt($("#runm").text());
	if (count != 0){ //댓글 갯수가 0이 아니면
		getList(1); //첫 페이지의 댓글을 구해 옵니다. (한 페이지에 3개씩 가져 옵니다.)
	} else { //댓그링 없는 경우
		$("#message").text("등록된 댓글이 없습니다.")
	}
	
	let num=0;
	let url ='';
	let data = {};
	let profileFile = $("#login_img").val();
	
	
	


	function getList(currentPage) {
		$.ajax({
				type: "post",
				url : "../workboard/list",
				data: {
						"page" : currentPage
				},
				beforeSend : function(xhr)
		        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
		        	xhr.setRequestHeader(header, token);			
		        },
				dataType :  "json",
				success : function(rdata) {

					if(rdata.list.length > 0) {
						$("#workboard_card table").show();  //문서가 로딩될 때 hide() 했던 부분을 보이게 합니다.(1)
						$("#workboard_card tbody").empty();
						
						$(rdata.list).each(function() {
							let output = '';
							let img = '';
							
							
							if($("#login_id").val() == this.empno) {
								img = "<img src='../resources/img/pencil2.png' class='update' style='width: 20px; margin-right: 10px;'>"
									+ "<img src='../resources/img/delete.png' class='remove' style='width: 20px;'>"
									+ "<input class='board"+ this.num +"' type='hidden' value='" + this.num + "'>";

							}
							
							
						output +=	'<hr class="border-danger mb-4 mt-4" />' +
									'<br>' +
									'<div class="card" style="boarder-top:15px;">' +
					                '<div class="card-header" style="background-color:#1ca7ff; color:white;">' + this.category + '</div>' +
					                '<div class="card-body" style="height: 250px;">' +
					                '<div class="row">' +
					                '<div class="col-sm-2" style="text-align:center;margin-top: 30px;font-size: 20px;">' +
					                
					                '<img class="mr-3 rounded img-thumbnail" src="' +this.profile_FILE + '" alt="프로필 사진" style="border-radius: 50% !important; width: 110px">' +
					                
					                '<h6 class="mt-2" style="top: 5px;position: relative;font-size: 20px;color: #6c757d !important;">' + this.empno + '</h6>' +
					                '<small class="text-muted">' + this.name + '</small>' +
					                '</div>' +
					                '<div class="col-sm-9 border-left border-secondary" style="border: 1px solid #dfdfdf !important;width:  800px !important;height: 230px !important;border-radius: 6px;">' +
					                '<p style="margin-top: 1rem; font-size:20px;">' + this.subject + '</p>' +
					                '<hr>' +
					                '<p style="font-size: 17px">' + this.content + '</p>' +
					                '</div>' +
					                '</div>' +
					                '</div>' +
					                '<div class="card-footer text-muted">' + 
					                '<div style="float: left;">' + this.reg_date + '</div>' +
					            	'<div style="width: 80px; float: right;">' + img + '</div>' +
					                '</div>' +
					                '</div>' +
					                '<br>'
							
						
							
							$("#workboard_card tbody").append(output);
											
							//append한 마지막 tr의 2번재 자식 td를 찾아 text()메서드로 content를 넣습니다.
							$("#workboard_card tbody tr:last").find("td:nth-child(2)").text(this.workboard_card); //3
							
						}); //each end
						
						//전체갯수 > 현재 가져온 갯수  => 가져올 데이터가 존재
						if(3 < rdata.list.length){ //전체 댓글 갯수 -> 현재까지 보여준 댓글 갯수
							$("#message").text("더보기")
						} else {
							$("#message").text("")
						}
						
						 
					} else {
						$("#message").text("등록된 댓글이 없습니다.")
						
						$("#workboard_card table").hide()//1
					}
				}
		}); //ajax end
	}//function end
	

	
	
	//글자수 50개 제한하는 이벤트
	$("#content").on('input', function() {
		let content = $(this).val();
		let length = content.length;
		if (length > 50) {
			length = 50;
			content = content.substring(0, length);
			$(this).val(content);
		}
		$(".float-left").text(length + "/50")
	})
	
	
	//더보기를 클릭하면 page 내용이 추가로 보여집니다.
	$("#message").click(function() {
		getList(++page);
	}); //click end
	
	
	//등록 또는 수정완료 버튼을 클릭한 경우
	//버튼의 라벨이 '등록'인 경우는 댓글을 추가하는 경우
	//버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우
	$("#write").click(function() {
		const content = $("#content").val().trim();
		const subject = $("#subject").val().trim();
		if(!subject){
			alert('제목을 입력하세요')
			return false;
		}else if(!content){
			alert('내용을 입력하세요')
			return false;
		}
		
		const buttonText = $("#write").text().trim(); // 버튼의 라벨로 add할지 update할지 결정
		
		$(".float-left").text('총 50자까지 가능합니다.');
		
		if (buttonText == "등록") {  // 댓글을 추가하는 경우
		console.log('확인')
		
			url = "../workboard/add";
			data = {
				"category" : $("#category option:checked").text(),
				"content" : content,
				"EMPNO" : $("#login_id").val(),
				"NAME" : $("#login_name").val(),
				"DEPT" : $("#login_dept").val(),
				"subject" : $("#subject").val(),
				"PROFILE_FILE" : profileFile
			};
		} else { // 댓글을 수정하는 경우
			url = "../workboard/update";
			data = {
					"num" : num,
					"content" : content
			};
			$("#write").text("등록"); // 다시 등록으로 변경
			$("#workboard_view.cancel").remove(); //취소 버튼 삭제
		
		}
		
		$.ajax({
			type : "post",
			url : url,
			data : data,
			beforeSend : function(xhr)
	        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
	        	xhr.setRequestHeader(header, token);			
	        },
			success : function(result){
			console.log(result)
				$("#content").val('');
				$("#category").val('0');
				$("#subject").val('');
				
				if (result == 1) {
					//page=1
					getList(page); //등록, 수정완료 후 해당 페이지 보여줍니다.
				}//if
			}//success
			,error:function(error){console.log(error)}
		})	//ajax end
	}) //$("#write") end
	
	
	
	// pencil2.png를 클릭하는 경우(수정)
	$("#workboard_card").on('click', '.update', function() {
		const before = $(this).parent().prev().text(); //선택한 내용을 가져옵니다.
		$("#workboard_card").focus().val(before); //textarea에 수정 전 내용을 보여줍니다.
		num = $(this).next().next().val(); //수정할 댓글번호를 저장합니다.
		$("#write").text("수정완료"); //등록버튼의 라벨을 '수정완료'로 변경합니다.
		
		//이미 취소 버튼이 만들어진 상태에서 또 수정을 클릭하면 취소가 계속 추가됩니다.
		if(!$("#write").prev().is(".cancel"))
		  $("#write").before('<button class="btn btn-danger float-right cancel">취소</button>');
		  
		//모든 행의 배경색을 'white'로 지정합니다.
		$("#workboard_card tr").css('background-color', 'white');
		
		//선택한 행의 배경색을 'lightgray'로 지정합니다.
		$(this).parent().parent().css('background-color', 'lightgray'); // 수정할 행의 배경색을 변경합니다.
		$(".remove").prop("disabled",true); //[수정완료][취소] 중에는 삭제를 클릭할 수 없도록 합니다.
	})
	
	
	
	//취소를 클릭하는 경우
	$("#workboard_card").on('click', '.cancel', function() {
		$("#workboard_card tr").removeAttr('style'); //<tr style="background-color: white;">
											  //<tr style="background-color: lightgray;">
											  //style 속성을 제거 합니다.
		$(this).remove(); //선택한 취소 버튼을 제거합니다.
		$("#write").text("등록"); //$("#write")의 "수정완료" 라벨을 "등록"으로 변경합니다.
		$("#workboard_view").val(''); //$("#workboard_view")의 값을 초기화 합니다.
		$(".remove").prop("disabled",false); //삭제 할 수 있도록 합니다.
	});
	
	
	
	// delete.png를 클릭하는 경우
	$("#workboard_card").on('click', '.remove', function() {
		if(!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		const deleteNum = $(this).next().val(); //댓글번호
		$.ajax({
			type : "post",
			url : "../workboard/delete",
			data : {
				"num" : deleteNum
			},
			beforeSend : function(xhr)
	        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
	        	xhr.setRequestHeader(header, token);			
	        },
			success : function(result) {
				if (result == 1) {
					//page=1;
					getList(page); //삭제 후 해당 페이지의 내용을 보여줍니다.
				}
			}
		}) // ajax end
	})



})

























