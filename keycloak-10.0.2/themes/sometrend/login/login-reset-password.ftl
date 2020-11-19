<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form2">
    	
    	<form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}"/>
                    <#else>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus/>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>
        </form>    
    
    
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
    
	<#if section = "scripts">
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery-v3.1.1.js"></script>
		<script type="text/javascript" src="${properties.resourcesPath}/js/google/api_client.js"></script>
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery.cookie.js"></script>
		<#if properties.resetPasswordScripts?has_content>
				<#list properties.resetPasswordScripts?split(' ') as script>
						<script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
				</#list>
		</#if>
		<#if properties.loginCommonScripts?has_content>
				<#list properties.loginCommonScripts?split(' ') as script>
						<script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
				</#list>
		</#if>
		
		<script>
			const realmName = "${realm.name}";
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
    <#if section= "form">
    
    
	<form id="niceIdForm" name="niceIdForm" method="post">
		<input type="hidden" name="m" value="checkplusService">
		<input type="hidden" name="EncodeData" value="">
	</form>
    
    
    <div id="wrap" class="contatiner login_Wrap"role="main">
		<section class="login_section_wrap">
			<a href="${properties.sometrendHomeUrl}" class="logo_img"></a>
			<div class="find_wrap">
				<ul class="findTabArea tab clearfix" id="findTab">
					<li class="emailButton" data-form-submit-tag-id="idSubmitButton">
						<a href="javascript:void(0)" class="iconArea" onclick="setTabMenu('#findTab','0');"><span class="tab_icon">이메일 찾기</span></a>
					</li>
					<li class="passwordButton" data-form-submit-tag-id="passwordSubmitButton">
						<a href="javascript:void(0)" class="iconArea" onclick="setTabMenu('#findTab','1');"><span class="tab_icon">비밀번호 찾기</span></a>
					</li>
				</ul>
				<div class="tab_con findTab_con " id="findTab_con">
					<div class="tabView emailTabView">
						<p class="form_desc">이메일 찾기 가능한 인증 방법을 선택해 주세요.</p>
						<form class="find_frm posiRelative" onsubmit="return false;">
							<section class="radio_open">
								<input class="" type="radio" name="find_email" id="find_email_1" value="nickname"  checked>
								<label for="find_email_1" class="firstLabel">회원 정보에 등록된 닉네임</label>
								<div class="form_box">
									<div class="form_control">
										<input type="text" class="input_text" placeholder="닉네임 입력" id="nickname" value="">
									</div>
									<!-- <p class="error_text error_id_find"><i class="zmdi zmdi-alert-circle-o icon"></i>닉네임을 입력해주세요</p> -->
								</div>
							</section>

							<section class="radio_open">
								<div class="is-certificated-complete" >
									<input class="" type="radio" name="find_email" id="find_email_2" value="phoneNumber" >
									<label for="find_email_2" class="firstLabel"><h6 class="sub_heading">휴대폰 본인 인증 <span>(본인 명의)</span><em class="essential">*</em></h6></label>
									<div class="form_box">
										<p class="sub_desc">※ 본인 인증 시 제공되는 정보는 인증기관에서 수집하며, 인증 수단 외의 용도로 사용하지 않습니다. </p>
										<button id="certificateButton" class="phone_btn verify-by-phone">휴대폰 인증</button>
									</div>
								</div>
							</section>
							<div class="default_btn_box mgTop_30 ">
								<!-- <a href="../main.html" class="default_btn cancle_btn" role="button" >취소</a> -->
								<a href="javascript:void(0)" class="default_btn" role="button" id="idSubmitButton">확인</a>
							</div>
							<div class="help_text_box"><i class="zmdi zmdi-info"></i>위 방법으로 계정을 찾을 수 없다면, <a href="mailto:help@some.co.kr">help@some.co.kr</a>로 직접 문의하시기 바랍니다.</div>
						</form>
					</div>
					<div class="tabView passwordTabView">
						<form class="find_frm posiRelative" id="passwordForm" action="${url.loginAction}" method="post" onsubmit="return false;">
							<section class="radio_open">
								<input class="" type="radio" name="find_password" id="find_password_1" value="email" checked >
								<label for="find_password_1" class="firstLabel">회원 정보에 등록된 이메일</label>
								<div class="form_box">
									<div class="form_control form_control_type2">
										<h6 class="form_subject">이메일</h6>
										<input type="text" class="input_text" name="username" placeholder="이메일 입력" value="">
										<!-- <a href="javascript:void(0)" role="button" class="comfirm_btn comfirm_code_btn">인증코드 전송</a> -->
									</div>
								</div>
							</section>


							<div class="default_btn_box mgTop_30 ">
								<!-- <a href="../main.html" class="default_btn cancle_btn" role="button" >취소</a> -->
								<a href="javascript:void(0)" class="default_btn" role="button" id="passwordSubmitButton">확인</a>
							</div>
							<div class="help_text_box"><i class="zmdi zmdi-info"></i>위 방법으로 계정을 찾을 수 없다면, <a href="mailto:help@some.co.kr">help@some.co.kr</a>로 직접 문의하시기 바랍니다.</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<input type="hidden" id="phoneNumber" >
		
		
		<div class="find_menu_box">
			<a class="find_menu" href="${url.loginUrl}" id="loginButton">로그인</a>
			<a class="find_menu" href="${url.registrationUrl}">회원가입</a>
			<a class="find_menu" href="${properties.sometrendHomeUrl}/service/FAQ">자주묻는질문 (FAQ)   </a>
		</div>
	</div><!--wrap -->
	
    
    
    
    <div class="layerMaskBackground "></div>
    
    
    <aside class="poplayout" id="alertDiv" style="">
		<section class="confirmPop">
			<button class="confirmPop_button_close removeAleryButton" type="button" >
				<i class="zmdi zmdi-close"></i>
			</button>
			<div class="confirmPop_text">
				<span id="alertText"></span>
			</div>
			<div class="buttonDiv">
				<div class="confirm_button_box box_type1"><a href="javascript:void(0)" class="confirm_button ok_btn removeAleryButton alertConfirmButton" >확인</a></div>
			</div>
		</section>
	</aside>
    
    </#if>
    

</@layout.registrationLayout>
