/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.vaiv.google;

import java.util.Base64;

import org.keycloak.broker.oidc.AbstractOAuth2IdentityProvider;
import org.keycloak.broker.oidc.OAuth2IdentityProviderConfig;
import org.keycloak.broker.oidc.mappers.AbstractJsonUserAttributeMapper;
import org.keycloak.broker.provider.BrokeredIdentityContext;
import org.keycloak.broker.provider.IdentityBrokerException;
import org.keycloak.broker.provider.util.SimpleHttp;
import org.keycloak.broker.social.SocialIdentityProvider;
import org.keycloak.events.EventBuilder;
import org.keycloak.models.KeycloakSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CustomGoogleIdentityProvider extends AbstractOAuth2IdentityProvider implements SocialIdentityProvider {

	public static final String AUTH_URL = "https://accounts.google.com/o/oauth2/v2/auth";
	public static final String TOKEN_URL = "https://oauth2.googleapis.com/token";
	public static final String DEFAULT_SCOPE = "openid profile email";
	public static final String PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
	
	ObjectMapper mapper = new ObjectMapper();
	
	public CustomGoogleIdentityProvider(KeycloakSession session, OAuth2IdentityProviderConfig config) {
		super(session, config);
		
		config.setTokenUrl(TOKEN_URL);
		config.setUserInfoUrl(PROFILE_URL);
		config.setAuthorizationUrl(AUTH_URL);
	}
	
	

	@Override
	protected boolean supportsExternalExchange() {
		return true;
	}

	@Override
	protected String getProfileEndpointForValidation(EventBuilder event) {
		return null;
	}


	@Override
	public BrokeredIdentityContext getFederatedIdentity(String response) {
        String accessToken = extractTokenFromResponse(response, getAccessTokenResponseParameter());
        
        if (accessToken == null) {
            throw new IdentityBrokerException("No access token available in OAuth server response: " + response);
        }
        BrokeredIdentityContext user = null;
		try {
			
		    JsonNode jsonNode = mapper.readTree(response);
			user = extractIdentityFromProfile(null, jsonNode.get("id_token"));
			user.setUserAttribute("website", "google");
		} catch (Exception e) {
			throw new IdentityBrokerException("Could not obtain user profile from google.", e);
		}
		user.getContextData().put(FEDERATED_ACCESS_TOKEN, accessToken);
        return user;
    }

	
	
	@Override
	protected String getDefaultScopes() {
		return DEFAULT_SCOPE;
	}

	
	@Override
	protected BrokeredIdentityContext extractIdentityFromProfile(EventBuilder event, JsonNode idToken) {
		
		System.out.println("커스텀 구글 로그인 여기까지 왔음");
		System.out.println(idToken);
		System.out.println();
		
		JsonNode parsedIdToken = testDecodeJWT(idToken.toString());
		BrokeredIdentityContext user = new BrokeredIdentityContext(parsedIdToken.get("sub").asText());
		
		user.setIdpConfig(getConfig());
		user.setUsername(parsedIdToken.get("sub").asText());
		
		if (parsedIdToken.get("email").asText() == null)	{
			user.setEmail("");
		} else {
			user.setEmail(parsedIdToken.get("email").asText());
		}

		user.setIdp(this);

		AbstractJsonUserAttributeMapper.storeUserProfileForMapper(user, parsedIdToken, getConfig().getAlias());

		return user;
		
	}

	@Override
	protected BrokeredIdentityContext doGetFederatedIdentity(String accessToken) {
		try {
			
			JsonNode profile = SimpleHttp.doGet(PROFILE_URL, session).param("access_token", accessToken).asJson();
			BrokeredIdentityContext user = extractIdentityFromProfile(null, profile);

			return user;
		} catch (Exception e) {
			throw new IdentityBrokerException("Could not obtain user profile from naver.", e);
		}
	}
	
	
	/**
	 * jwt token decoder하는 곳 
	 * @throws JsonProcessingException 
	 * @throws JsonMappingException 
	 */
    public JsonNode testDecodeJWT(String jwtToken) {
    	
        String[] split_string = jwtToken.split("\\.");
        String base64EncodedBody = split_string[1];
        String body = new String(Base64.getUrlDecoder().decode(base64EncodedBody));
        
        try {
			return mapper.readTree(body);
		} catch (Exception e) {
			throw new IdentityBrokerException("jwtToken decode error from google.", e);
		}
    }

}
