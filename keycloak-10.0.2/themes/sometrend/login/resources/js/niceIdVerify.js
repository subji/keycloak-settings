$(function(){ 
	$('.verify-by-phone').off('click').on('click', function (event) {
		
		if(!(/Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor) && !/OPR/.test(navigator.userAgent) )){
			RESET_ALERT.show("Internet Explorer 에서는 지원되지 않는 기능입니다.<br> Chrome 브라우저 사용을 권장합니다.")
			return ;
		}
		
		
		
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.niceIdForm.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.niceIdForm.target = "popupChk";
		document.niceIdForm.submit();
	});
	
	$.ajax({
	    url: "/auth/realms/"+realmName+"/nice-id/verify-ready",
	    type: "get",
	    dataType : 'text', 
	    success: function(encodeData){
	    	console.log(encodeData);
	    	$("#niceIdForm input[name=EncodeData]").val(encodeData);
	    },error: function(a,b,c){
	    	console.log(a,b,c)
	    }
	});
	
});