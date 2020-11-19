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
		<#if properties.registerScripts?has_content>
				<#list properties.registerScripts?split(' ') as script>
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
				
					<form id="registerForm" class="join_frm" action="${url.registrationAction}" method="POST" onsubmit="return false;">
					
						<div style="height: 20px;">
							</div>
							<div class="form_control form_email">
								<h6 class="form_subject">이메일 <span class="place_text">(한 번 설정 시 수정 불가)</span></h6>
								<div class="form_contents">
									<div class="">
										<input type="text" class="input_text" value="${(register.formData.email!'')}" id="email" name="email" placeholder="이메일">
										<input type="hidden" id="username" name="username" value="${(register.formData.username!'')}"><!-- 이게 유저의 아이디 -->
									</div>
								</div>
								<!-- 20201116 아카데믹 추가  -->
								<div class="academicInfo-box">
									<p class="academicInfo-text">※ 아카데믹 플랜 경품 이벤트에 참여하시는 분은 재학중인 대학교 이메일로 가입해 주세요. <span>ex) sometrend@some.ac.kr</span></p>
									<p class="academicInfo-text">※ 타인 또는 허위의 계정 정보를 이용하는 경우 경품 당첨이 취소될 수 있습니다. </p>
								</div>
							</div>
							<p class="error_info error_text error_join" data-what="email"></p>
							<!-- 20201116 아카데믹 추가  -->			
							<div class="form_control">
								<h6 class="form_subject">추천인</h6>
								<div class="form_contents">
									<div class=""><input type="text" class="input_text width_m" id="user.attributes.recommender" name="user.attributes.recommender" placeholder="추천인의 닉네임을 입력해 주세요." value="${(register.formData['user.attributes.recommender']!'')}" maxlength=""></div>
								</div>
							</div>
							<div class="form_control">
								<h6 class="form_subject">비밀번호</h6>
								<div class="form_password_box form_contents">
									<input type="password" class="input_text password_info" name="password" placeholder="영문/숫자/특수문자 (8~16자)" value="${(register.formData.password!'')}">
									<span class="password_icon"></span>
								</div>
							</div>
							<div class="form_control">
								<div class="form_password_box form_contents">
									<input type="password" class="input_text" name="password-confirm" placeholder="비밀번호 확인" value="${(register.formData.password\-confirm!'')}">
									<span class="password_icon"></span>
								</div>
							</div>
						<div class="form_control">
							<h6 class="form_subject">닉네임 <span class="place_text">(한 번 설정 시 수정 불가)</span></h6>
							<div class="form_contents">
								<div class=""><input type="text" class="input_text width_m" id="user.attributes.nickname" name="user.attributes.nickname" placeholder="한글/영문/숫자 (3~10자)" value="${(register.formData['user.attributes.nickname']!'')}" maxlength="10"></div>
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
										<input class="" type="radio" name="user.attributes.joinPath" id="joinPathEtcRadio" value="${(register.formData['user.attributes.joinPath']!'')}">
										<label for="joinPathEtcRadio" class="firstLabel">기타</label>
										<input type="text" id="joinPathText" class="text_box" placeholder="직접 입력(2~30자)" value="${(register.formData['user.attributes.joinPath']!'')}" maxlength="30">
									</li>
								</ul>
								
								<script>
						    		var joinPath = "${(register.formData['user.attributes.joinPath']!'')}"
						    	</script>
						    	
							</div>
						</div>
						
						<ul class="agree_list" >
							<h4 class="agree_title loginCheckbox" >
							<#if (register.formData['allCheckBox']!'N') == 'N'>
								<input type="checkbox" id="allCheckBox" name="allCheckBox" value="Y"><label for="allCheckBox">전체동의</label>
							<#else>
								<input type="checkbox" id="allCheckBox" name="allCheckBox" value="Y" checked><label for="allCheckBox">전체동의</label>
							</#if>
							</h4>
							<li class="loginCheckbox">
							<#if (register.formData['serviceTermsStatus']!'N') == 'N'>
								<input type="checkbox" value="Y" class="statusCheckBox agreeCheckBox" id="serviceTermsStatus" name="serviceTermsStatus" ><label for="serviceTermsStatus"><span class="must_text">[필수]</span> 서비스 이용약관 동의</label>
							<#else>
								<input type="checkbox" value="Y" class="statusCheckBox agreeCheckBox" id="serviceTermsStatus" name="serviceTermsStatus" checked><label for="serviceTermsStatus"><span class="must_text">[필수]</span> 서비스 이용약관 동의</label>
							</#if>								
								<a href="javascript:void(0)" onclick="setToggle(this)" class="view_arrow"></a>
							</li>
							<div class="accodian_box">
								 <!-- <strong class="tit_policy">Sometrend 이용약관</strong> -->
					
								<div class="wrap_terms">
									<h4 class="tit_subject fst">제1조 목적</h4>
									<p class="desc_g">이 약관은 (주)바이브컴퍼니 (이하 "바이브")에서 운영하는 썸트렌드 서비스(some.co.kr)와 썸머니 서비스(money.some.co.kr)를 이용함에 있어, 서비스를 이용하는 회원 또는 이용자의 권리, 의무와 책임사항 및 기타 필요한 사항을 규정하는 것을 목적으로 합니다.</p>
								
									<h4 class="tit_subject">제2조 약관의 효력 및 변경</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>본 약관의 내용은 썸트렌드 웹사이트 화면에 게시하거나 기타의 방법으로 공지하고, 본 약관에 동의한 회원에게 그 효력이 발생합니다.
										</li>
										<li><span class="txt_num">②</span> 바이브는 필요한 경우 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우 바이브는 변경사항을 시행일자 15일 전부터 회원에게 서비스 공지사항에서 공지 또는 통지하는 것을 원칙으로 하며, 불가피하게 회원에게 불리한 내용으로 변경할 경우 또는 중대한 사항을 변경하는 경우에는 그 시행 일자 30일 전부터 계정에 등록된 이메일 주소로 이메일 발송 또는 회원이 등록한 휴대폰 번호로 문자메시지 또는 푸시 알림을 발송하는 방법 등으로 개별적으로 알려드립니다.</li>
										<li><span class="txt_num">③</span> 바이브가 전항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정 약관 시행일 7일 후까지 거부 의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 회원의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정 약관에 동의하지 않을 경우 회원은 이용계약을 해지할 수 있습니다.</li>
								
									</ul>
								
									<h4 class="tit_subject">제3조 약관의 적용범위</h4>
									<p class="desc_g">바이브에서 제공하는 서비스에는 기본적으로 이 약관이 적용되지만, 개별 서비스마다 별도의 이용약관 및 정책이 존재할 경우, 해당 서비스의 이용약관 및 정책이 우선하여 적용됩니다.
									</p>
								
									<h4 class="tit_subject">제4조 용어의 정의</h4>
									<p class="desc_g">이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 그리고 여기에서 정의되지 않은 약관 상 용어의 의미는 일반적인 관행에 따릅니다.</p>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span><b>서비스</b> : 바이브에서 운영하는 썸트렌드 서비스(some.co.kr)에서 회원이 이용할 수 있는 썸트렌드 서비스 및 썸머니 서비스(money.some.co.kr)를 의미합니다.</li>
										<li><span class="txt_num">②</span><b>회원</b> : 바이브와 서비스 이용계약을 체결하고 서비스를 이용하는 모든 이용자를 의미합니다.</li>
										<li><span class="txt_num">③</span><b>비회원</b> : 바이브와 서비스 이용계약을 체결하지 않고 서비스를 이용할 수 있는 이용자를 말하며, 바이브는 ‘회원’과 ‘비회원’에게 제공하는 서비스에 차별을 두어 제공할 수 있습니다.</li>
								
										<li><span class="txt_num">④</span><b>이메일</b> : 회원의 식별 및 서비스 이용을 위하여 회원이 선정한 본인 이메일 주소를 의미합니다.</li>
										<li><span class="txt_num">⑤</span><b>비밀번호</b> : 회원의 본인확인을 위해서 회원이 정한 문자 또는 숫자의 조합을 의미합니다.</li>
										<li><span class="txt_num">⑥</span><b>유료 서비스(플랜)</b> : 바이브가 제공하는 서비스 중 회원이 바이브에 일정 금액을 결제하거나 회원이 바이브로부터 제공된 콘텐츠 사용을 통해 이용하는 서비스를 의미합니다.</li>
										<li><span class="txt_num">⑦</span><b>이용료</b> : 서비스를 통해 제공되는 기본 기능 및 부가적 기능 이용에 대한 요금을 의미합니다.</li>
								
										<li><span class="txt_num">⑧</span><b>결제</b> : 바이브가 제공하는 유료 서비스(플랜)을 이용하기 위하여 각종 지불수단을 통하여 일정 금액을 바이브 또는 바이브가 지정한 제3자에게 지불하는 것을 의미합니다.</li>
										<li><span class="txt_num">⑨</span>바이브는 ‘플랜’ 등의 명칭으로 유료 서비스를 이용 가능한 이용권을 온라인으로 발행할 수 있으며, 사용 방법은 사이트 페이지 등에 별도로 표기합니다.</li>
										<li><span class="txt_num">⑩</span><b>게시물</b> : 회원이 서비스를 이용하면서 썸갤에 게시한 문자, 문서, 그림, 링크, 파일 혹은 이들의 조합으로 이루어진 정보 등 모든 자료를 의미합니다.</li>
									</ul>
								
									<h4 class="tit_subject">제5조 이용계약의 체결</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>이용계약은 회원이 바이브에서 제공하는 회원가입 화면에서 서비스 이용 약관에 동의한 후 회원가입 신청을 하고, 바이브가 이에 대해 승낙함으로써 체결됩니다.</li>
										<li><span class="txt_num">②</span>다만, 다음 각호의 경우 바이브는 회원가입 신청에 대한 승낙을 거부하거나 서비스 제공 중단, 이용계약을 해지하는 등 적절한 제한 조치를 할 수 있습니다.
										</li>
										<ul class="list_2depth_type2">
											<li><span class="txt_num">1.</span>가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우</li>
											<li><span class="txt_num">2.</span>다른 사람의 이메일 주소를 이용하여 회원가입을 신청하거나, 다른 사람의 계정 및 비밀번호를 도용하거나, 다른 사람의 명의를 사용하거나, 다른 사람에게 계정을 증여를 받은 경우</li>
											<li><span class="txt_num">3.</span>허위의 정보를 기재하거나, 필수 입력 정보를 기재하지 않은 경우</li>
											<li><span class="txt_num">4.</span>만 14세 미만이 유료 서비스를 결제하는 경우</li>
											<li><span class="txt_num">5.</span>회원의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
											<li><span class="txt_num">6.</span>바이브의 정책에 적합하지 않는 회원으로 판단되는 경우나 서비스 제공이 곤란한 경우</li>
											<li><span class="txt_num">7.</span>회원의 이용 목적이나 서비스 이용 방법이 바이브의 재산권이나 영업권을 침해하거나 침해할 우려가 있는 경우</li>
											<li><span class="txt_num">8.</span>비정상적인 방법을 통하여 회원 아이디를 대량으로 생성하는 행위를 할 경우</li>
											<li><span class="txt_num">9.</span>제공 서비스 설비 용량에 현실적인 여유가 없는 경우</li>
											<li><span class="txt_num">10.</span>서비스 제공을 위한 기술적인 부분에 문제가 있다고 판단되는 경우</li>
											<li><span class="txt_num">11.</span>기타 바이브가 재정적, 기술적으로 필요하다고 인정하는 경우</li>
											<li><span class="txt_num">12.</span>바이브로부터 회원자격정지 조치 등을 받은 회원이 그 조치 기간에 이용계약을 임의로 해지하고 재이용을 신청하는 경우</li>
											<li><span class="txt_num">13.</span>기타 부정한 용도로 서비스를 사용하고자 하는 경우</li>
										</ul>
								
										<li><span class="txt_num">③</span>이용자의 귀책사유로 인하여 바이브가 이용 신청에 대해 승낙을 유보, 거절하거나 사후에 이용계약을 해지한 경우 바이브는 그 사실을 이용자에게 알려야 합니다.
										</li>
										<li><span class="txt_num">④</span>본 서비스 이용계약은 바이브가 회원가입 신청 절차 상에서 가입 완료를 표시한 시점에 성립합니다.
										</li>
										<li><span class="txt_num">⑤</span>제1항에 따른 신청에 있어 바이브는 "회원"의 종류에 따라 전문기관을 통하여 본인 인증 등을 시행할 수 있습니다.
										</li>
										<li><span class="txt_num">⑥</span>회원은 바이브에 언제든지 탈퇴를 요청할 수 있으며, 바이브는 즉시 회원 탈퇴 요청을 처리합니다.
										</li>
										<li><span class="txt_num">⑦</span>회원은 웹사이트의 개인정보 관리 화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.
										</li>
										<li><span class="txt_num">⑧</span>회원은 회원가입 시 기재한 사항이 변경되었을 경우 웹사이트의 회원정보관리화면에서 수정하거나 1:1 문의 등을 통해 바이브에 변경사항을 알려야 합니다.
										</li>
										<li><span class="txt_num">⑨</span>제8항의 변경사항을 바이브에 알리지 않아 발생한 불이익에 대하여 바이브는 책임지지 않습니다.
										</li>
									</ul>
								
									<h4 class="tit_subject">제6조 개인정보보호</h4>
									<p class="desc_g">바이브는 회원의 개인정보를 안전하게 보호하기 위하여 “개인정보 보호법”을 비롯한 모든 개인정보보호 관련 법률규정을 준수하기 위하여 개인정보처리방침을 제정하여 운영하고 있습니다. 자세한 사항은 "개인정보처리방침"에서 확인하실 수 있습니다.</p>
								
									<h4 class="tit_subject">제7조 회원의 계정 및 개인정보 관리 의무</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>회원은 자신의 아이디와 비밀번호를 스스로 관리하여야 하며, 이를 소홀히 관리하여 발생하는 모든 손해 및 민형사상의 책임은 회원 자신에게 있습니다. 자신의 아이디 및 비밀번호를 다른 사람에게 제공하여서는 안 되며, 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 바이브를 통해 알리고 그에 대한 조치에 따라야 합니다.
										</li>
										<li><span class="txt_num">②</span>또한, 회원 가입 시 기재한 개인정보의 내용에 변경이 발생한 경우, 바이브를 통해 알리고 변경 요청을 해야 합니다. 개인정보의 수정을 요청하지 않아 발생하는 회원의 손해에 대해 바이브는 책임을 지지 않습니다.</li>
										<li><span class="txt_num">③</span>회원이 관련 법령, 바이브의 모든 약관 또는 정책을 준수하지 않는다면, 바이브는 회원의 위반행위 등을 조사할 수 있고, 회원의 서비스 이용을 잠시 또는 계속하여 중단하거나, 재가입에 제한을 둘 수도 있습니다.</li>
										<li><span class="txt_num">④</span>부정 사용이 재차 발견될 경우 바이브는 위반 내용 고지와 함께 필요시 법적인 대응을 할 수 있습니다. 바이브는 회원에게 30일간의 소명 기간을 부여하고, 소명 기간 동안 정당한 사유를 제시하지 못할 경우, 회원 등록을 말소하고 구입한 컨텐츠 및 권한을 종료할 수 있습니다.</li>
									</ul>
								
									<h4 class="tit_subject">제8조 바이브의 의무</h4>
									<p class="desc_g">바이브는 회원이 안전하게 서비스를 이용할 수 있도록 적절한 보안 시스템을 구비하고 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수할 의무가 있습니다.</p>
								
								
									<h4 class="tit_subject">제9조 플랜 이용료</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>회원은 바이브가 제공하는 유료 서비스(플랜)에 대하여 홈페이지 및 <b>[썸트렌드 플랜 이용료]</b>에 따른 이용료를 지불해야 합니다.</li>
										<li><span class="txt_num">②</span>회원은 유료 서비스(플랜) 이용료를 제10조에 따라 매월 지정된 일자(30일 마다) 또는 비정기 서비스 구매 시 지불해야 합니다.</li>
										<li><span class="txt_num">③</span>회원은 최초 회원가입일이 아닌 유료 서비스(플랜)을 결제일을 기준으로 이용료를 지불해야 합니다.</li>
										<li><span class="txt_num">④</span>예정된 결제 날짜에 회원의 귀책사유로 결제가 완료되지 않았다면 회원은 미납된 금액을 즉시 납부해야 합니다. </li>
									</ul>
								
								
									<h4 class="tit_subject">제 10조 이용료 지불 및 결제방법</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>이용료의 지불은 카드(개인신용/체크), 법인카드, 세금계산서 발행을 통한 결제를 원칙으로 합니다. 이를 위하여 회원은 바이브가 제공하는 솔루션에 결제 가능한 수단을 등록해야 합니다.</li>
										<li><span class="txt_num">②</span>②	이용료의 지불은 다음 각 호의 방식으로 구분하여 진행됩니다.
										</li>
										<ul class="list_2depth_type2">
											<li><span class="txt_num">1.</span>정기 결제(카드) : 매월 지정된 일자에 한 달(30일)에 해당하는 기본 서비스 이용료를 회원이 지정한 카드로 선결제 하는 방식</li>
											<li><span class="txt_num">2.</span>비정기 결제(카드, 세금계산서 발행) : 서비스 이용료를 일시에 결제하는 방식
											</li>
										</ul>
										<li><span class="txt_num">③</span>회원이 플랜을 변경할 경우 이용료는 기존 플랜의 사용 기간만큼 부분 취소/환불 처리됩니다. 환불 방법은 제11조 및 바이브의 일반 이용약관(링크)의 환불 규정에 따른 서비스 운영팀 안내에 따릅니다. </li>
								
										<li><span class="txt_num">④</span>회원이 결제 수단을 선택 및 동의하면 이때 바이브는 결제를 위한 별도 페이지를 제공하고 이를 알립니다.</li>
										<li><span class="txt_num">⑤</span>회원이 지정한 결제 카드가 분실, 훼손, 변경, 거래정지, 기타 등의 사유로 유효하지 않은 경우 바이브는 결제 카드를 변경할 것을 안내하면서 미납된 금액을 청구할 수 있습니다.</li>
									</ul>
								
								
									<h4 class="tit_subject">제 11조 환불</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>회원은 바이브에 서비스 환불을 요구할 수 있습니다. 회원별 환불 정책은 다음과 같습니다. </li>
										<li><span class="txt_num">②</span>환불 금액 산정(소비자기본법 제 16조 2항 소비자분쟁 해결 기준 준용)
										</li>
										<ul class="list_2depth_type2">
											<li><span class="txt_num">1.</span>
												정기 결제(카드) 회원 : 회원이 해지를 요청하면 해지를 요청한 날을 기준으로 이용한 기간에 대한 금액 공제 후 남은 금액은 환불됩니다. 단, 해지 요청 후 서비스를 이용한 이력이 확인될 경우 마지막으로 서비스를 사용한 일자를 기준으로 하며, 회원이 해지를 요청하기 이전까지 서비스를 이용하지 않은 기간에 대한 환불은 제공하지 않습니다<br>
												환불은 해당 월의 일수를 기준으로 하여 1개월 단위로 계산되며, 결제일로부터 이용기간을 비율로 일할 계산된 금액을 공제한 나머지 잔액이 반환됩니다. 단, 결제 후 7일 이내에 검색 이력이 전혀 없을 경우 전액 환불(부가세, 수수료 제외)이 가능하며, 결제일 기준 이용기간 1/3 경과 전 환불 요청 시에는 결제 금액의 2/3까지 환불(부가세, 수수료 제외)되며, 결제일 기준 1/2 경과 전 환불 요청 시 결제 금액의 1/2까지 환불(부가세, 수수료 제외)됩니다. 결제일 기준 1/2 경과 후 환불 불가합니다.<br>
												카드 결제 환불은 카드 취소가 원칙이며, 회원의 해지 요청 후 3영업일 이내에 결제업자 등에게 카드 결제의 취소/정지 처리를 요청함으로써 이루어집니다. 해지 요청이 금요일 18시 이후에 접수된 경우 공휴일, 일요일을 제외하고 익일 처리 될 수 있습니다.[전자상거래법 제18조 제2항, 제3항을 참고해서, 3영업일을 기준으로 하되, 귀사는 결제업자등에게 대금 청구의 취소/정지 처리를 요청하는 방식으로 환불 의무를 이행한다는 내용으로 수정하였습니다. 귀사의 실무에 부합하는지 확인하여 보시기 바랍니다.] 
								
											</li>
											<li><span class="txt_num">2.</span>비정기 결제(프리미엄 플랜) : 구매 후 검색 및 엑셀 다운로드 이력이 없을 경우 전액 환불이 가능(부가세, 수수료 제외)하며 구매 후 검색 및 엑셀 다운로드 이력이 있을 경우 환불 불가합니다.
											</li>
											<li><span class="txt_num">3.</span>비정기 결제(파트너 플랜) : 파트너 플랜의 경우 세금계산서 발행을 통한 별도의 계약이 체결된 경우 해당 계약의 내용에 따르며, 서비스 내에서 해지 요청 또는 즉시 환불은 불가합니다.
											</li>
										</ul>
										<li><span class="txt_num">③</span>회원은 썸트렌드 “마이페이지”에서 플랜 별 각 서비스 이용 기간을 확인 할 수 있습니다. 플랜 해지는 해당 페이지에서 신청할 수 있습니다. 
										</li>
								
										<li><span class="txt_num">④</span>환불 금액 산정 시 기준 일자는 회원이 해지를 신청 후 문의가 도착한 일로부터 기산합니다.</li>
										<li><span class="txt_num">⑤</span>회원이 해지를 요청한 후 안내 받은 공제금 및 환불 가능 금액에 대해 동의하면 바이브는 동의 여부 확인 즉시 환불을 진행합니다. 단, 회원이 환불 가능 금액에 동의하지 않을 경우 환불을 진행할 수 없으며, 서비스 해지 요청은 취소됩니다.</li>
										<li><span class="txt_num">⑥</span>환불 가능 금액에 동의하지 않아 회원의 서비스 이용일 수가 증가하여 환불 가능 금액이 변경 될 경우, 바이브는 회원의 로그인 이력, 로그 기록을 기준으로 해당 회원이 기산일 이후 실제로 서비스를 이용했는지 여부를 판단하여 환불 가능 금액을 다시 안내 할 수 있습니다.</li>
									</ul>
								
									<h4 class="tit_subject">제 12 조 썸트렌드 플랜</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>썸트렌드 플랜은 회원이 서비스 이용 기간 동안 분석 기간 연장, 제외어/포함어, 엑셀 다운로드 등을 이용할 수 있는 서비스입니다.</li>
										<li><span class="txt_num">②</span>회원은 마이페이지에서 플랜 정보를 확인할 수 있으며 트렌드 분석 또는 마이페이지에서 플랜 별 구매한 기능을 사용할 수 있습니다.
										</li>
										<li><span class="txt_num">③</span>회원이 플랜 이용료를 결제하지 않거나, 취소하는 등의 이유로 서비스 이용이 해지되는 경우, 플랜 회원에게만 제공되는 기능을 트렌드 분석과 마이페이지에 더 이상 노출하지 않고, 회원은 해당 기능을 더 이상 사용할 수 없습니다.
										</li>
									</ul>
								
								
									<h4 class="tit_subject">제 13 조 과오금</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브는 플랜 이용료에 관하여 과오금이 발생한 경우 회원이 이용료를 결제한 방법과 동일하게 과오금을 환불합니다. 다만, 동일한 방법으로 환불이 불가능할 때는 이를 사전에 고지합니다.</li>
										<li><span class="txt_num">②</span>바이브의 책임이 있는 사유로 과오금이 발생한 경우 바이브는 계약 비용, 수수료 등에 관계없이 과오금 전액을 환불합니다. 다만, 회원의 책임 있는 사유로 과오금이 발생한 경우, 바이브가 과오금을 환불하는 데 소요되는 비용은 합리적인 범위 내에서 회원이 부담하여야 합니다.</li>
										<li><span class="txt_num">③</span>바이브는 회원이 주장하는 과오금에 대해 환불을 거부할 경우에 정당하게 이용료가 부과되었음을 입증할 책임을 집니다.</li>
										<li><span class="txt_num">④</span>바이브는 과오금의 환불 절차를 『콘텐츠 이용자 보호지침』에 따라 처리합니다.</li>
									</ul>
								
								
								
									<h4 class="tit_subject">제14조 서비스 이용 관련 주의사항</h4>
									<p class="desc_g">바이브는 모든 회원이 바이브에서 제공하는 서비스를 안전하게 이용할 수 있도록 아래의 경우, 서비스 제공 중단, 이용계약 해지, 재가입 제한 등 적절한 조치를 할 수 있습니다. 또한 불법적인 행위라고 판단될 경우, 위반 행위의 경중에 따라 수사 기관에의 고발 조치 등 합당한 조치를 취할 수 있습니다.</p>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>회원가입 시 또는 회원정보 변경 시 허위 내용을 기재하거나 타인의 정보를 도용하는 경우</li>
										<li><span class="txt_num">②</span>타인의 계정 및 정보를 무단으로 수집, 이용하거나 파트너 플랜의 경우 소속이 다른 사람들에게 제공하는 경우</li>
										<li><span class="txt_num">③</span>바이브 또는 바이브의 운영자, 임직원을 사칭하거나 관련 정보를 도용하는 경우</li>
										<li><span class="txt_num">④</span>타인 또는 타사에 대한 의미 없는 욕설, 모욕, 희롱, 위협, 명예훼손 등이 포함된 게시물을 작성하여 블라인드 등의 경고 조치 후에도 해당 행위를 지속하는 경우</li>
										<li><span class="txt_num">⑤</span>바이브가 게시한 정보를 임의로 변경하는 경우</li>
										<li><span class="txt_num">⑥</span>바이브 및 기타 제3자의 저작권, 영업 비밀, 특허권 등 지적재산권 및 영업권, 비즈니스 모델, 재산권을 침해하는 경우</li>
										<li><span class="txt_num">⑦</span>음란정보, 폭력적인 메시지, 기타 공서양속에 위반되는 정보를 공개 또는 게시하는 경우</li>
										<li><span class="txt_num">⑧</span>서비스의 이용권한 및 기타 이용계약상의 지위를 제3자에게 양도, 증여, 대여하거나, 담보로 제공하는 경우</li>
										<li><span class="txt_num">⑨</span>서비스의 콘텐츠를 재판매하는 경우</li>
										<li><span class="txt_num">⑩</span>불법 프로그램의 제공 및 운영 방해, 정보통신망법을 위반한 불법 통신 및 해킹, 악성 프로그램의 배포, 접속 권한 초과행위 등 관련 법을 위반한 경우</li>
										<li><span class="txt_num">⑪</span>기타 불법적인 행위가 있거나 서비스의 정상적인 운영을 방해한 경우</li>
									</ul>
								
									<h4 class="tit_subject">제15조 서비스의 중단 및 변경</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브는 컴퓨터 또는 서버 등 정보 통신 설비의 보수 점검, 교체 및 고장, 통신 두절 또는 천재지변이나 국가비상사태, 해결이 곤란한 기술적 결함, 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 바이브는 공지사항 게시판 등을 활용하여 미리 통지합니다. 만약 사전에 통지할 수 없는 부득이한 사유가 있는 경우에는 최대한 빠른 시일 내에 서비스를 복구한 후 통지하도록 하겠습니다.</li>
										<li><span class="txt_num">②</span>바이브가 제공하는 서비스의 형태나 내용은 수시로 변경되거나 중단될 수 있습니다. 이러한 변경사항에 대해서는 회원에게 사전 통지하지 않지만, 회원에게 불리한 것으로 판단되는 사항에 대해서는 이메일 또는 기타 방법으로 개별 통지하도록 하겠습니다.</li>
								
									</ul>
								
									<h4 class="tit_subject">제16조 정보의 제공 및 광고의 게재</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브 서비스 이용에 필요하다고 인정되는 다양한 정보를 회원 가입 시 기재한 회원의 개인정보 및 회원이 변경한 개인정보를 활용하여 이메일 또는 문자메시지, 전화 등의 방법으로 회원에게 제공할 수 있으며, 영리목적의 광고성 정보를 전송하는 경우에는 회원의 사전 동의를 얻습니다. 회원이 위 정보의 수신을 원하지 않는 경우에는 언제든지 이를 거부할 수 있습니다.</li>
										<li><span class="txt_num">②</span>회원이 전항에 의하여 정보 수신의 모든 방법에 관하여 수신 거부를 하는 경우에도 바이브는 서비스 이용에 필수적으로 요구되는 정보의 확인 및 바이브의 판단에 따라 회원이 반드시 알아야 하는 중대한 정보를 회원의 이메일 알림 등으로 제공할 수 있으며, 회원은 이러한 정보 수신에 관하여 동의합니다.</li>
									</ul>
								
									<h4 class="tit_subject">제17조 게시물 정책</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브에서 제공하는 서비스 내에 회원이 작성한 게시물에 대한 저작권 및 책임은 게시물을 등록한 회원에게 있습니다.</li>
										<li><span class="txt_num">②</span>바이브는 서비스를 운영, 개선, 홍보하기 위한 목적으로 회원이 작성한 게시물을 바이브가 운영하는 서비스 또는 다른 회사가 운영하는 서비스에 노출, 수정, 복제, 전송, 전시, 보도, 방영할 수 있습니다.</li>
										<li><span class="txt_num">③</span>회원이 회원탈퇴를 한 경우, 바이브에 회원이 작성하였던 게시물은 삭제되지 않습니다. 회원 탈퇴와 동시에 회원의 개인정보가 삭제되기 때문에 작성자 본인을 확인할 수 없어 게시물 편집 및 삭제가 원천적으로 불가하니, 회원이 작성한 게시물의 삭제를 원할 경우에는 회원 탈퇴 이전에 게시물을 모두 삭제하여야 합니다.</li>
										<li><span class="txt_num">④</span>바이브는 정책에 따라 부적절한 글로 판단된 게시물은 블라인드 처리하고 있으나, 바이브가 임의로 회원의 게시물을 삭제하거나 수정하지 않는 것을 원칙으로 하고 있습니다.</li>
										<li><span class="txt_num">⑤</span>회원이 작성한 게시물이 정보통신망법 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 바이브는 해당 게시물의 게시를 중단하거나 및 삭제하는 등 적절한 조치를 취할 수 있으며, 그로 인해 발생하는 민∙형사상의 모든 책임은 회원이 부담하여야 합니다.</li>
									</ul>
								
									<h4 class="tit_subject">제18조 바이브 서비스의 저작권</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브가 작성한 저작물에 대한 저작권, 특허권, 상표권 기타 지식재산권은 바이브에 귀속됩니다. 회원은 바이브에서 운영하는 서비스를 이용함으로써 얻은 정보를 바이브의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 등 기타 방법에 의하여 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.</li>
										<li><span class="txt_num">②</span>바이브는 회원과 별도로 서면 계약을 체결하여 바이브가 제공하는 서비스 및 제반 서비스의 브랜드 특성을 이용할 수 있는 명시적인 권리를 부여하지 아니하는 한, 회원에게 바이브 또는 바이브가 제공하는 서비스의 상호, 상표, 서비스표, 로고, 도메인 네임 및 기타 식별력 있는 브랜드 특성을 이용할 수 있는 권리를 부여하지 않습니다.</li>
										<li><span class="txt_num">③</span>바이브와 체결한 별도의 계약에 따라 특별히 허용된 경우 및 바이브 웹사이트의 robots.txt 파일 규정에서 허용된 경우를 제외하고, 바이브가 서비스하는 콘텐츠(데이터 차트, 매거진, 게시글 등)를 무단으로 크롤링(crawling), 스크래핑(scraping), 캐싱(caching) 또는 액세스하거나 다른 웹사이트 또는 다른 미디어에 미러링하는 행위 또는 그러한 모든 시도는 금지됩니다. 바이브는 단독 판단에 따라 크롤링, 스크래핑, 캐싱 등 본 항에 명시된 금지행위와 연관된 접속을 차단할 수 있습니다.</li>
										<li><span class="txt_num">④</span>회원은 바이브가 서비스하는 컨텐츠를 재판매 하여서는 안 됩니다.</li>
									</ul>
								
									<h4 class="tit_subject">제19조 이용계약 해지</h4>
									<p class="desc_g">회원은 바이브의 서비스 이용을 중단하고 싶을 경우, 언제든지 홈페이지의 ‘회원탈퇴’를 통하여 이용계약을 해지할 수 있습니다. 단, 이용계약이 해지되는 경우에도 회원이 작성한 게시물은 삭제되지 않습니다. 게시물의 삭제를 원하실 경우, 반드시 해지 신청 전에 회원의 게시물을 삭제하여야 합니다.</p>
								
									<h4 class="tit_subject">제20조 서비스 이용으로 인한 투자 책임</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>썸머니 서비스(money.some.co.kr)는 “회원”들의 투자판단에 참고가 되는 정보제공을 목적으로 배포하는 자료이므로 제공정보의 정확성이나 안정성을 보장할 수 없으므로, “회원”은 본인의 판단과 책임하에 투자를 결정해야 합니다.</li>
										<li><span class="txt_num">②</span>썸머니 서비스(money.some.co.kr)에서 제공하는 정보는 회원의 투자 판단 및 결과와 관련된 법적 책임의 근거가 될 수 없으며, 어떠한 경우에도 “회원”의 투자 결과에 대한 법적 책임소재의 증빙자료로 사용할 수 없습니다. </li>
									</ul>
								
									<h4 class="tit_subject">제21조 손해배상</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브는 법령상 허용되는 한도 내에서 서비스와 관련하여 본 약관에 명시되지 않은 어떠한 구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한, 바이브는 CP(Contents Provider)가 제공하거나 회원이 작성하는 등의 방법으로 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며, 바이브의 고의 또는 중대한 과실 없이 발생된 회원의 손해에 대하여는 책임을 부담하지 아니합니다. </li>
										<li><span class="txt_num">②</span>바이브는 바이브의 고의 또는 중대한 과실로 인하여 회원이 손해를 입게 될 경우 본 약관 및 관련 법령에 따라 회원의 손해를 배상하겠습니다. 다만 바이브는 바이브의 과실 없이 발생된 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다. 또한 바이브는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 및 징벌적 손해에 대한 책임을 부담하지 않습니다.</li>
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
								
									<h4 class="tit_subject">제22조 준거법 및 분쟁의 해결</h4>
									<p class="desc_g">본 약관 또는 서비스는 대한민국법령에 의하여 규정되고 이행됩니다. 서비스 이용과 관련하여 바이브와 회원 간에 발생한 분쟁의 해결은 민사소송법에서 정한 관할법원에서의 소송에 의할 수 있습니다.</p>
									<div class="enforcement_date">
										<b>공지 일자 : 2020년 9월 10일</b><br>
										<b>적용 일자 : 2020년 9월 10일</b>
									</div>
								
								</div>
							</div> <!--  //이용약관 -->
	
	
							<li class="loginCheckbox">
								<#if (register.formData['privacyStatementStatus']!'N') == 'N'>
									<input type="checkbox" class="statusCheckBox agreeCheckBox" id="privacyStatementStatus" name="privacyStatementStatus" value="Y"><label for="privacyStatementStatus"><span class="must_text">[필수]</span> 개인정보 수집 및 이용 동의</label>
								<#else>
									<input type="checkbox" class="statusCheckBox agreeCheckBox" id="privacyStatementStatus" checked name="privacyStatementStatus" value="Y"><label for="privacyStatementStatus"><span class="must_text">[필수]</span> 개인정보 수집 및 이용 동의</label>
								</#if>								
								<a href="javascript:void(0)" onclick="setToggle(this)" class="view_arrow"></a>
							</li>
							<div class="accodian_box">
								<div class="desc_private">
									(주)바이브컴퍼니 (이하 “바이브”)는 개인정보를 안전하게 보호하기 위하여 개인정보 보호법을 비롯한 모든 개인정보보호 규정, 가이드라인을 준수하고 있습니다. "개인정보처리방침"이란 이용자의 소중한 개인정보를 보호함으로써 이용자가 안심하고 서비스를 이용할 수 있도록 바이브가 준수해야 할 지침을 의미합니다.
								</div>
								<div class="desc_private">본 개인정보처리방침은 바이브가 제공하는 썸트렌드 서비스(some.co.kr)와 썸머니 서비스(somemoney.co.kr)에 적용됩니다. </div>
								<div class="wrap_terms">
									<h4 class="tit_subject">1. 개인정보 수집</h4>
									<p class="desc_g">바이브에서 제공하는 서비스는 회원가입 및 서비스를 이용하는 과정에서 최소한의 개인정보를 수집하고 있습니다. </p>
									<div class="tbl_comm tbl_terms pc_private">
										<table class="tbl">
								
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="fst">분류</th>
													<th scope="col">수집 항목</th>
													<th scope="col">이용 목적</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">회원 가입 시</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 비밀번호, 닉네임, 가입 경로</div>
													</td>
													<td>
														<div class="inner_cell">회원 가입 의사의 확인, 이용자 식별 및 중복 가입 방지, 고지사항 전달, 마케팅 활용</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">회원 정보 찾기</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 닉네임, 휴대폰 인증</div>
													</td>
													<td>
														<div class="inner_cell">아이디 찾기, 비밀번호 찾기 시, 본인 확인을 위한 절차 진행</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">1:1 문의</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 닉네임</div>
													</td>
													<td>
														<div class="inner_cell">고객 상담 접수 및 처리, 오류 확인</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">서비스 제공 시</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 닉네임</div>
													</td>
													<td>
														<div class="inner_cell">이용자에게 최적화된 서비스 제공, 신규 서비스 안내, 이용자 특성에 따른 서비스 안내, 접속 빈도 파악, 서비스 이용 통계</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">서비스 제공에 관한 계약의 이행 및 서비스 제공에 따른 요금 정산 시 (개인)</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 이름, 휴대폰 본인 인증, 신용카드(카드사명, Billkey)</div>
													</td>
													<td>
														<div class="inner_cell">유료 서비스 이용, 환불 처리</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">서비스 제공에 관한 계약의 이행 및 서비스 제공에 따른 요금 정산 시 (기관)</div>
													</td>
													<td>
														<div class="inner_cell">소속 기관명, 대표 가입자 이름, 대표 가입자 휴대폰 번호, 서브 사용자 이메일 계정, 소속 확인 서류</div>
													</td>
													<td>
														<div class="inner_cell">유료 서비스 이용, 세금계산서 발행</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">기타 서비스 이용 과정에서의 자동 수집	</div>
													</td>
													<td>
														<div class="inner_cell">서비스 이용 기록, 부정 이용 기록, 방문 일시, 접속 로그, 쿠키, 접속 IP 정보, 단말기 정보(OS, 화면 사이즈, 디바이스 아이디, 휴대폰 기종, 단말기 모델명)</div>
													</td>
													<td>
														<div class="inner_cell">본인 확인 및 서비스 이용 통계, 부정 이용 방지</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								
									<div class="tbl_comm tbl_terms mo_private">
										<table class="tbl">
								
											<colgroup>
												<col width="35%">
												<col width="25%">
												<col width="45%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="fst">분류</th>
													<th scope="col">수집 항목</th>
													<th scope="col">이용 목적</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">회원 가입 시</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 비밀번호, 닉네임, 가입 경로</div>
													</td>
													<td>
														<div class="inner_cell">회원 가입 의사의 확인, 이용자 식별 및 중복 가입 방지, 고지사항 전달, 마케팅 활용</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">회원 정보 찾기</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 닉네임, 휴대폰 인증</div>
													</td>
													<td>
														<div class="inner_cell">아이디 찾기, 비밀번호 찾기 시, 본인 확인을 위한 절차 진행</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">1:1 문의</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 닉네임</div>
													</td>
													<td>
														<div class="inner_cell">고객 상담 접수 및 처리, 오류 확인</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">서비스 제공 시</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 닉네임</div>
													</td>
													<td>
														<div class="inner_cell">이용자에게 최적화된 서비스 제공, 신규 서비스 안내, 이용자 특성에 따른 서비스 안내, 접속 빈도 파악, 서비스 이용 통계</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">서비스 제공에 관한 계약의 이행 및 서비스 제공에 따른 요금 정산 시 (개인)</div>
													</td>
													<td>
														<div class="inner_cell">이메일, 이름, 휴대폰 본인 인증, 신용카드(카드사명, Billkey)</div>
													</td>
													<td>
														<div class="inner_cell">유료 서비스 이용, 환불 처리</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">서비스 제공에 관한 계약의 이행 및 서비스 제공에 따른 요금 정산 시 (기관)</div>
													</td>
													<td>
														<div class="inner_cell">소속 기관명, 대표 가입자 이름, 대표 가입자 휴대폰 번호, 서브 사용자 이메일 계정, 소속 확인 서류</div>
													</td>
													<td>
														<div class="inner_cell">유료 서비스 이용, 세금계산서 발행</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">기타 서비스 이용 과정에서의 자동 수집	</div>
													</td>
													<td>
														<div class="inner_cell">서비스 이용 기록, 부정 이용 기록, 방문 일시, 접속 로그, 쿠키, 접속 IP 정보, 단말기 정보(OS, 화면 사이즈, 디바이스 아이디, 휴대폰 기종, 단말기 모델명)</div>
													</td>
													<td>
														<div class="inner_cell">본인 확인 및 서비스 이용 통계, 부정 이용 방지</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								
									<h4 class="tit_subject">2. 개인정보 수집 방법</h4>
									<p class="desc_g">개인정보를 수집하는 경우에는 사전에 이용자에게 해당 사실을 알리고 동의를 구하고 있으며, 아래와 같은 법령에 따라 동의 없이 이용자의 개인정보를 수집∙이용할 수 있습니다.
									</p>
									<ul class="list_2depth_type2">
										<li><span class="txt_num">1.</span>정보통신서비스의 제공에 관한 계약을 이행하기 위하여 필요한 개인정보로써 경제적 · 기술적인 사유로 통상적인 동의를 받는 것이 뚜렷하게 곤란한 경우</li>
										<li><span class="txt_num">2.</span>정보통신서비스의 제공에 따른 요금 정산을 위하여 필요한 경우</li>
										<li><span class="txt_num">3.</span>부가 서비스 이용 또는 이벤트 응모 과정에서 해당 이용자에게 개인정보 추가 수집에 대해 동의를 받는 경우</li>
									</ul>
									<p class="desc_g subject_desc_g">서비스 이용 과정에서 이용자로부터 아래의 방법을 통해 개인정보가 수집될 수 있습니다.</p>
									<ul class="list_2depth_type2">
										<li><span class="txt_num">1.</span>PC웹, 모바일 웹/앱 이용 과정에서 단말기 정보(OS, 화면 사이즈, 디바이스 아이디, 휴대폰 기종, 단말기 모델명), IP 주소, 쿠키, 방문 일시, 부정 이용 기록, 서비스 이용 기록 등의 정보가 자동으로 생성되어 수집될 수 있습니다.</li>
										<li><span class="txt_num">2.</span>서비스 이용에 따른 본인 확인 및 개인 식별을 위해 웹 페이지 등을 통해 이용자의 개인정보가 수집될 수 있습니다.</li>
									</ul>
								
									<h4 class="tit_subject">3. 개인정보의 제3자 제공</h4>
									<p class="desc_g">바이브는 이용자의 별도 동의가 있는 경우나 법령에 규정된 경우를 제외하고는 이용자의 개인정보를 제3자에 제공하지 않습니다.</p>
								
									<h4 class="tit_subject">4. 개인정보 제공 및 위탁</h4>
									<ul class="list_1depth">
										<li><span class="txt_num">①</span>바이브는 서비스 제공에 관한 계약을 이행하고 이용자의 편의 증진을 위하여 개인정보 처리 업무의 일부를 외부 전문업체에 위탁하고 있으며, 수탁자에 대해서는 개인정보 보호법상 “개인정보 위탁 협약서” 등을 통하여 관련 법규 및 지침의 준수, 정보보호 및 비밀유지, 제3자 제공 금지, 사고 시 책임부담, 위탁기간 종료 즉시 개인정보의 반납/파기의무 등을 규정하여 관리하고 있습니다.</li>
										<li><span class="txt_num">②</span>위탁한 개인정보는 회원탈퇴, 위탁계약 종료, 이용자의 삭제 요청이 있는 경우 지체 없이 파기합니다.</li>
										<li><span class="txt_num">③</span>위탁 업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인정보처리방침을 통하여 공개합니다.</li>
									</ul>
								
									<ul class="list_2depth_type2">
										<div class="tbl_comm tbl_terms">
											<table class="tbl">
												<thead>
													<tr>
														<th scope="col" class="fst">위탁받는 자</th>
														<th scope="col">위탁 업무의 내용</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="fst">
															<div class="inner_cell">NICE페이먼츠㈜</div>
														</td>
														<td>
															<div class="inner_cell">신용카드 결제 대행</div>
														</td>
													</tr>
													<tr>
														<td class="fst">
															<div class="inner_cell">NICE평가정보(주)</div>
														</td>
														<td>
															<div class="inner_cell">본인 인증 서비스 제공 및 대행</div>
														</td>
													</tr>
												</tbody>
											</table>
								
										</div>
									</ul>
								
								
								
									<h4 class="tit_subject">4. 웹사이트 정보 자동 수집 장치(쿠키)에 대한 사항</h4>
									<p class="desc_g">쿠키는 웹사이트를 운영하는 데 이용하는 서버가 이용자의 브라우저로 전송하는 작은 텍스트 파일로, 이용자의 웹사이트 설정 상태, 방문 기록, 이용 형태를 자동으로 저장하여 웹사이트 사용을 빠르고 편리하도록 도와주는 역할을 합니다. 쿠키는 이름이나 전화번호 등 개인을 식별하는 정보를 저장하지 않지만, 이용자 스스로 쿠키 자동 수집 여부를 선택할 수 있습니다.</p>
									<ul class="list_2depth_type2">
										<li><b>[쿠키 수집 거부 설정 방법]</b></li>
										<li><span class="txt_num">1.</span>Internet Explorer : 웹 브라우저 상단의 [도구 메뉴 &gt; 인터넷 옵션 &gt; 개인정보 &gt; 설정]</li>
										<li><span class="txt_num">2.</span>Chrome : 웹 브라우저 우측의 [설정 메뉴 &gt; 화면 하단의 고급 설정 표시 &gt; 개인정보의 콘텐츠 설정 버튼 &gt;
											쿠키]</li>
									</ul>
								
								
									<h4 class="tit_subject">5. 개인정보의 보유 및 이용기간</h4>
									<p class="desc_g">바이브는 원칙적으로 개인정보의 수집 및 이용목적 달성 또는 보유기간이 만료되는 경우, 수집된 개인정보는 열람하거나 이용할 수 없도록 지체없이 파기 처리합니다.<br>
										회원탈퇴 후 재가입을 반복하여 바이브가 제공하는 혜택 등으로 경제적인 이득을 취하거나, 명의를 무단으로 사용하는 편법 및 불법행위를 하는 행위를 막기 위해 회원탈퇴 후 6개월 동안 이름, 이메일, 연락처, 회사명, 사업자등록번호 정보를 보관하며, 모바일 기기식별정보, 접속IP 정보는 12개월 동안 보관합니다.<br>
										그 외 관계법령의 규정에 의하여 보존할 필요가 있는 경우, 일정한 기간 동안 외부와 차단된 별도의 DB 또는 테이블에 분리 보관합니다.
									</p>
									<div class="tbl_comm tbl_terms pc_private">
										<table class="tbl">
								
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="fst">보존 정보</th>
													<th scope="col">보존 근거 법령</th>
													<th scope="col">보존 기간</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">계약 또는 청약철회 등에 관한 기록</div>
													</td>
													<td rowspan="3">
														<div class="inner_cell">전자상거래등에서의 소비자 보호에 관한 법률</div>
													</td>
													<td>
														<div class="inner_cell">5년</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">대금 결제 및 재화 등의 공급에 관한 기록</div>
													</td>
													<td>
														<div class="inner_cell">5년</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">소비자의 불만 또는 분쟁처리에 관한 기록</div>
													</td>
													<td>
														<div class="inner_cell">년</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">사이트 방문에 관한 기록</div>
													</td>
													<td>
														<div class="inner_cell">통신비밀보호법</div>
													</td>
													<td>
														<div class="inner_cell">3개월</div>
													</td>
												</tr>
								
											</tbody>
										</table>
									</div>
								
									<div class="tbl_comm tbl_terms mo_private">
										<table class="tbl">
								
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="fst">보존 근거</th>
													<th scope="col">보존 항목</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">전자상거래등에서의 소비자 보호에 관한 법률</div>
													</td>
													<td>
														<div class="inner_cell">계약 또는 청약철회 등에 관한 기록 (5년)</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">전자상거래등에서의 소비자 보호에 관한 법률</div>
													</td>
													<td>
														<div class="inner_cell">대금 결제 및 재화 등의 공급에 관한 기록 (5년)</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">전자상거래등에서의 소비자 보호에 관한 법률</div>
													</td>
													<td>
														<div class="inner_cell">소비자의 불만 또는 분쟁처리에 관한 기록 (3년)</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">통신비밀보호법</div>
													</td>
													<td>
														<div class="inner_cell">사이트 방문에 관한 기록(3개월)</div>
													</td>
												</tr>
								
								
											</tbody>
										</table>
									</div>
								
								
									<p class="desc_g subject_desc_g">
										개인정보 보호를 위해 1년 동안 서비스를 이용하지 않은 회원의 계정은 개인정보 보호법 제39조의6에 근거하여 휴면으로 전환되며, 전환된 회원의 개인정보는 별도 DB로 분리하여 안전하게 보호합니다.
									</p>
								
								
									<h4 class="tit_subject">6. 개인정보의 파기절차 및 방법</h4>
									<p class="desc_g">바이브는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. <br>
									바이브는 이용자의 개인정보 유출로 인한 피해가 발생하지 않도록 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제하며, 종이에 출력된 개인정보는 분쇄기로 분쇄하여 파기합니다.
									</p>
								
									<h4 class="tit_subject">7. 이용자 및 법정대리인의 권리</h4>
									<p class="desc_g">이용자는 개인정보 보호법에 따라 개인정보 열람, 정정, 삭제, 처리정지 요구 등의 권리를 행사할 수 있습니다.<br>
									이용자가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 아니하며, 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정하도록 조치하겠습니다.<br>
									이용자가 회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 동의하신 내용은 언제든지 철회하실 수 있으며, 회원탈퇴를 요청할 수도 있으며, 위 권리를 법정대리인을 통해서도 행사할 수 있습니다. 이 외에 추가로 확인하고 싶거나 정정, 해지하고 싶은 개인정보가 있을 경우, 고객서비스 담당부서로 연락 주시면 지체 없이 조치하겠습니다.<br>
									이용자의 권리는 법정대리인을 통하여 하실 수 있습니다. 바이브는 개인정보 열람 등을 요구한 자가 이용자 본인이거나 정당한 대리인인지를 확인할 수 있습니다. </p>
								
								
								
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
									<div class="tbl_comm tbl_terms pc_private">
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
													<td class="fst">
														<div class="inner_cell">개인정보보호 책임자</div>
													</td>
													<td>
														<div class="inner_cell">윤순호 부장</div>
													</td>
													<td>
														<div class="inner_cell"><a href="mailto:shyoon@vaiv.kr" class="link_txt">shyoon@vaiv.kr</a></div>
													</td>
													<td>
														<div class="inner_cell">02-565-0531</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">고객서비스 담당부서</div>
													</td>
													<td>
														<div class="inner_cell">썸트렌드 운영팀</div>
													</td>
													<td>
														<div class="inner_cell"><a href="mailto:help@some.co.kr" class="link_txt">help@some.co.kr</a></div>
													</td>
													<td>
														<div class="inner_cell">070-4314-7236</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								
									<div class="mo_private">
										<p class="title">개인정보 보호 책임자</p>
										<table class="tbl privatelist">
											<colgroup>
												<col width="40%">
												<col>
											</colgroup>
								
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">이름</div>
													</td>
													<td>
														<div class="inner_cell">윤순호</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">직책</div>
													</td>
													<td>
														<div class="inner_cell">부장</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">이메일</div>
													</td>
													<td>
														<div class="inner_cell"><a href="mailto:shyoon@vaiv.kr" class="link_txt">shyoon@vaiv.kr</a></div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">연락처</div>
													</td>
													<td>
														<div class="inner_cell">02-565-0531</div>
													</td>
												</tr>
											</tbody>
										</table>
								
										<p class="title">고객서비스 담당부서</p>
										<table class="tbl privatelist">
											<colgroup>
												<col width="40%">
												<col>
											</colgroup>
								
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">부서명</div>
													</td>
													<td>
														<div class="inner_cell">썸트렌드 운영팀</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">이메일</div>
													</td>
													<td>
														<div class="inner_cell"><a href="mailto:help@some.co.kr" class="link_txt">help@some.co.kr</a></div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">연락처</div>
													</td>
													<td>
														<div class="inner_cell">070-4314-7236</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								
									<p class="desc_g subject_desc_g">기타 개인정보침해에 대한 신고나 상담이 필요한 경우 아래 기관에 문의하시기 바랍니다.</p>
									<div class="tbl_comm tbl_terms pc_private">
										<table class="tbl privatelist">
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
													<td class="fst">
														<div class="inner_cell">개인정보침해 신고센터</div>
													</td>
													<td>
														<div class="inner_cell"><a href="http://privacy.kisa.or.kr" class="link_txt"
																target="_blank">http://privacy.kisa.or.kr</a></div>
													</td>
													<td>
														<div class="inner_cell">국번없이 118</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">대검찰청 사이버수사과</div>
													</td>
													<td>
														<div class="inner_cell"><a href="http://www.spo.go.kr" class="link_txt"
																target="_blank">http://www.spo.go.kr</a></div>
													</td>
													<td>
														<div class="inner_cell">국번없이 1301</div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">경찰청 사이버안전국</div>
													</td>
													<td>
														<div class="inner_cell"><a href="http://cyberbureau.police.go.kr" class="link_txt"
																target="_blank">http://cyberbureau.police.go.kr</a></div>
													</td>
													<td>
														<div class="inner_cell">국번없이 182</div>
													</td>
												</tr>
								
											</tbody>
										</table>
									</div>
								
									<div class="mo_private">
										<p class="title">개인정보침해 신고센터</p>
										<table class="tbl privatelist">
											<colgroup>
												<col width="40%">
												<col>
											</colgroup>
								
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">웹사이트</div>
													</td>
													<td>
														<div class="inner_cell"><a href="http://privacy.kisa.or.kr" class="link_txt"
																target="_blank">http://privacy.kisa.or.kr</a></div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">연락처</div>
													</td>
													<td>
														<div class="inner_cell">국번없이 118</div>
													</td>
												</tr>
											</tbody>
										</table>
								
										<p class="title">대검찰청 사이버수사과</p>
										<table class="tbl privatelist">
											<colgroup>
												<col width="40%">
												<col>
											</colgroup>
								
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">웹사이트</div>
													</td>
													<td>
														<div class="inner_cell"><a href="http://www.spo.go.kr" class="link_txt"
																target="_blank">http://www.spo.go.kr</a></div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">연락처</div>
													</td>
													<td>
														<div class="inner_cell">국번없이 1301</div>
													</td>
												</tr>
											</tbody>
										</table>
								
										<p class="title">경찰청 사이버안전국</p>
										<table class="tbl privatelist">
											<colgroup>
												<col width="40%">
												<col>
											</colgroup>
								
											<tbody>
												<tr>
													<td class="fst">
														<div class="inner_cell">웹사이트</div>
													</td>
													<td>
														<div class="inner_cell"><a href="http://cyberbureau.police.go.kr" class="link_txt"
																target="_blank">http://cyberbureau.police.go.kr</a></div>
													</td>
												</tr>
												<tr>
													<td class="fst">
														<div class="inner_cell">연락처</div>
													</td>
													<td>
														<div class="inner_cell">국번없이 182</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<h4 class="tit_subject">10. 개인정보처리방침의 적용 범위</h4>
									<p class="desc_g">바이브의 개인정보처리방침은 썸트렌드 서비스(some.co.kr)와 썸머니 서비스(somemoney.co.kr)에 적용됩니다. 바이브에서 제공하는 다른 회사의 웹사이트 링크로 이동하였을 경우, 해당 웹사이트의 개인정보처리방침이 적용되니 새로 방문한 웹사이트의 정책을 반드시 검토하시기 바랍니다.</p>
								
									<h4 class="tit_subject">11. 개인정보처리방침의 변경</h4>
									<p class="desc_g">바이브의 개인정보처리방침은 썸트렌드 서비스(some.co.kr)와 썸머니 서비스(somemoney.co.kr)에 공개하여 누구나 쉽게 열람할 수 있도록 하고 있습니다. 법률이나 서비스의 변경사항을 반영하기 위한 목적 등으로 개인정보취급방침을 수정할 경우, 변경사항을 게시하며, 변경된 개인정보처리방침은 게시한 날로부터 7일 후부터 효력이 발생합니다. 다만, 수집하는 개인정보의 항목, 이용목적의 변경 등과 같이 이용자 권리의 중대한 변경이 발생할 때에는 최소 30일 전에 미리 알려드리겠습니다. 개인정보처리방침이 변경되는 경우, 이전 개인정보처리방침도 아래에서 확인할 수 있습니다.</p>
								
									<div class="enforcement_date">
										<b>공지 일자 : 2020년 9월 10일</b><br>
										<b>시행 일자 : 2020년 9월 10일</b>
									</div>
								</div>
							</div><!--  //개인정보 수집 -->
	
	
							<li class="loginCheckbox">
							<#if (register.formData['user.attributes.emailReceivingStatus']!'N') == 'N'>
								<input type="checkbox" value="Y"  class="statusCheckBox agreeCheckBox" id="user.attributes.emailReceivingStatus" name="user.attributes.emailReceivingStatus" ><label for="user.attributes.emailReceivingStatus" ><span>[선택]</span> 이메일 정보 수신 여부</label>
							<#else>
								<input type="checkbox" value="Y" checked class="statusCheckBox agreeCheckBox" id="user.attributes.emailReceivingStatus" name="user.attributes.emailReceivingStatus" ><label for="user.attributes.emailReceivingStatus" ><span>[선택]</span> 이메일 정보 수신 여부</label>
							</#if>
							
							
								
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
    
</@layout.registrationLayout>
