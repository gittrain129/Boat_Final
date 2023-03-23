$(document).ready(function(){
	//이메일 입력 유효성
	$('#email').keyup(function() {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $.trim($(this).val());
		if(pattern.test(email)){
			$('.btn-primary').attr("disabled", false);
			$('.css-1u2lazp').hide();
		}else {	
			$('.btn-primary').attr("disabled", true);
			$('.css-1u2lazp').show();
		}
		
		if(email=='') {
			$('.css-1u2lazp').hide();
		}
	});
	
	
});
