<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}" lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="robots" content="noindex, nofollow">

	<meta name="naver-site-verification" content="a1c369071696cb0b2540e0a9677bdca23f8cd5d3" /> <!-- 네이버 웹마스터 등록 -->

	<!-- 모바일 모드인 경우 -->
	<meta name="viewport"
			content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, shrink-to-fit=no">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /> -->

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<#--  모바일 개발 전 뷰포트 임시사용  -->
	<meta name="viewport" content="width=device-width" />
	<meta name="author" content="daumsoft.com" />
	<meta name="title" content="Sometrend ™" />
	<meta name="description" content="some.co.kr" />

	<link rel="shortcut icon" href="${properties.resourcesPath}/images/sometrend_favicon.ico">
	<link rel="icon" href="${properties.resourcesPath}/images/sometrend_favicon.ico">
	<link rel="apple-touch-icon-precomposed" href="${properties.resourcesPath}/images/home_icon/homIcon_114_114.png" />
	<link rel="shortcut icon" href="${properties.resourcesPath}/images/home_icon/homIcon_72_72.png">

	<#if properties.meta?has_content>
			<#list properties.meta?split(' ') as meta>
					<meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
			</#list>
	</#if>

	<link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
	<#--  macro 에 임포트 할 수 있는 구문인것 같다  -->
	<#nested "meta">
	<#nested "title">
	<#nested "css">
</head>

<body class="${properties.kcBodyClass!}">
	<#nested "body">

	<#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
		<form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
			<div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
				<div class="${properties.kcFormGroupClass!}">
					<input type="hidden" name="tryAnotherWay" value="on" />
					<a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
				</div>
			</div>
		</form>
	</#if>

	<#nested "scripts">
	<#nested "alert">
</body>
</html>
</#macro>
