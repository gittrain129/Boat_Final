$(document).ready(function(){
	var valid_password = true;
	var valid_password_ck = false;
	var valid_name = true;
	
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
	
	//유효성 비밀번호
	$('#_label-pwd').keyup(function() {
		var pattern = /^[0-9a-zA-Z~?!@#$%^&*_-]{6,16}$/i;
		var pwd = $.trim($(this).val());
		
		if(pattern.test(pwd)){
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback3').hide();
			$('#_label-pwd-ck').removeClass('border-danger ');
			$('#validationServerUsernameFeedback4').hide();
			valid_password = true;
		}else {	
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback3').show();
			valid_password = false;
		}
		
		activateButton();
    });
    $('#_label-pwd').focusout(function() {
    	if($(this).val() == '' || $(this).length() < 6){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback3').show();
			valid_password = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback3').hide();
			valid_password = true;
		}
		
		activateButton();
    });
    
    //유효성 비밀번호 확인
	$('#_label-pwd-ck').keyup(function() {
		var pwdck = $.trim($(this).val());
		
		if(pwdck == $('#_label-pwd').val()){
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback4').hide();
			 valid_password_ck = true;
		}else {	
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback4').show();
			 valid_password_ck = false;
		}
		
		activateButton();
    });
    $('#_label-pwd-ck').focusout(function() {
    	if($(this).val() == '' || $(this).val().length() < 6){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback4').show();
			 valid_password_ck = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback4').hide();
			 valid_password_ck = true;
		}
		
		activateButton();
    });
    
    //유효성 이름
	$('#_label-name').keyup(function() {
		if($(this).val() == '' || $(this).val().length <= 2){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback5').show();
			 valid_name = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback5').hide();
			 valid_name = true;
		}
		
		activateButton();
    });
    $('#_label-name').focusout(function() {
    	if($(this).val() == '' || $(this).val().length <= 2){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback5').show();
			 valid_name = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback5').hide();
			 valid_name = true;
		}
		
		activateButton();
    });
    
    //버튼 활성화
	function activateButton() {
		console.log("===================")
		console.log("valid_password"+valid_password)
		console.log("valid_password_ck"+valid_password_ck)
		console.log("valid_name"+valid_name)
	    if (valid_password && valid_password_ck && valid_name) {
	      $('.submit').prop('disabled', false);
	    } else {
	      $('.submit').prop('disabled', true);
	    }
	  }
});

function onClickUpload() {
	let myInput = document.getElementById("upfile");
	myInput.click();
}

