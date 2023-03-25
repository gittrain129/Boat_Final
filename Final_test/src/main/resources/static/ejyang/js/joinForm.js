$(document).ready(function(){
	
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
    
    //약관 모두 동의
    $('#agree_all').on('click',function(){
    	if($(this).is(":checked") == true) {
	    	$('#agree_chk').prop("checked", true);
	    	$('#agree_chk2').prop("checked", true);
    	}else {
	    	$('#agree_chk').prop("checked", false);
	    	$('#agree_chk2').prop("checked", false);
    	}
    });
    $('#agree_chk').on('click',function(){
	    if($('#agree_chk').is(":checked") == true && $('#agree_chk2').is(":checked") == true) {
	    	$('#agree_all').prop("checked", true);
	    }else{
	    	$('#agree_all').prop("checked", false);
	    }
    });
    $('#agree_chk2').on('click',function(){
	    if($('#agree_chk').is(":checked") == true && $('#agree_chk2').is(":checked") == true) {
	    	$('#agree_all').prop("checked", true);
	    }else{
	    	$('#agree_all').prop("checked", false);
	    }
    });
    
    //유효성 부서명
    $('.form-select').on('change',function(){
    	if($(this).val() == '부서명을 선택해 주세요'){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback').show();
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback').hide();
		}
		
		
		$.ajax({
 			url : "idcheck",
 			data : {"select":select},
 			success : function(resp){
 				if(resp == -1){//db에 해당 id가 없는 경우
 					$("#message").css('color','green').html("사용 가능한 아이디 입니다.");
 					checkid=true;
 				}else{//db에 해당 id가 있는 경우(0)
 					$("#message").css('color','blue').html("사용중인 아이디 입니다.");
 					checkid=false;
 				}
 			}
 		});//ajax end
		
		
    });
    $('.form-select').focusout(function() {
	    if($(this).val() == '부서명을 선택해 주세요'){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback').show();
		}else {
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback').hide();
		}
	});
	
	//유효성 사원번호
	$('.input-empno').focusout(function() {
    	if($(this).val() == ''){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback2').show();
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback2').hide();
		}
    });
	
	//유효성 비밀번호
	$('#_label-pwd').keyup(function() {
		var pattern = /^[0-9a-zA-Z~?!@#$%^&*_-]{6,16}$/i;
		var pwd = $.trim($(this).val());
		
		if(pattern.test(pwd)){
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback3').hide();
		}else {	
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback3').show();
		}
    });
    $('#_label-pwd').focusout(function() {
    	if($(this).val() == '' || $(this).val().length() < 6){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback3').show();
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback3').hide();
		}
    });
	
	//유효성 비밀번호 확인
	$('#_label-pwd-ck').keyup(function() {
		var pwdck = $.trim($(this).val());
		
		if(pwdck == $('#_label-pwd').val()){
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback4').hide();
		}else {	
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback4').show();
		}
    });
    $('#_label-pwd-ck').focusout(function() {
    	if($(this).val() == '' || $(this).val().length() < 6){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback4').show();
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback4').hide();
		}
    });
	
	//유효성 이름
	$('#_label-name').keyup(function() {
		if($(this).val() == ''){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback5').show();
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback5').hide();
		}
    });
    $('#_label-name').focusout(function() {
    	if($(this).val() == ''){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback5').show();
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback5').hide();
		}
    });
	element.classList.contains('이름');
	//가입하기 버튼 활성화
	if($('.form-select').val() != '' && $('.input-empno').val() != '' && $('#_label-pwd').val() != ''
		&& $('#_label-pwd-ck').val() != '' && $('#_label-name').val() != '') {
		$('.btn-primary').attr("disabled", false);
	}
    
    
});
