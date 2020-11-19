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
	<#if section = "title">
		<title>Sometrend - 회원가입</title>
	</#if>
	<#if section = "css">
		<#--  css  -->
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
		<link href="${properties.resourcesPath}/css/material-design-iconic-font.css" rel="stylesheet" type="text/css" >
		<#if properties.registerStyles?has_content>
			<#list properties.registerStyles?split(' ') as style>
				<link href="${url.resourcesPath}/${style}" rel="stylesheet" />
			</#list>
		</#if>
		<#if properties.loginCommonStyle?has_content>
			<#list properties.loginCommonStyle?split(' ') as style>
				<link href="${url.resourcesPath}/${style}" rel="stylesheet" />
			</#list>
		</#if>
	</#if>
	
	<#if section = "scripts">
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery-v3.1.1.js"></script>
		<script type="text/javascript" src="${properties.resourcesPath}/js/jquery/jquery.cookie.js"></script>
		<#if properties.registerSnsScripts?has_content>
				<#list properties.registerSnsScripts?split(' ') as script>
						<script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
				</#list>
		</#if>
		<script>
			const realmName = "${realm.name}";
		</script>
	</#if>
	
	
    <#if section = "header">
        ${msg("registerTitle")}
    </#if>
    
    <#if section = "alert">
		<#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
			<script>
				REGISTER_ALERT.show("${message.summary}");
			</script>
		</#if>
	</#if>
    
    
    
    <#if section = "form">
    <aside class="poplayout" id="alertDiv" style="display:none;">
		<section class="confirmPop">
			<button class="confirmPop_button_close" type="button" onclick="REGISTER_ALERT.hide()">
				<i class="zmdi zmdi-close"></i>
			</button>
			<div class="confirmPop_text">
				<span id="alertText"></span>
			</div>
			<div ><div class="confirm_button_box box_type1"><a href="javascript:void(0)" class="confirm_button ok_btn" onclick="REGISTER_ALERT.hide()">확인</a></div></div>
		</section>
	</aside>
	<div class="layerMaskBackground on" id="backgroundLayer" style="display:none;"></div>
    
	
	<div id="wrap" class="contatiner login_Wrap" role="main">
			<section class="login_section_wrap join_section_wrap">
				<div class="join_wrap">
					<h1 class="join_title">회원가입</h1>
				
					<form id="registerForm" class="join_frm" action="${url.loginAction}" method="post" onsubmit="return false;">
						<input type="hidden" id="firstName" name="firstName" value="${(user.firstName!'X')}" class="${properties.kcInputClass!}" />
	                    <input type="hidden" id="lastName" name="lastName" value="${(user.lastName!'X')}" class="${properties.kcInputClass!}" />
	                    <input type="hidden" id="user.attributes.website" name="user.attributes.website" value="${(user.attributes.website)}" class="${properties.kcInputClass!}" />
						<div style="height: 20px;"></div>
						<div class="form_control form_email">
							<h6 class="form_subject">이메일 <span class="place_text">(한 번 설정 시 수정 불가)</span></h6>
							<div class="form_contents">
								<div class="email_input first">
									<input type="text" class="input_text" value="${(user.email!'')}" id="email" name="email" placeholder="이메일">
									<input type="hidden" id="username" name="username" value="${(user.username!'')}"><!-- 이게 유저의 아이디 -->
								</div>
							</div>
						</div>
						<div class="form_control">
							<h6 class="form_subject">닉네임 <span class="place_text">(한 번 설정 시 수정 불가)</span></h6>
							<div class="form_contents">
								<div class=""><input type="text" class="input_text width_m" id="user.attributes.nickname" name="user.attributes.nickname" placeholder="한글/영문/숫자 (3~10자)" value="" maxlength="10"></div>
							</div>
						</div>
	
	
						<div class="form_control form_survey">
							<div class="survey_area">
								<p class="form_subject">어떤 경로를 통해 썸트렌드에 가입하게 되셨나요? <span class="place_text">(필수)</span></p>
								
								<ul class="radioCustom ">
									<li class="radio_open">
										<input class="" type="radio" name="user.attributes.joinPath" id="radio1_1" value="인터넷 검색" checked>
										<label for="radio1_1" class="firstLabel">인터넷 검색</label>
									</li>
									<li class="radio_open">
										<input class="" type="radio" name="user.attributes.joinPath" id="radio1_2" value="지인 추천">
										<label for="radio1_2" class="firstLabel">지인 추천</label>
									</li>
									<li class="radio_open">
										<input class="" type="radio" name="user.attributes.joinPath" id="radio1_3" value="각종 매체 광고">
										<label for="radio1_3" class="firstLabel">각종 매체 광고</label>
									</li>
									<li class="radio_open">
										<input class="" type="radio" name="user.attributes.joinPath" id="radio1_4" value="언론/뉴스기사">
										<label for="radio1_4" class="firstLabel">언론/뉴스기사</label>
									</li>
									<li class="radio_open">
										<input class="" type="radio" name="user.attributes.joinPath" id="radio1_5" value="채널">
										<label for="radio1_5" class="firstLabel">SNS 채널</label>
									</li>
								</ul>
								<ul class="radioCustom ">
									<li class="radio_open radio_etc">
										<input class="" type="radio" name="user.attributes.joinPath" id="joinPathEtcRadio" value="">
										<label for="joinPathEtcRadio" class="firstLabel">기타</label>
										<input type="text" id="joinPathText" class="text_box" placeholder="직접 입력(2~30자)" value="" maxlength="30">
									</li>
								</ul>
								
								<script>
						    		var joinPath = ""
						    	</script>
						    	
							</div>
						</div>
						
						<ul class="agree_list" >
							<h4 class="agree_title loginCheckbox" >
								<input type="checkbox" id="allCheckBox" name="allCheckBox" value="Y"><label for="allCheckBox">전체동의</label>
							</h4>
							<li class="loginCheckbox">
								<input type="checkbox" value="Y" class="statusCheckBox agreeCheckBox" id="serviceTermsStatus" name="serviceTermsStatus" ><label for="serviceTermsStatus"><span class="must_text">[필수]</span> 서비스 이용약관 동의</label>
								<a href="javascript:void(0)" onclick="setToggle(this)" class="view_arrow"></a>
							</li>
							<div class="accodian_box">
								 <!-- <strong class="tit_policy">Sometrend 이용약관</strong> -->
							<div class="wrap_terms">
							<h4 class="tit_subject fst">제1조 목적</h4>
							<p class="desc_g">이 약관은 주식회사 바이브컴퍼니(이하 "바이브")에서 운영하는 Sometrend 서비스 및 그와 관련된 기타 서비스(이하 "서비스")를 이용함에 있어, 서비스를 이용하는 회원 또는 이용자의 권리, 의무와 책임사항 및 기타 필요한 사항을 규정하는 것을 목적으로 합니다.</p>
	
							<h4 class="tit_subject">제2조 약관의 효력 및 변경</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span> 본 약관의 내용은 Sometrend 웹사이트 화면에 게시하거나 기타의 방법으로 공지하고, 본 약관에 동의한 모든 회원에게 그 효력이 발생합니다.</li>
								<li><span class="txt_num">②</span> 바이브는 필요한 경우 관련법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우 바이브는 변경사항을 시행일자 15일 전부터 회원에게 서비스 공지사항에서 공지 또는 통지하는 것을 원칙으로 하며, 불가피하게 회원에게 불리한 내용으로 변경할 경우에는 그 시행일자 30일 전부터 계정에 등록된 이메일 주소로 이메일 발송 또는 회원이 등록한 휴대폰번호로 문자메시지를 발송하는 방법 등으로 개별적으로 알려드립니다.</li>
								<li><span class="txt_num">③</span> 회사는 불특정 다수 회원에 대한 통지의 경우 서비스 게시판 등에 게시함으로써 개별 통지에 갈음할 수 있습니다.</li>
								<li><span class="txt_num">④</span> 바이브가 전항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 회원의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 이용계약을 해지할 수 있습니다. 단, 이의가 있음에도 불구하고 본 조 제 1항 및 2,3항에 따른 회사의 공지가 있을 후 14일 이내에 회원탈퇴 및 거부의사를 표명하지 않은 회원은 개정 약관에 동의한 것으로 봅니다.</li>
							</ul>
	
							<h4 class="tit_subject">제3조 약관의 적용범위</h4>
							<p class="desc_g">바이브에서 제공하는 서비스에는 기본적으로 이 약관이 적용되지만, 개별 서비스마다 별도의 이용약관 및 정책이 존재할 경우, 해당 서비스의 이용약관 및 정책이 우선하여 적용됩니다.</p>
	
							<h4 class="tit_subject">제4조 용어의 정의</h4>
							<p class="desc_g">이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 그리고 여기에서 정의되지 않은 약관 상 용어의 의미는 일반적인 관행 혹은 관계법령에 정하는 바에 따릅니다.</p>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span><b>서비스</b> :  바이브에서 운영하는 웹사이트(some.co.kr)에서 회원이 이용할 수 있는 Sometrend 서비스 및 그와 관련된 모든 서비스를 의미합니다.</li>
								<li><span class="txt_num">②</span><b>회원</b> : 바이브와 서비스 이용계약을 체결하고 서비스를 이용하는 모든 사용자를 의미합니다.</li>
								<li><span class="txt_num">③</span><b>이메일</b> : ‘회원’의 식별 및 서비스 이용을 위하여 회원이 선정한 본인 이메일 주소를 의미합니다.</li>
								<li><span class="txt_num">④</span><b>비밀번호</b> : ‘회원’의 본인확인을 위해서 회원이 정한 문자 또는 숫자의 조합을 의미합니다.</li>
								<li><span class="txt_num">⑤</span><b>닉네임</b> : 회원 식별 및 서비스 이용을 위하여 회원이 선정한 ‘닉네임’을 의미합니다.</li>
								<li><span class="txt_num">⑥</span><b>게시물</b> : 회원이 서비스를 이용하면서 게시한 문자, 문서, 그림, 링크, 파일 혹은 이들의 조합으로 이루어진 정보 등 모든 자료를 의미합니다.</li>
							</ul>
	
							<h4 class="tit_subject">제5조 이용계약의 체결</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>이용계약은 회원이 바이브에서 제공하는 회원가입 화면에서 서비스 이용약관에 동의한 후 회원가입 신청을 하고, 바이브가 이에 대해 승낙함으로써 체결됩니다.</li>
								<li><span class="txt_num">②</span>다만, 다음 각호의 경우 바이브는 회원가입 신청에 대한 승낙을 거부하거나 서비스 제공 중단, 이용계약을 해지하는 등 적절한 제한 조치를 할 수 있습니다
								</li>
								<ul class="list_2depth_type2">
									<li><span class="txt_num">1.</span>가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우</li>
									<li><span class="txt_num">2.</span>다른 사람의 이메일 주소를 이용하여 회원가입을 신청하거나, 다른 사람의 계정 및 비밀번호를 도용하거나, 다른 사람의 명의를 사용하거나, 다른 사람에게 계정을 증여를 받은 경우</li>
									<li><span class="txt_num">3.</span>허위의 정보를 기재하거나, 필수 입력 정보를 기재하지 않은 경우</li>
									<li><span class="txt_num">4.</span>회원의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
									<li><span class="txt_num">5.</span>바이브의 정책에 적합하지 않는 회원으로 판단되는 경우나 서비스 제공이 곤란한 경우</li>
									<li><span class="txt_num">6.</span>회원의 이용 목적이나 서비스 이용 방법이 바이브의 재산권이나 영업권을 침해하거나 침해할 우려가 있는 경우</li>
									<li><span class="txt_num">7.</span>비정상적인 방법을 통하여 회원 아이디를 대량으로 생성하는 행위를 할 경우</li>
									<li><span class="txt_num">8.</span>제공 서비스 설비 용량에 현실적인 여유가 없는 경우</li>
									<li><span class="txt_num">9.</span>서비스 제공을 위한 기술적인 부분에 문제가 있다고 판단되는 경우</li>
									<li><span class="txt_num">10.</span>기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우</li>
									<li><span class="txt_num">11.</span>회사로부터 회원자격정지 조치 등을 받은 회원이 그 조치 기간에 이용계약을 임의로 해지하고 재이용을 신청하는 경우</li>
									<li><span class="txt_num">12.</span>기타 부정한 용도로 서비스를 사용하고자 하는 경우</li>
								</ul>
							</ul>
	
							<h4 class="tit_subject">제6조 개인정보보호</h4>
							<p class="desc_g">바이브는 회원의 개인정보를 안전하게 보호하기 위하여 "정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”)"을 비롯한 모든 개인정보보호 관련 법률규정을 준수하기 위하여 개인정보처리방침을 제정하여 운영하고 있습니다. 자세한 사항은 "개인정보처리방침"에서 확인하실 수 있습니다.</p>
	
							<h4 class="tit_subject">제7조 회원의 계정 및 개인정보 관리 의무</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>회원은 자신의 아이디와 비밀번호를 스스로 관리하여야 하며, 이를 소홀히 관리하여 발생하는 모든 손해 및 민형사상의 책임은 회원 자신에게 있습니다. 자신의 아이디 및 비밀번호를 다른 사람에게 제공하여서는 안되며, 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 바이브를 통해 알리고 그에 대한 조치에 따라야 합니다.</li>
								<li><span class="txt_num">②</span>또한, 회원 가입 시 기재한 개인정보의 내용에 변경이 발생한 경우, 바이브를 통해 알리고 변경요청을 해야 합니다. 개인정보의 수정을 요청하지 않아 발생하는 회원의 손해에 대해 바이브는 책임을 지지 않습니다.</li>
								<li><span class="txt_num">③</span>회원이 관련 법령, 회사의 모든 약관 또는 정책을 준수하지 않는다면, 회사는 회원의 위반행위 등을 조사할 수 있고, 회원의 서비스 이용을 잠시 또는 계속하여 중단하거나, 재가입에 제한을 둘 수도 있습니다.</li>
								<li><span class="txt_num">④</span>부정 사용이 재차 발견될 경우 회사는 위반 내용 고지와 함께 필요시 법적인 대응을 할 수 있습니다. 회사는 회원에게 30일 간의 소명 기간을 부여하고, 소명 기간 동안 정당한 사유를 제시하지 못할 경우, 회원 등록을 말소하고 구입한 컨텐츠 및 권한을 종료할 수 있습니다.</li>
							</ul>
	
							<h4 class="tit_subject">제8조 바이브의 의무</h4>
							<p class="desc_g">바이브는 회원이 안전하게 서비스를 이용할 수 있도록 적절한 보안시스템을 구비하고 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수할 의무가 있습니다.</p>
	
							<h4 class="tit_subject">제9조 서비스 이용 관련 주의사항</h4>
							<p class="desc_g">바이브는 모든 회원이 바이브에서 제공하는 서비스를 안전하게 이용할 수 있도록 아래의 경우, 서비스 제공 중단, 이용계약 해지, 재가입 제한 등 적절한 조치를 할 수 있습니다. 또한 불법적인 행위라고 판단될 경우, 위반 행위의 경중에 따라 수사 기관에의 고발 조치 등 합당한 조치를 취할 수 있습니다.</p>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>회원가입 시 또는 회원정보 변경 시 허위내용을 기재하거나 타인의 정보를 도용하는 경우</li>
								<li><span class="txt_num">②</span>타인의 계정 및 정보를 무단으로 수집, 이용하거나 다른 사람들에게 제공하는 경우</li>
								<li><span class="txt_num">③</span>바이브의 운영자, 임직원, 회사를 사칭하거나 관련 정보를 도용하는 경우</li>
								<li><span class="txt_num">④</span>타인 또는 타사에 대한 의미 없는 욕설, 모욕, 희롱, 위협, 명예훼손 등이 포함된 게시물을 작성하여 블라인드 등의 경고 조치 후에도 해당 행위를 지속하는 경우</li>
								<li><span class="txt_num">⑤</span>바이브가 게시한 정보를 임의로 변경하는 경우</li>
								<li><span class="txt_num">⑥</span>바이브 및 기타 제3자의 저작권, 영업비밀, 특허권 등 지적재산권 및 영업권, 비즈니스 모델, 재산권을 침해하는 경우</li>
								<li><span class="txt_num">⑦</span>음란정보, 폭력적인 메시지, 기타 공서양속에 위반되는 정보를 공개 또는 게시하는 경우</li>
								<li><span class="txt_num">⑧</span>서비스의 이용권한 및 기타 이용계약상의 지위를 제3자에게 양도, 증여, 대여하거나, 담보로 제공하는 경우</li>
								<li><span class="txt_num">⑨</span>서비스의 컨텐츠를 재판매 하는 경우</li>
								<li><span class="txt_num">⑩</span>불법프로그램의 제공 및 운영방해, 정보통신망법을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등 관련법을 위반한 경우</li>
								<li><span class="txt_num">⑪</span>기타 불법적인 행위가 있거나 서비스의 정상적인 운영을 방해한 경우</li>
							</ul>
	
							<h4 class="tit_subject">제10조 서비스의 중단 및 변경</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>바이브는 컴퓨터 또는 서버 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 천재지변이나 국가비상사태, 해결이 곤란한 기술적 결함, 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 바이브는 공지사항 게시판 등을 활용하여 미리 통지합니다. 만약 사전에 통지할 수 없는 부득이한 사유가 있는 경우에는 최대한 빠른 시일 내에 서비스를 복구한 후 통지하도록 하겠습니다.</li>
								<li><span class="txt_num">②</span>바이브가 제공하는 서비스의 형태나 내용은 수시로 변경되거나 중단될 수 있습니다. 이러한 변경사항에 대해서는 회원에게 사전 통지하지 않지만, 회원에게 불리한 것으로 판단되는 사항에 대해서는 이메일 또는 기타 방법으로 개별 통지하도록 하겠습니다.</li>
							
							</ul>
	
							<h4 class="tit_subject">제11조 서비스 이용의 제한 및 중지</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”이라 합니다)의 규정에 의해 다른 회원의 공개된 게시물 등이 본인의 사생활을 침해하거나 명예를 훼손하는 등 권리를 침해 받은 회원 또는 제3자(이하 “삭제 등 신청인”)는 그 침해사실을 소명하여 바이브에 해당 게시물 등의 삭제 또는 반박 내용의 게재를 요청할 수 있습니다. 이 경우 바이브는 해당 게시물 등의 권리 침해 여부를 판단할 수 없거나 당사자 간의 다툼이 예상되는 경우 해당 게시물 등에 대한 접근을 임시적으로 차단하는 조치(이하 “임시조치”)를 최장 30일까지 취할 수 있습니다.</li>
								<li><span class="txt_num">②</span>제1항에 의해 본인의 게시물 등이 임시조치된 회원(이하 “게시자”)은 임시조치기간 중 바이브에 해당 게시물 등을 복원해 줄 것을 요청(이하 “재게시 청구”)할 수 있으며, 바이브는 임시조치된 게시물의 명예훼손 등 판단에 대한 방송통신심의위원회 심의 요청에 관한 게시자 및 삭제 등 신청인의 동의가 있는 경우 게시자 및 삭제 등 신청인을 대리하여 이를 요청하고 동의가 없는 경우 바이브가 이를 판단하여 게시물 등의 복원 여부를 결정합니다. 게시자의 재게시 청구가 있는 경우 임시조치 기간 내에 방송통신심의위원회 또는 바이브의 결정이 있으면 그 결정에 따르고 그 결정이 임시조치 기간 내에 있지 않는 경우 해당 게시물 등은 임시조치 만료일 이후 복원됩니다. 재게시 청구가 없는 경우 해당 게시물 등은 임시조치 기간 만료 이후 삭제됩니다.</li>
								<li><span class="txt_num">③</span>바이브는 서비스 내에 게시된 게시물 등이 사생활 침해 또는 명예훼손 등 제3자의 권리를 침해한다고 인정하는 경우 회원 또는 제3자의 신고가 없는 경우에도 임시조치(이하 “임의의 임시조치”)를 취할 수 있습니다. 임의의 임시조치된 게시물의 처리 절차는 제1항 후단 및 제2항의 규정에 따릅니다.</li>
								<li><span class="txt_num">④</span>회원의 게시물 등으로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 바이브를 대상으로 하여 민형사상의 법적 조치(예: 형사고소, 가처분 신청∙손해배상청구 등 민사소송의 제기)를 취하는 경우, 바이브는 동 법적 조치의 결과인 법원의 확정판결이 있을 때까지 관련 게시물 등에 대한 접근을 잠정적으로 제한할 수 있습니다. 게시물 등의 접근 제한과 관련한 법적 조치의 소명, 법원의 확정 판결에 대한 소명 책임은 게시물 등에 대한 조치를 요청하는 자가 부담합니다.</li>
							</ul>
	
							<h4 class="tit_subject">제12조 정보의 제공 및 광고의 게재</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>바이브 서비스 이용에 필요하다고 인정되는 다양한 정보를 회원 가입 시 기재한 회원의 개인정보 및 회원이 변경한 개인정보를 활용하여 이메일 또는 문자메시지, 전화 등의 방법으로 회원에게 제공할 수 있으며, 영리목적의 광고성 정보를 전송하는 경우에는 회원의 사전 동의를 얻습니다. 회원이 위 정보의 수신을 원하지 않는 경우에는 언제든지 이를 거부할 수 있습니다.</li>
								<li><span class="txt_num">②</span>회원이 전항에 의하여 정보수신의 모든 방법에 관하여 수신 거부를 하는 경우에도 바이브는 서비스 이용에 필수적으로 요구되는 정보의 확인 및 바이브의 판단에 따라 회원이 반드시 알아야 하는 중대한 정보를 회원의 이메일 알림 등으로 제공할 수 있으며, 회원은 이러한 정보수신에 관하여 동의합니다.</li>
							</ul>
	
							<h4 class="tit_subject">제13조 게시물 정책</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>바이브에서 제공하는 서비스 내에 회원이 작성한 게시물에 대한 저작권 및 책임은 게시물을 등록한 회원에게 있습니다.</li>
								<li><span class="txt_num">②</span>바이브는 서비스를 운영, 개선, 홍보하기 위한 목적으로 회원이 작성한 게시물을 바이브가 운영하는 서비스 또는 다른 회사가 운영하는 서비스에 노출, 수정, 복제, 전송, 전시, 보도, 방영할 수 있습니다.</li>
								<li><span class="txt_num">③</span>회원이 회원탈퇴를 한 경우, 바이브에 회원이 작성하였던 게시물은 삭제되지 않습니다. 회원 탈퇴와 동시에 회원의 개인정보가 삭제되기 때문에 작성자 본인을 확인할 수 없어 게시물 편집 및 삭제가 원천적으로 불가하니, 회원이 작성한 게시물의 삭제를 원할 경우에는 회원 탈퇴 이전에 게시물을 모두 삭제하여야 합니다.</li>
								<li><span class="txt_num">④</span>바이브는 정책에 따라 부적절한 글로 판단된 게시물은 블라인드 처리할 수 있으나, 바이브가 임의로 회원의 게시물을 삭제하거나 수정하지 않는 것을 원칙으로 하고 있습니다.</li>
								<li><span class="txt_num">⑤</span>회원이 작성한 게시물이 정보통신망법 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 바이브는 해당 게시물의 게시를 중단하거나 및 삭제하는 등 적절한 조치를 취할 수 있으며, 그로 인해 발생하는 민∙형사상의 모든 책임은 회원이 부담하여야 합니다.</li>
							</ul>
	
							<h4 class="tit_subject">제14조 바이브 서비스의 저작권</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>바이브가 작성한 저작물에 대한 저작권, 특허권, 상표권 기타 지식재산권은 바이브에 귀속됩니다. 회원은 바이브에서 운영하는 서비스를 이용함으로써 얻은 정보를 바이브의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 등 기타 방법에 의하여 이용하거나 제3자에게 이용하게 할 수 없습니다.</li>
								<li><span class="txt_num">②</span>바이브는 회원과 별도로 서면 계약을 체결하여 바이브가 제공하는 서비스 및 제반 서비스의 브랜드 특성을 이용할 수 있는 명시적인 권리를 부여하지 아니하는 한, 회원에게 바이브 또는 바이브가 제공하는 서비스의 상호, 상표, 서비스표, 로고, 도메인 네임 및 기타 식별력 있는 브랜드 특성을 이용할 수 있는 권리를 부여하지 않습니다.</li>
								<li><span class="txt_num">③</span>바이브와 체결한 별도의 계약에 따라 특별히 허용된 경우 및 바이브 웹사이트의 robots.txt 파일 규정에서 허용된 경우를 제외하고, 바이브가 서비스하는 콘텐츠(제품정보, 랭킹 등)를 무단으로 크롤링(crawling), 스크래핑(scraping), 캐싱(caching) 또는 액세스하거나 다른 웹사이트 또는 다른 미디어에 미러링하는 행위 또는 그러한 모든 시도는 금지됩니다. 바이브는 단독 판단에 따라 크롤링, 스크래핑, 캐싱 등 본 항에 명시된 금지행위와 연관된 접속을 차단할 수 있습니다.</li>
								<li><span class="txt_num">④</span>회원은 바이브가 서비스하는 컨텐츠를 재판매 하여서는 안 됩니다.</li>
							</ul>
	
							<h4 class="tit_subject">제15조 이용계약 해지</h4>
							<p class="desc_g">회원은 바이브의 서비스 이용을 중단하고 싶을 경우, 언제든지 이용계약을 해지할 수 있습니다. 단, 이용계약이 해지되는 경우에도 회원이 작성한 게시물은 삭제되지 않습니다. 게시물의 삭제를 원하실 경우, 반드시 해지신청 전에 회원의 게시물을 삭제하여야 합니다.</p>
							
							<h4 class="tit_subject">제16조 손해배상</h4>
							<ul class="list_1depth">
								<li><span class="txt_num">①</span>바이브는 법령상 허용되는 한도 내에서 서비스와 관련하여 본 약관에 명시되지 않은 어떠한 구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한, 바이브는 CP(Contents Provider)가 제공하거나 회원이 작성하는 등의 방법으로 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며, 바이브의 과실 없이 발생된 회원의 손해에 대하여는 책임을 부담하지 아니합니다.</li>
								<li><span class="txt_num">②</span>바이브는 바이브의 과실로 인하여 회원이 손해를 입게 될 경우 본 약관 및 관련 법령에 따라 회원의 손해를 배상하겠습니다. 다만 바이브는 바이브의 과실 없이 발생된 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다. 또한 바이브는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 및 징벌적 손해에 대한 책임을 부담하지 않습니다.</li>
								<ul class="list_2depth">
									<li>천재지변 또는 이에 준하는 불가항력의 상태에서 발생한 손해</li>
									<li>회원의 귀책사유로 서비스 이용에 장애가 발생한 경우</li>
									<li>서비스에 접속 또는 이용과정에서 발생하는 개인적인 손해</li>
									<li>제3자가 불법적으로 회사의 서버에 접속하거나 서버를 이용함으로써 발생하는 손해</li>
									<li>제3자가 바이브 서버에 대한 전송 또는 바이브 서버로부터의 전송을 방해함으로써 발생하는 손해</li>
									<li>제3자가 악성 프로그램을 전송 또는 유포함으로써 발생하는 손해</li>
									<li>전송된 데이터의 생략, 누락, 파괴 등으로 발생한 손해, 명예훼손 등 제3자가 서비스를 이용하는 과정에서 발생된 손해</li>
									<li>기타 바이브의 고의 또는 과실이 없는 사유로 인해 발생한 손해</li>
								</ul>
							</ul>
	
							<h4 class="tit_subject">제17조 준거법 및 분쟁의 해결</h4>
							<p class="desc_g">본 약관 또는 서비스는 대한민국법령에 의하여 규정되고 이행됩니다. 서비스 이용과 관련하여 바이브와 회원 간에 발생한 분쟁의 해결은 민사소송법에서 정한 관할법원에서의 소송에 의할 수 있습니다.</p>
							<div class="enforcement_date">
								<b>공지 일자 : 2020년 8월 18일</b><br>
								<b>적용 일자 : 2020년 8월 18일</b>
							</div>
						</div>
						</div> <!--  //이용약관 -->
	
	
							<li class="loginCheckbox">
								<input type="checkbox" class="statusCheckBox agreeCheckBox" id="privacyStatementStatus" name="privacyStatementStatus" value="Y"><label for="privacyStatementStatus"><span class="must_text">[필수]</span> 개인정보 수집 및 이용 동의</label>
								<a href="javascript:void(0)" onclick="setToggle(this)" class="view_arrow"></a>
							</li>
							<div class="accodian_box">
								<div class="wrap_terms">
									<h4 class="tit_subject">1. 개인정보 수집</h4>
									<p class="desc_g">바이브에서 제공하는 서비스는 회원가입 및 서비스를 이용하는 과정에서 최소한의 개인정보를 수집하고 있습니다.</p>
									<div class="tbl_comm tbl_terms">
										<table class="tbl">
											
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
											<tr>
												<th scope="col" class="fst">분류</th>
												<th scope="col">수집 유형</th>
												<th scope="col">수집 항목</th>
												<th scope="col">이용 목적</th>
											</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst"><div class="inner_cell">회원 가입 시</div></td>
													<td><div class="inner_cell">필수 항목</div></td>
													<td><div class="inner_cell">이메일, 비밀번호, 닉네임</div></td>
													<td><div class="inner_cell">이용자 식별 및 중복 가입 방지, 고지사항 전달</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">1:1 문의 시</div></td>
													<td><div class="inner_cell">필수 항목</div></td>
													<td><div class="inner_cell">이메일, 닉네임</div></td>
													<td><div class="inner_cell">고객 상담 접수 및 처리, 오류 확인</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">서비스 제공 시</div></td>
													<td><div class="inner_cell">필수 항목</div></td>
													<td><div class="inner_cell">이메일, 닉네임</div></td>
													<td><div class="inner_cell">이용자에게 최적화된 서비스 제공, 신규 서비스 안내, 이용자 특성에 따른 서비스 안내, 접속 빈도 파악, 서비스 이용 통계</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">기타 서비스 이용</div></td>
													<td><div class="inner_cell">자동 수집</div></td>
													<td><div class="inner_cell">서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보</div></td>
													<td><div class="inner_cell">본인 확인 및 서비스 이용 통계, 부정 이용 방지</div></td>
												</tr>
											</tbody>
										</table>
									</div>
	
									<h4 class="tit_subject">2. 개인정보 수집 방법</h4>
									<p class="desc_g">개인정보를 수집하는 경우에는 사전에 이용자에게 해당 사실을 알리고 동의를 구하고 있으며, 아래와 같은 법령에 따라 동의 없이 이용자의 개인정보를 수집∙이용할 수 있습니다.</p>
									<ul class="list_2depth_type2">
										<li><span class="txt_num">1.</span>정보통신서비스의 제공에 관한 계약을 이행하기 위하여 필요한 개인정보로써 경제적 · 기술적인 사유로 통상적인 동의를 받는 것이 뚜렷하게 곤란한 경우</li>
										<li><span class="txt_num">2.</span>부가 서비스 이용 또는 이벤트 응모 과정에서 해당 이용자에게 개인정보 추가 수집에 대해 동의를 받는 경우</li>
									</ul>
									<p class="desc_g subject_desc_g">서비스 이용 과정에서 이용자로부터 아래의 방법을 통해 개인정보가 수집될 수 있습니다.</p>
									<ul class="list_2depth_type2">
										<li><span class="txt_num">1.</span>PC웹, 모바일 웹/앱 이용 과정에서 단말기 정보(OS, 화면 사이즈, 디바이스 아이디, 휴대폰 기종, 단말기 모델명), IP 주소, 쿠키, 방문 일시, 부정 이용 기록, 서비스 이용 기록 등의 정보가 자동으로 생성되어 수집될 수 있습니다.</li>
										<li><span class="txt_num">2.</span>서비스 이용에 따른 본인 확인 및 개인 식별을 위해 웹 페이지 등을 통해 이용자의 개인정보가 수집될 수 있습니다.</li>
									</ul>
	
									<h4 class="tit_subject">3. 개인정보 제공 및 위탁</h4>
									<p class="desc_g">바이브는 이용자의 별도 동의가 있는 경우나 법령에 규정된 경우를 제외하고는 이용자의 개인정보를 제3자에 제공하지 않습니다.</p>
	
									<h4 class="tit_subject">4. 웹사이트 정보 자동 수집 장치(쿠키)에 대한 사항</h4>
									<p class="desc_g">쿠키는 웹사이트를 운영하는 데 이용하는 서버가 이용자의 브라우저로 전송하는 작은 텍스트 파일로, 이용자의 웹사이트 설정 상태, 방문 기록, 이용 형태를 자동으로 저장하여 웹사이트 사용을 빠르고 편리하도록 도와주는 역할을 합니다. 쿠키는 이름이나 전화번호 등 개인을 식별하는 정보를 저장하지 않지만, 이용자 스스로 쿠키 자동 수집 여부를 선택할 수 있습니다.</p>
									<ul class="list_2depth_type2">
										<li><b>[쿠키 수집 거부 설정 방법]</b></li>
										<li><span class="txt_num">1.</span>Internet Explorer : 웹 브라우저 상단의 [도구 메뉴 &gt; 인터넷 옵션 &gt; 개인정보 &gt; 설정]</li>
										<li><span class="txt_num">2.</span>Chrome : 웹 브라우저 우측의 [설정 메뉴 &gt; 화면 하단의 고급 설정 표시 &gt; 개인정보의 콘텐츠 설정 버튼 &gt; 쿠키]</li>
									</ul>
	
	
									<h4 class="tit_subject">5. 개인정보의 처리 및 이용기간</h4>
									<p class="desc_g">바이브는 원칙적으로 개인정보의 수집 및 이용목적 달성 또는 보유기간이 만료되는 경우, 수집된 개인정보는 열람하거나 이용할 수 없도록 지체없이 파기 처리합니다.<br>
										회원탈퇴 후 재가입을 반복하여 바이브가 제공하는 혜택 등으로 경제적인 이득을 취하거나, <br>명의를 무단으로 사용하는 편법 및 불법행위를 하는 행위를 막기 위해 회원탈퇴 후 6개월 동안 이름, 닉네임, 이메일, 연락처 정보를 보관하며, <br>모바일 기기식별정보, 접속IP 정보는 12개월 동안 보관합니다. 그 외 관계법령의 규정에 의하여 보존할 필요가 있는 경우, 일정한 기간 동안 외부와 차단된 별도의 DB 또는 테이블에 분리 보관합니다.
									</p>
									<div class="tbl_comm tbl_terms">
										<table class="tbl">
											
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
											<tr>
												<th scope="col" class="fst">보존 근거</th>
												<th scope="col">보존 항목</th>
												<th scope="col">보존 기간</th>
											</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst"><div class="inner_cell">전자상거래등에서의 소비자보호에 관한 법률</div></td>
													<td><div class="inner_cell">소비자 불만 또는 분쟁 처리에 관한 기록</div></td>
													<td><div class="inner_cell">3년</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">신용정보의 이용 및 보호에 관한 법률</div></td>
													<td><div class="inner_cell">신용정보의 수집/처리 및 이용 등에 관한 기록</div></td>
													<td><div class="inner_cell">3년</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">통신비밀보호법</div></td>
													<td><div class="inner_cell">서비스이용관련개인정보(로그인 기록)</div></td>
													<td><div class="inner_cell">3개월</div></td>
												</tr>
	
	
											</tbody>
										</table>
									</div>
									<p class="desc_g subject_desc_g">
										개인정보 보호를 위해 1년 동안 서비스를 이용하지 않은 회원의 계정은 “정보통신망 이용촉진 및 정보보호 등에 관한 법률 - 제 29조”에 근거하여 휴면으로 전환되며, 전환된 회원의 개인정보는 별도 DB로 분리하여 안전하게 보호합니다. 
									</p>
	
	
									<h4 class="tit_subject">6. 개인정보의 파기방법</h4>
									<p class="desc_g">바이브는 이용자의 개인정보 유출로 인한 피해가 발생하지 않도록 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제하며, 종이에 출력된 개인정보는 분쇄기로 분쇄하여 파기합니다. </p>
	
									<h4 class="tit_subject">7. 이용자의 권리</h4>
									<p class="desc_g">이용자가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 아니하며, 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정하도록 조치하겠습니다.</p>
									<p class="desc_g subject_desc_g">이용자가 회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 동의하신 내용은 언제든지 철회하실 수 있으며, 회원탈퇴를 요청할 수도 있습니다. 이 외에 추가로 확인하고 싶거나 정정, 해지하고 싶은 개인정보가 있을 경우, 고객서비스 담당부서로 연락 주시면 지체 없이 조치하겠습니다.</p>
	
									<h4 class="tit_subject">8. 개인정보의 안전성 확보 조치</h4>
									<p class="desc_g">바이브는 이용자들의 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음의 사항을 포함하여 관계 법령상 요구되는 기술적/관리적/물리적 조치를 취하고 있습니다.</p>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>기술적 조치</li>
										<ul class="list_2depth_type2">
											<li><span class="txt_num">1.</span>바이브는 이용자들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.</li>
											<li><span class="txt_num">2.</span>이용자들의 개인정보는 비밀번호에 의해 보호되며 파일 및 전송데이터를 암호화하거나 파일 잠금 기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.</li>
											<li><span class="txt_num">3.</span>바이브는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.</li>
											<li><span class="txt_num">4.</span>바이브는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL)를 채택하고 있습니다.</li>
											<li><span class="txt_num">5.</span>해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 이용하여 보안에 만전을 기하고 있습니다.</li>
										</ul>
										<li><span class="txt_num">②</span>관리적 조치</li>
										<ul class="list_2depth_type2">
											<li><span class="txt_num">1.</span>바이브는 이용자들의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.</li>
											<ul class="list_2depth">
												<li>이용자들을 직접 상대로 하여 마케팅 업무를 수행하는 자</li>
												<li>이용자들의 불만 및 이용문의 처리 업무를 수행하는 자</li>
												<li>개인정보관리책임자 및 담당자 등 개인정보관리업무를 수행하는 자</li>
												<li>기타 업무상 개인정보의 취급이 불가피한 자</li>
											</ul>
											<li><span class="txt_num">2.</span>바이브는 개인정보처리방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하고 있습니다.</li>
											<li><span class="txt_num">3.</span>바이브의 개인정보 관련 취급자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확화하고 있습니다.</li>
										</ul>
										<li><span class="txt_num">③</span>물리적 조치</li>
										<ul class="list_2depth_type2">
											<li><span class="txt_num">1.</span>바이브는 사무실 출입통제 시스템을 통하여 외부인의 출입을 차단하고 있습니다.</li>
											<li><span class="txt_num">2.</span>바이브는 서버실 등 개인정보를 처리하는 장치 등이 위치한 장소에 대한 출입관리 시스템 등을 통하여 개인정보 취급자 이외의 자의 접근을 통제하고 있습니다.</li>
											<li><span class="txt_num">단, 이용자 본인의 부주의나 인터넷 또는 통신상의 문제로 ID, 비밀번호 등 개인정보가 유출되어 발생한 문제에 대해 바이브는 일체의 책임을 지지 않습니다.</span></li>
										</ul>
									</ul>
	
	
									<h4 class="tit_subject">9. 개인정보 보호책임자 및 담당자</h4>
									<p class="desc_g">바이브의 서비스를 이용하면서 발생하는 모든 개인정보보호 관련 문의, 불만, 조언이나 기타 사항은 개인정보 보호책임자 및 담당부서로 연락해 주시기 바랍니다. 바이브는 여러분의 목소리에 귀 기울이고 신속하고 충분한 답변을 드릴 수 있도록 최선을 다하겠습니다.</p>
									<div class="tbl_comm tbl_terms">
										<table class="tbl">
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
											<tr>
												<th scope="col" class="fst">구분</th>
												<th scope="col">담당자(부서)</th>
												<th scope="col">이메일</th>
												<th scope="col">전화번호</th>
											</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst"><div class="inner_cell">개인정보보호 책임자</div></td>
													<td><div class="inner_cell">권미경 이사</div></td>
													<td><div class="inner_cell"><a href="mailto:fanto@vaiv.kr" class="link_txt">fanto@vaiv.kr</a></div></td>
													<td><div class="inner_cell">02-565-0531</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">고객서비스 담당부서</div></td>
													<td><div class="inner_cell">AI인사이트팀</div></td>
													<td><div class="inner_cell"><a href="mailto:Sometrend@vaiv.kr" class="link_txt">Sometrend@vaiv.kr</a></div></td>
													<td><div class="inner_cell">070-4314-7236</div></td>
												</tr>
											</tbody>
										</table>
									</div>
	
									<p class="desc_g subject_desc_g">기타 개인정보침해에 대한 신고나 상담이 필요한 경우 아래 기관에 문의하시기 바랍니다.</p>
									<div class="tbl_comm tbl_terms">
										<table class="tbl">
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
											<tr>
												<th scope="col" class="fst">구분</th>
												<th scope="col">웹사이트</th>
												<th scope="col">전화번호</th>
											</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst"><div class="inner_cell">개인정보침해 신고센터</div></td>
													<td><div class="inner_cell"><a href="http://privacy.kisa.or.kr" class="link_txt" target="_blank">http://privacy.kisa.or.kr</a></div></td>
													<td><div class="inner_cell">국번없이 118</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">대검찰청 사이버수사과</div></td>
													<td><div class="inner_cell"><a href="http://www.spo.go.kr" class="link_txt" target="_blank">http://www.spo.go.kr</a></div></td>
													<td><div class="inner_cell">국번없이 1301</div></td>
												</tr>
												<tr>
													<td class="fst"><div class="inner_cell">경찰청 사이버안전국</div></td>
													<td><div class="inner_cell"><a href="http://cyberbureau.police.go.kr" class="link_txt" target="_blank">http://cyberbureau.police.go.kr</a></div></td>
													<td><div class="inner_cell">국번없이 182</div></td>
												</tr>
												
											</tbody>
										</table>
									</div>
	
	
	
	
									<h4 class="tit_subject">10. 개인정보처리방침의 적용 범위</h4>
									<p class="desc_g">바이브의 개인정보처리방침은 Sometrend 웹사이트(some.co.kr)에 한해 적용됩니다. 바이브에서 제공하는 다른 회사의 웹사이트 링크로 이동하였을 경우, 해당 웹사이트의 개인정보처리방침이 적용되니 새로 방문한 웹사이트의 정책을 반드시 검토하시기 바랍니다.</p>
	
									<h4 class="tit_subject">11. 개인정보처리방침의 변경사항</h4>
									<p class="desc_g">바이브의 개인정보처리방침은 Sometrend 웹사이트(some.co.kr)에 공개하여 누구나 쉽게 열람할 수 있도록 하고 있습니다. 법률이나 서비스의 변경사항을 반영하기 위한 목적 등으로 개인정보취급방침을 수정할 경우, 변경사항을 게시하며, 변경된 개인정보처리방침은 게시한 날로부터 7일 후부터 효력이 발생합니다.</p>
	
									<div class="enforcement_date">
										<b>공지 일자 : 2020년 8월 18일</b><br>
										<b>적용 일자 : 2020년 8월 18일</b>
									</div>
								</div>
							</div><!--  //개인정보 수집 -->
	
	
							<li class="loginCheckbox">
							<input type="checkbox" value="Y"  class="statusCheckBox agreeCheckBox" id="user.attributes.emailReceivingStatus" name="user.attributes.emailReceivingStatus" ><label for="user.attributes.emailReceivingStatus" ><span>[선택]</span> 이메일 정보 수신 여부</label>
							
							
								
	<!-- 							<a href="javascript:void(0)"  onclick="setToggle(this)" class="view_arrow"></a> -->
							</li>
							<div class="accodian_box">
								 이메일 정보 수신 여부 전문 들어갈 예정
							</div>
						</ul>
						
						
						
						<input type="hidden" id="user.attributes.certificateYn" name="user.attributes.certificateYn" value="N">
						<input type="hidden" id="user.attributes.picture" name="user.attributes.picture" >
						
						<div class="join_btn_box">
							<a href="${url.loginUrl}" class="default_btn cancle_btn" role="button">취소</a>
							<button class="default_btn" role="button" type="submit" id="submitButton">확인</button>
						</div>
						
						
					</form>
				
				</div>
				
			</section>
		</div>
    	
    </#if>


    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form2">
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" name="username" value="${(user.username!'')}" class="${properties.kcInputClass!}"/>
                    </div>
                </div>
            </#if>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" name="email" value="${(user.email!'')}" class="${properties.kcInputClass!}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" class="${properties.kcInputClass!}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}" class="${properties.kcInputClass!}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                    <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                    <#else>
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                    </#if>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
