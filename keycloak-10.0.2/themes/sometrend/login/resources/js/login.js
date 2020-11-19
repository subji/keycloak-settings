const LOGIN = (function() {

  /**
   * URL 에서 파라미터 값 조회
   * @param {*} parameterKey 
   */
  function parseUrlParameter(uri, parameterKey)  {
    let url = new URL(uri);
    let value = url.searchParams.get(parameterKey);
    return value;
  }

  /**
   * 회원 등록 후 이동할 페이지 추가
   */
  function setRegistrationUrl() {
    let $registerBtn = $('#registerBtn');
    let redirectUri = parseUrlParameter(window.location.href, 'redirect_uri');
    let clientId = parseUrlParameter(window.location.href, 'client_id');
    let redirectOrigin = new URL(redirectUri).origin;
    let redirectUrl = redirectOrigin + '/login?registration_redirect=/repeater';

    let registrationUrl = window.location.origin + '/auth/realms/vaiv-realm/protocol/openid-connect/registrations';
    let parameterUrl = '?client_id=' + clientId + '&response_type=code&scope=openid%20email&redirect_uri=' + redirectUrl;
    
    $registerBtn.attr('href', registrationUrl + parameterUrl);
  }
	
  /**
   * 패스워드 가리기/보이기
   */
  function togglePasswordDisplay() {
     //비밀번호 눈 클릭시 변경
    $('.password_icon').on('click',function(e){
      if($(this).parent().find('input').attr('type') ==  'password'){
        $(this).parent().find('input').attr('type','text');
        $(this).css({'background':'url(https://sometrend-res.some.co.kr/images/icon_password_on.png) no-repeat 50%'});
      } else {
        $(this).parent().find('input').attr('type','password');
        $(this).css({'background':'url(https://sometrend-res.some.co.kr/images/icon_password.png) no-repeat 50%'});
      }
    });
  }

  return {
    setRegistrationUrl: setRegistrationUrl, 
    togglePasswordDisplay: togglePasswordDisplay,
  };
})();

$(function()  {
	$("input[name=password]").on("keyup",function(e){
	    if(e.keyCode == 13){
	        $('#loginForm')[0].submit();
	    }
  });
  LOGIN.setRegistrationUrl();
  LOGIN.togglePasswordDisplay();
});