const REGISTER_ALERT = {};

REGISTER_ALERT.init= function(){
	
}

REGISTER_ALERT.show = function(summary){
	//keycloak MessageBean.java 에서 summary를 <br> => &lt;br&gt;로 나눔
	let endIndex = summary.indexOf("&lt;br&gt;") ==  -1 ? summary.length : summary.indexOf("&lt;br&gt;") ;
	summary = summary.substr(0,endIndex);
	$("#alertText").html(summary);
	$("#alertDiv").show();
	$("#backgroundLayer").show();
}

REGISTER_ALERT.hide = function(summary){
	$("#alertDiv").hide();
	$("#backgroundLayer").hide();
}