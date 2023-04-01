$(document).ready(function(){
	var valid_name = false;
	var valid_email = false;
	
	//이름 체크
	$('._input').keyup(function() {
		if($(this).val() == '' || $(this).val().length <= 2){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback').show();
			 valid_name = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback').hide();
			 valid_name = true;
		}
		
		activateButton();
    });
    $('._input').focusout(function() {
    	if($(this).val() == '' || $(this).val().length <= 2){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback').show();
			 valid_name = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback').hide();
			 valid_name = true;
		}
		
		activateButton();
    });
    
    //유효성 메일
	$('#email').keyup(function() {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $.trim($(this).val());
		if(pattern.test(email)){
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback2').hide();
			 valid_email = true;
		}else {	
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback2').show();
			 valid_email = false;
		}
		
		activateButton();
	});
	$('#email').focusout(function() {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $.trim($(this).val());
    	if($(this).val() == '' || !(pattern.test(email))){
			$(this).addClass('border-danger ');
			$('#validationServerUsernameFeedback2').show();
			 valid_email = false;
		}else {	
			$(this).removeClass('border-danger ');
			$('#validationServerUsernameFeedback2').hide();
			 valid_email = true;
		}
		
		activateButton();
    });
    
    //버튼 활성화
	function activateButton() {
		console.log("===================")
		console.log("valid_email"+valid_email)
		console.log("valid_name"+valid_name)
	    if (valid_email && valid_name) {
	      $('#form-controls button[type=submit]').prop('disabled', false);
	    } else {
	      $('#form-controls button[type=submit]').prop('disabled', true);
	    }
	  }
	
});