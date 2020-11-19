package com.vaiv.nice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.keycloak.models.KeycloakSession;

import NiceID.Check.CPClient;

public class NiceIdService {
		  
	private final String niceIdSiteCode = "BR695";
	private final String niceIdSitePassword = "BhZWMPa3P2Ks";
//	private final String niceIdRedirectUrl = "http://localhost:8093/auth/realms/";
		  
  /**
   * Generate key will be used to Nice Id certification
   * @param session
   * @param request
   */
  public String setNiceIdtoSession(HttpSession session, HttpServletRequest request, KeycloakSession keycloakSession) {
	System.out.println("여기 왔음");
    CPClient cpClient = new CPClient();

    String niceSiteCode = niceIdSiteCode;
    String niceSitePassword = niceIdSitePassword;
    String requestNumber = cpClient.getRequestNO(niceSiteCode);
    String niceIdRedirectUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"") + "/auth/realms/";
    System.out.println(niceIdRedirectUrl);

    session.setAttribute("REQ_SEQ", requestNumber);

    String gender = ""; // 없으면 기본 선택 값, 0 : 여자, 1 : 남자
    String authType = "M"; // 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
    String isBasicPage = ""; // 없으면 기본 웹페이지 / Mobile : 모바일페이지
    String hasCancelButton = "N"; // Y : 취소버튼 있음 / N : 취소버튼 없음
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
    // 리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. 
    // ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    
    System.out.println(request.getRequestURL().toString());
    String returnBaseUrl = niceIdRedirectUrl + keycloakSession.getContext().getRealm().getName() + "/" + NiceIdRestProviderFactory.ID;
    String returnUrl = returnBaseUrl + "/certification/success"; // 성공시 이동될 URL
    String errorUrl = returnBaseUrl + "/certification/failed"; // 실패시 이동될 URL

    StringBuilder builder = new StringBuilder();
    builder.append("6:GENDER" + gender.getBytes().length + ":" + gender);
    builder.append("7:REQ_SEQ" + requestNumber.getBytes().length + ":" + requestNumber);
    builder.append("7:RTN_URL" + returnUrl.getBytes().length + ":" + returnUrl);
    builder.append("7:ERR_URL" + errorUrl.getBytes().length + ":" + errorUrl);
    builder.append("8:SITECODE" + niceSiteCode.getBytes().length + ":" + niceSiteCode);
    builder.append("9:AUTH_TYPE" + authType.getBytes().length + ":" + authType);
    builder.append("9:CUSTOMIZE" + isBasicPage.getBytes().length + ":" + isBasicPage);
    builder.append("11:POPUP_GUBUN" + hasCancelButton.getBytes().length + ":" + hasCancelButton);

    String message = "";
    String encoded = "";

    System.out.println(builder.toString());
    
    int result = cpClient.fnEncode(niceSiteCode, niceSitePassword, builder.toString());

    if (result == 0) {
      encoded = cpClient.getCipherData();
      request.setAttribute("encoded", encoded);
      return encoded;
    } else if (result == -1) {
      message = "암호화 시스템 에러입니다.";
    } else if (result == -2) {
      message = "암호화 처리오류입니다.";
    } else if (result == -3) {
      message = "암호화 데이터 오류입니다.";
    } else if (result == -9) {
      message = "입력 데이터 오류입니다.";
    } else {
      message = "알수 없는 에러 입니다. result : " + result;
    }
    return null;
  }

  /**
   * Success certificate from Nice Id
   * @param session
   * @param request
   */
  @SuppressWarnings("unused")
  public String setNiceIdSuccessToSession(HttpSession session, HttpServletRequest request)  {
    CPClient cpClient = new CPClient();
    String encoded = requestReplace(request.getParameter("EncodeData"), "encodeData");
    String niceSiteCode = niceIdSiteCode;
    String niceSitePassword = niceIdSitePassword;

    String cipherDateTime = ""; // 복호화한 시간
    String requestNumber = ""; // 요청 번호
    String responseNumber = ""; // 인증 고유번호
    String authType = ""; // 인증 수단
    String name = ""; // 성명
    String duplicateInfo = ""; // 중복가입 확인값 (DI_64 byte)
    String connectionInfo = ""; // 연계정보 확인값 (CI_88 byte)
    String birth = ""; // 생년월일(YYYYMMDD)
    String gender = ""; // 성별
    String nationInfo = ""; // 내/외국인정보 (개발가이드 참조)
    String mobileNumber = ""; // 휴대폰번호
    String mobileCompany = ""; // 통신사
    String message = "";
    String data = "";

    int result = cpClient.fnDecode(niceSiteCode, niceSitePassword, encoded);

    if (result == 0)  {
      data = cpClient.getPlainData();
      cipherDateTime = cpClient.getCipherDateTime();

      Map<?, ?> map = cpClient.fnParse(data);

      name = (String)map.get("NAME");
      gender = (String) map.get("GENDER");
      // name = (String) map.get("UTF8_NAME"); // charset utf8 사용시 주석 해제 후 사용
      birth = (String) map.get("BIRTHDATE");
      duplicateInfo = (String) map.get("DI");
      connectionInfo = (String) map.get("CI");
      authType = (String) map.get("AUTH_TYPE");
      requestNumber = (String) map.get("REQ_SEQ");
      responseNumber = (String) map.get("RES_SEQ");
      mobileNumber = (String) map.get("MOBILE_NO");
      mobileCompany = (String) map.get("MOBILE_CO");
      nationInfo = (String) map.get("NATIONALINFO");
      
      String existRequestNumber = (String) session.getAttribute("REQ_SEQ");

      if (!requestNumber.equals(existRequestNumber))  {
        message = "세션값 불일치 오류입니다.";
        responseNumber = "";
        authType = "";
      }

    } else if (result == -1) {
      message = "복호화 시스템 오류입니다.";
    } else if (result == -4) {
      message = "복호화 처리 오류입니다.";
    } else if (result == -5) {
      message = "복호화 해쉬 오류입니다.";
    } else if (result == -6) {
      message = "복호화 데이터 오류입니다.";
    } else if (result == -9) {
      message = "입력 데이터 오류입니다.";
    } else if (result == -12) {
      message = "사이트 패스워드 오류입니다.";
    } else {
      message = "알수 없는 에러 입니다. result : " + result;
    }
    

	StringBuilder sb = new StringBuilder();
	sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
	sb.append("<html>");
	sb.append("<head>");
	sb.append("</head>");
	sb.append("<body>");
	sb.append("  전화번호 : <input type='text' value='"+mobileNumber+"'>");
	sb.append("  이름 : <input type='text' value='"+name+"'>");
	sb.append("	<script>");
	sb.append("    let doc = window.opener.document;");
	sb.append("    let redirect = doc.getElementById('redirect');");
	sb.append("    let phoneNumber = doc.getElementById('phoneNumber');");
	sb.append("    phoneNumber.value='"+mobileNumber+"';");
	sb.append("    doc.querySelector(\"#\"+doc.querySelector(\"#findTab li.on\").dataset.formSubmitTagId).click();");
	sb.append("    window.close();");
	sb.append("  </script>");
	sb.append("</body>");

	sb.append("</html>");
	return sb.toString();
  }

  /**
   * 데이터 재구성
   * @param paramValue
   * @param gubun
   * @return
   */
  public String requestReplace(String paramValue, String gubun) {
    String result = "";

    if (paramValue != null) {
      paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
      paramValue = paramValue.replaceAll("\\*", "");
      paramValue = paramValue.replaceAll("\\?", "");
      paramValue = paramValue.replaceAll("\\[", "");
      paramValue = paramValue.replaceAll("\\{", "");
      paramValue = paramValue.replaceAll("\\(", "");
      paramValue = paramValue.replaceAll("\\)", "");
      paramValue = paramValue.replaceAll("\\^", "");
      paramValue = paramValue.replaceAll("\\$", "");
      paramValue = paramValue.replaceAll("'", "");
      paramValue = paramValue.replaceAll("@", "");
      paramValue = paramValue.replaceAll("%", "");
      paramValue = paramValue.replaceAll(";", "");
      paramValue = paramValue.replaceAll(":", "");
      paramValue = paramValue.replaceAll("-", "");
      paramValue = paramValue.replaceAll("#", "");
      paramValue = paramValue.replaceAll("--", "");
      paramValue = paramValue.replaceAll("-", "");
      paramValue = paramValue.replaceAll(",", "");

      if (gubun != "encodeData") {
        paramValue = paramValue.replaceAll("\\+", "");
        paramValue = paramValue.replaceAll("/", "");
        paramValue = paramValue.replaceAll("=", "");
      }

      result = paramValue;
    }
    return result;
  }

}