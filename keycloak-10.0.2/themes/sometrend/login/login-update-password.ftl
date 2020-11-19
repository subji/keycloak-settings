<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    </#if>  
    
    <#if section = "scripts">
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery-v3.1.1.js"></script>
		<#if properties.loginCommonScripts?has_content>
				<#list properties.loginCommonScripts?split(' ') as script>
						<script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
				</#list>
		</#if>
		
		<script>
			const realmName = "${realm.name}";
			$(function(){
				$(".password_icon").click(function(e){
					let inputTag = $(e.target).parent().find("input").eq(0);
					if(inputTag.attr("type") == "password"){
						inputTag.attr("type","text");
					} else {
						inputTag.attr("type","password");
					}
				})
				$("#submitButton").click(function(){
					$('#resetPasswordForm')[0].submit();
				})
				if("${message.type}" == "error"){
					RESET_ALERT.show("${message.summary}");
				}
				
			})
		</script>
		
	</#if>
	
    
    <#if section = "css">
		<#--  css  -->
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
		<link href="${properties.resourcesPath}/css/material-design-iconic-font.css" rel="stylesheet" type="text/css" >
		<#if properties.loginStyles?has_content>
			<#list properties.loginStyles?split(' ') as style>
				<link href="${url.resourcesPath}/${style}" rel="stylesheet" />
			</#list>
		</#if>
		<#if properties.loginCommonStyle?has_content>
			<#list properties.loginCommonStyle?split(' ') as style>
				<link href="${url.resourcesPath}/${style}" rel="stylesheet" />
			</#list>
		</#if>
	</#if>
	
      
    <#if section="form">
    	<input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
        <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>
    	<div id="wrap" class="contatiner login_Wrap"role="main">
		
			<section class="login_section_wrap">
				<a href="${properties.sometrendHomeUrl}" class="logo_img"></a>
				<div class="find_wrap">
					<div class="tab_con findTab_con " id="findTab_con">
						<div class="tabView tabViewOn">
							<ul class="change_pw_list">
								<li>새로운 비밀번호를 입력해 주세요.</li>
								<li>비밀번호는 8~16자 이내로 영문 (대문자, 소문자), 숫자, 특수 문자 3가지 조합 중 2가지 이상을 조합해서 설정하시면 됩니다.<br>
										단, 3가지 모두를 조합하실 경우 더욱 강력한 비밀번호를 만들 수 있습니다.</li>
							</ul>
							<form class="find_frm posiRelative" action="${url.loginAction}" id="resetPasswordForm" method="post">
								<div class="form_control form_control_type3">
									<h6 class="form_subject">새 비밀번호 입력</h6>
									<div class="form_password_box">
									
										<input type="password" id="password-new" name="password-new" class="input_text password_info" autofocus autocomplete="new-password" />
										<span class="password_icon"></span>
									</div>
								</div>
								<div class="form_control form_control_type3">
									<h6 class="form_subject">새 비밀번호 확인</h6>
									<div class="form_password_box">
										<input type="password" id="password-confirm" name="password-confirm" class="input_text password_info" autocomplete="new-password" />
										<span class="password_icon"></span>
									</div>
								</div>
	
								<div class="default_btn_box mgTop_30 ">
									<a href="javascript:void(0)" class="default_btn" role="button" id="submitButton">확인</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
			<div class="find_menu_box">
			<a class="find_menu" href="${url.loginUrl}">로그인</a>
			<a class="find_menu" href="${url.registrationUrl}">회원가입</a>
			<a class="find_menu" href="${properties.sometrendHomeUrl}/service/FAQ">자주묻는질문 (FAQ)   </a>
		</div>
		</div><!--wrap -->
    
    
	    <aside class="poplayout" id="alertDiv" style="">
			<section class="confirmPop">
				<button class="confirmPop_button_close removeAleryButton" type="button" >
					<i class="zmdi zmdi-close"></i>
				</button>
				<div class="confirmPop_text">
					<span id="alertText"></span>
				</div>
				<div><div class="confirm_button_box box_type1"><a href="javascript:void(0)" class="confirm_button ok_btn removeAleryButton" >확인</a></div></div>
			</section>
		</aside>

    </#if>  
        
	
</@layout.registrationLayout>
