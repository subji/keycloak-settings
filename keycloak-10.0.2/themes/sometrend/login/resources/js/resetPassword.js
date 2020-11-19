$(function(){
	FIND_PASSWORD.init();
})

FIND_PASSWORD = {};
FIND_PASSWORD.init = function(){
		
	$("#passwordSubmitButton").click(function(){
		FIND_PASSWORD.apiCall();
	})
	
};


FIND_PASSWORD.apiCall = function(){
	let attributeName = $("input[name=find_password]:checked").val();
	let attributeValue = "";
	
	if(attributeName== "email"){
		
		if(!REGEXP.email.test($("#passwordForm input[name=username]").val())){
			RESET_ALERT.show("올바른 이메일을 입력하세요.");
			return;
		}
		
		$("#passwordForm")[0].submit();
		return ;
	} else if(attributeName == "phoneNumber"){
		attributeValue = $("#phoneNumber").val();
		
		if(attributeValue.length == 0){
			$('.verify-by-phone').click();
			return ;
		}
	}
	
	USER_API.findByUserAttributeName(attributeName,attributeValue).done(function(result){
		if(result.length == 0){
			RESET_ALERT.show("입력하신 정보와 일치하는 회원이 없습니다.<br>해당 정보를 다시 확인하시거나 회원가입을 해주세요.");
			return;
		}
		
		RESET_ALERT.show(MASKING.email(result[0].username));
	})
	
};



