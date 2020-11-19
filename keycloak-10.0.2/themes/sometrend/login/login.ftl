<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
	<#if section = "meta">
		<!-- Open Graph Area -->
		<meta property="og:type" content="website" />
		<meta property="og:title" content="Sometrend" />
		<meta property="og:image" content="${properties.resourcesPath}/images/meta_sometrend.png" />
		<meta property="og:description" content="요즘, 사람들의 생각이 궁금할 때" />
		<meta property="og:url" content="https://some.co.kr" />

		<meta name="twitter:card" content="summary_large_image" />
		<meta name="twitter:url" content="https://some.co.kr" />
		<meta name="twitter:title" content="Sometrend" />
		<meta name="twitter:description" content="요즘, 사람들의 생각이 궁금할 때" />
		<meta name="twitter:image" content="${properties.resourcesPath}/images/meta_sometrend.png" />

	</#if>
	<#if section = "title">
		<title>Sometrend - 로그인</title>
	</#if>
	<#if section = "css">
		<#--  css  -->
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

	<#if section = "body">
		<div id="wrap" class="contatiner login_Wrap"role="main">
			<section class="login_section_wrap clearfix">
				<div class="login_text_box">
					<div class="mainText_box">
						<span class="mainText" id="caption"><span>요즘,</span><br><span>사람들의 생각</span>이<br>궁금할 때</span>
					</div>
					<h1 class="login_logo"><a href="https://some.co.kr" class=""><img src="${properties.resourcesPath}/images/header_logo_1.svg" alt="썸트렌드 로고"></a></h1>

					<div class="mainInfo_box">
						<div><b>서비스 관련 문의</b>02-565-0531</div>
						<div><b>평일</b>09:00 - 12:00, 13:00 - 18:00 </div>
					</div>
				</div>
				<#--  login_text_box  -->
				<div class="login_form_box">
					<#if realm.password>
						<form class="login_frm posiRelative" id="loginForm" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
							<div class="form_control">
								<#if usernameEditDisabled??>
									<input tabindex="1" id="username" class="input_text" name="username" value="${(login.username!'')}" type="text" placeholder="${msg('username')}" disabled />
								<#else>
									<input tabindex="1" id="username" class="input_text" name="username" value="${(login.username!'')}"  type="text" placeholder="${msg('username')}" autofocus autocomplete="off" />
								</#if>
								<#--  <input type="text" class="input_text" placeholder="이메일" id="userId" name="userId">  -->
							</div>
							<div class="form_control">
								<input tabindex="2" id="password" class="input_text" name="password" type="password" autocomplete="off" placeholder="${msg('password')}" />
								<#--  <input type="password" class="input_text" placeholder="비밀번호" id="userPasswordInput" name="userPasswordInput">  -->
								<span class="password_icon"></span>
							</div>
							<div class="clearfix ">
								<#if realm.rememberMe && !usernameEditDisabled??>
									<div class="">
										<label for="rememberMe" title="개인정보 보호를 위해 개인 PC에서만 사용하세요.">
											<#if login.rememberMe??>
												<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
											<#else>
												<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
											</#if>
										</label>
									</div>
								</#if>
								<#--  <div class="loginCheckbox floatLeft">
									<input type="checkbox"  id="saveUserIdCb">
									<label for="saveUserIdCb" title="개인정보 보호를 위해 개인 PC에서만 사용하세요.">자동 로그인</label>
								</div>
								<div class="loginCheckbox floatLeft">
									<input type="checkbox"  id="saveUserIdCb">
									<label for="saveUserIdCb" title="개인정보 보호를 위해 개인 PC에서만 사용하세요.">이메일 저장</label>
								</div>  -->
							</div>
							<div class="login_btn_box">
								<input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
								<#--  <input tabindex="4"  name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>  -->
								<a tabindex="4" class="login_btn" name="login" id="kc-login"  value="${msg('doLogIn')}" onclick="$('#loginForm')[0].submit();"/>로그인</a>
								<#--  <a href="javascript:void(0);" class="login_btn" role="button" onclick="login(); return false;">로그인</a>  -->
							</div>
							<div class="find_box">
								<a class="find_btn find_btn_email" tabindex="5" href="${url.loginResetCredentialsUrl}&mode=id" >${msg("doForgotEmail")}</a>
								<#if realm.resetPasswordAllowed>
									<a class="find_btn find_btn_pw" tabindex="5" href="${url.loginResetCredentialsUrl}&mode=password" >${msg("doForgotPassword")}</a>
								</#if>
								<#if realm.password && realm.registrationAllowed && !registrationDisabled??>
									<span>${msg("noAccount")}</span>
									<a id="registerBtn" class="find_btn find_btn_pw" role="button" tabindex="6" href="${url.registrationUrl}&mode=password">${msg("doRegister")}</a>
								</#if>
							</div>
						</form>
					</#if>

					<div class="social_wrap">
						<div class="social_btn_box clearfix">
							<#if realm.password && social.providers??>
								<div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
									<ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
										<#list social.providers as p>
											<#if p.displayName = "custom-google">
												<a id="customBtn" href="${p.loginUrl}" id="zocial-${p.alias}" class="customGPlusSignIn social_btn google_btn ${p.providerId}">
													<span class="icon"></span>
													<span class="buttonText">구글 계정으로 로그인</span>
												</a>
											</#if>
											<#if p.displayName = "naver">
													<a id="customBtn" href="${p.loginUrl}" id="zocial-${p.alias}" class="social_btn naver_btn ${p.providerId}">네이버 계정으로 로그인</a>
											</#if>
										</#list>
									</ul>
								</div>
							</#if>
						</div>
					</div>
				</div>
			</section>
			<div class="login_info_text">본 서비스는 Chrome 브라우저와 가로 1,200 이상 해상도에 최적화 되어 있습니다. (*Internet Explorer 사용 시 서비스 이용에 제한이 있습니다.)</div>
		</div>

		<#--  Design Popup  -->
		<aside class="poplayout" id="alertPop_wrap">
				<section class="confirmPop">
					<button class="confirmPop_button_close" type="button" onclick="LOGIN_ALERT.hide();">
						<i class="zmdi zmdi-close"></i>
					</button>
					<div class="confirmPop_text">
						<span id="alertPopupContent"></span>
					</div>
					<div id="alertBtnArea">
						<div class="confirm_button_box box_type1">
							<a href="javascript:void(0)" class="confirm_button ok_btn" onclick="LOGIN_ALERT.hide();">확인</a>
						</div>
					</div>
				</section>
			</aside>

			<div class="layerMaskBackground"></div>
	</#if>
	
	<#if section = "scripts">
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery-v3.1.1.js"></script>
		<script type="text/javascript" src="${properties.resourcesPath}/js/google/api_client.js"></script>
		<script type="text/javascript" src="${properties.resourcesPath}/js/naver/naverLogin_implicit-1.0.3.js"></script>
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery.cookie.js"></script>
		<#if properties.loginScripts?has_content>
				<#list properties.loginScripts?split(' ') as script>
						<script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
				</#list>
		</#if>
	</#if>
	

	<#if section = "alert">
		<#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
			<div class="alert alert-${message.type}">
				<#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
				<#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
				<#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
				<#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
				<span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
				${message.type}
				${message.summary}
			</div>
			<script>
				LOGIN_ALERT.show('${kcSanitize(message.summary)?no_esc}');
			</script>
		</#if>
	</#if>

</@layout.registrationLayout>
