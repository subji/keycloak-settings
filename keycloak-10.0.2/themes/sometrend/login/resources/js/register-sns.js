$(function(){
	REGISTER.init();
	REGISTER_ALERT.init();
})



const REGISTER = {};
REGISTER.init = function(){
	
	$("#joinPathText").keyup(function(e){
		$("#joinPathEtcRadio").val($(e.target).val());
	})
	
	
	let staticServerDomain = "https://static.some.co.kr/sometrend/images/mypage/profile/";
	let profilePicture = [
		"m_01.png",
		"m_02.png",
		"m_03.png",
		"w_01.png",
		"w_02.png",
		"w_03.png"
		];
	$("input[name='user.attributes.picture']").val("https://static.some.co.kr/sometrend/images/mypage/profile/"+ profilePicture[Math.floor(Math.random() * 6 ) ]);
	
	$("#allCheckBox").change(function(e){
		if($(e.target).is(":checked")){
			$(".statusCheckBox").attr("checked",true)
		} else {
			$(".statusCheckBox").attr("checked",false)
		}
	})
	
	$("input.agreeCheckBox").change(function(){
		if($("input.agreeCheckBox").not(":checked").length == 0 ){
			$("#allCheckBox").attr("checked", true)
		} else {
			$("#allCheckBox").attr("checked", false)
		}
	})
	
	
	$("#submitButton").click(function(){
		
		if($("#email").val().length == 0 ){
			REGISTER_ALERT.show("이메일을 입력해주세요.");
			return false;
		}

		let emailRegexp = /^[0-9a-zA-Z\-\_\.]([-_\.]?[0-9a-zA-Z\-\_\.])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i ;
		
		if(!emailRegexp.test($("#email").val())){
			REGISTER_ALERT.show("사용할 수 없는 이메일입니다.");
			return false;
		}
		
		
		if($("input[name='user.attributes.nickname']").val().length ==0){
			REGISTER_ALERT.show("닉네임을 입력해주세요.");
			return false;
		}
		
		
		if(!$("#serviceTermsStatus").is(":checked")){
			REGISTER_ALERT.show("서비스 이용약관에 동의를 하셔야 회원가입이 가능합니다.");
			return false;
		}
		if(!$("#privacyStatementStatus").is(":checked")){
			REGISTER_ALERT.show("개인정보 수집 및 이용에 동의를 하셔야 회원가입이 가능합니다.");
			return false;
		}
		
		//여기 비동기라서 뭔가 이상하다?
		USER_API.findByUserAttributeName("nickname",$("input[name='user.attributes.nickname']").val() ).done(function(item){
			if(item.length == 0){
				$("#registerForm")[0].submit();
			} else {
				$("input[name='user.attributes.nickname']").val("");
				REGISTER_ALERT.show("이미 사용중인 닉네임입니다.");
			}
		})
		
		
	})
}



function setToggle(obj){
	$(obj).toggleClass("on");
	$(obj).parent().next().toggleClass("on");
}

