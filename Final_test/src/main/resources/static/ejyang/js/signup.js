$(document).ready(function(){
	//이메일 입력 유효성
	$('#email').keyup(function() {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $.trim($(this).val());
		if(pattern.test(email)){
			$('.btn-primary').attr("disabled", false);
			$('input[type=email]').removeClass('is-invalid');
			$('#user_mail').hide().removeClass('invalid-feedback');
		}else {	
			$('.btn-primary').attr("disabled", true);
			$('input[type=email]').addClass('is-invalid');
			$('#user_mail').show().addClass('invalid-feedback');
		}
		
		if(email=='' || email.equls('')) {
			$('input[type=email]').removeClass('is-invalid');
			$('#user_mail').hide().removeClass('invalid-feedback');
		}
	});
	
	
	// Google Signin API
	  var googleUser = {};
	  function init() {
	    gapi.load('auth2', function() {
	      console.log("init()시작");
	      auth2 = gapi.auth2.init({
	        client_id: '197091871700-k9dnlhslvuj2truqml2kp0blr81o6ejm.apps.googleusercontent.com',
	        cookiepolicy: 'single_host_origin',
	      });
	      attachSignin(document.getElementById('google_login'));
	    });
	
});


// Google Signin API2
  function attachSignin(element) {
    auth2.attachClickHandler(element, {},
      function(googleUser) {
        var profile = googleUser.getBasicProfile();
        var id_token = googleUser.getAuthResponse().id_token;
        console.log('ID: ' + profile.getId()); 
        console.log('ID토큰: ' + id_token);
        console.log('Name: ' + profile.getName());
        console.log('Email: ' + profile.getEmail()); 
        $.ajax({
          url: 'loginGoogle',
          type: 'post',
          data: {
            "id" : <!-- 필요한 데이터 담기 -->,
            "pw" : <!-- 필요한 데이터 담기 -->,
            "username": profile.getName(),
            "email": profile.getEmail()
          },
          success: function (data) {
            alert("구글아이디로 로그인 되었습니다");
            location.href="/index";
          }
        });
      }, function(error) {
        alert(JSON.stringify(error, undefined, 2));
      });
    console.log("구글API 끝");
  }
});
