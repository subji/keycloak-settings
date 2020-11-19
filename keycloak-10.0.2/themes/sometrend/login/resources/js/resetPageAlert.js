$(function(){
	RESET_ALERT.init();
})
const RESET_ALERT ={};

RESET_ALERT.init = function(){
	$(".removeAleryButton").off("click").click(function(){
		RESET_ALERT.hide();
	})
}

RESET_ALERT.show = function(summary,buttonFunction){
	
	$("#alertText").html(summary);
	$("#alertDiv").show();
	$("#backgroundLayer").show();
	if(buttonFunction == null){
		RESET_ALERT.addButton();
		RESET_ALERT.init();
	} else {
		buttonFunction();
	}
}

RESET_ALERT.hide = function(summary){
	$("#alertDiv").hide();
	$("#backgroundLayer").hide();
}


RESET_ALERT.addButton = function(){
	$("#alertDiv .buttonDiv").html("<div class='confirm_button_box box_type1'><a href='javascript:void(0)' class='confirm_button ok_btn removeAleryButton alertConfirmButton' >확인</a></div>")
	
}


