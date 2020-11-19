$(function(){
	
	var queryString = getQueryStringObject();
	
	if(queryString.mode == "id"){
		$("#findTab li.emailButton").addClass("on");
		$("#findTab_con .emailTabView").addClass("tabViewOn");
	}else {
		$("#findTab li.passwordButton").addClass("on");
		$("#findTab_con .passwordTabView").addClass("tabViewOn");
	}
	
	
	FIND_EMAIL.init();
	
	
})

FIND_EMAIL = {};
FIND_EMAIL.init = function(){
		
	$("#idSubmitButton").click(function(){
		FIND_EMAIL.apiCall();
	})
	$("#phoneNumber").keyup(function(e){
		$(e.target).val($(e.target).val().replace(/[^0-9]/g,""));
	})
	
};


FIND_EMAIL.apiCall = function(){
	let attributeName = $("input[name=find_email]:checked").val();
	let attributeValue = "";
	
	if(attributeName== "nickname"){
		attributeValue = $("#nickname").val();
		if(attributeValue.length == 0){
			RESET_ALERT.show("닉네임을 입력해주세요.");
		}
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
		
		let userIdList = [];
		
		for(i =0; i < result.length; i++){
			if(REGEXP.email.test(result[i].username)){
				userIdList.push(MASKING.email(result[i].username));
			} else {
				userIdList.push(MASKING.email(result[i].email) +"(SNS)")
			};
		}
	
		RESET_ALERT.show("회원님의 정보와 일치하는 이메일은 "+userIdList.join(",") + " 입니다.",function(){
			let html = "<div class='confirm_button_box box_type1'><a href='javascript:void(0)' class='confirm_button ok_btn removeAleryButton alertConfirmButton' >로그인</a></div>";
			let $html = $(html);
			$html.click(function(){
				window.location = $("#loginButton").attr("href");
			});
			
			$("#alertDiv .buttonDiv").html($html);
			
		});
	})
	
};




function getQueryStringObject() {
    var a = window.location.search.substr(1).split('&');
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=', 2);
        if (p.length == 1)
            b[p[0]] = "";
        else
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
}

