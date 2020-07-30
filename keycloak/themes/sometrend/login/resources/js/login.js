const LOGIN = (function() {

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
    togglePasswordDisplay: togglePasswordDisplay,
  };
})();

$(function()  {
  LOGIN.togglePasswordDisplay();
});