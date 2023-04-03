$(document).ready(function(){
	//사진 첨부
    $("#upfile").on('change',function(){
		const reader = new FileReader();
		reader.readAsDataURL(event.target.files[0]);
					
		reader.onload = function() { //읽기에 성공했을 때 실행되는 이벤트 핸들러
			$('.profile img').attr('src', this.result); 
			$('.profile img').show();
			$(".profile label").removeAttr("style");
		};
	});

	//비밀번호 눈
    $('.fa-eye-slash').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye-slash")
            .prev('input').attr('type','password');
        }
    });
	
});

function onClickUpload() {
	let myInput = document.getElementById("upfile");
	myInput.click();
}

