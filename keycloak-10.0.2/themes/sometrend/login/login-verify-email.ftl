

<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
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
    
    <#if section = "css">
		<#--  css  -->
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
		<link href="${properties.resourcesPath}/css/material-design-iconic-font.css" rel="stylesheet" type="text/css" >
		<#if properties.loginCommonStyle?has_content>
			<#list properties.loginCommonStyle?split(' ') as style>
				<link href="${url.resourcesPath}/${style}" rel="stylesheet" />
			</#list>
		</#if>
		<style>
		   .confirm_mail_wrap{margin : 0 auto; text-align: center; padding: 50px 0}
		    .instruction:first-child{font-size: 19px; font-weight: 600}
		    .instruction{margin-bottom: 10px; line-height: 1;}
		    .instruction a{color: #359aff}
		</style>
	</#if>
	
	<#if section = "title">
		<title>Sometrend - 이메일 코드 전송 안내</title>
	</#if>
	
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
		<section class="confirm_mail_wrap">
			<p class="instruction">
				${msg("emailVerifyInstruction1")}
			</p>
			<p class="instruction">
				${msg("emailVerifyInstruction2")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
			</p>
		</section>
    </#if>
</@layout.registrationLayout>