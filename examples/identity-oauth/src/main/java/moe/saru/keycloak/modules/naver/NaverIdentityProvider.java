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

package moe.saru.keycloak.modules.naver;

import com.fasterxml.jackson.databind.JsonNode;

import org.keycloak.broker.oidc.AbstractOAuth2IdentityProvider;
import org.keycloak.broker.oidc.OAuth2IdentityProviderConfig;
import org.keycloak.broker.oidc.mappers.AbstractJsonUserAttributeMapper;
import org.keycloak.broker.provider.BrokeredIdentityContext;
import org.keycloak.broker.provider.IdentityBrokerException;
import org.keycloak.broker.provider.util.SimpleHttp;
import org.keycloak.broker.social.SocialIdentityProvider;
import org.keycloak.events.EventBuilder;
import org.keycloak.models.KeycloakSession;

public class NaverIdentityProvider extends AbstractOAuth2IdentityProvider implements SocialIdentityProvider {

	public static final String AUTH_URL = "https://nid.naver.com/oauth2.0/authorize";
	public static final String TOKEN_URL = "https://nid.naver.com/oauth2.0/token";
	public static final String PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
	public static final String DEFAULT_SCOPE = "";

	public NaverIdentityProvider(KeycloakSession session, OAuth2IdentityProviderConfig config) {
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
		return PROFILE_URL;
	}

	@Override
	protected BrokeredIdentityContext extractIdentityFromProfile(EventBuilder event, JsonNode profile) {
		System.out.println("extractIdentityFromProfile 1");
		System.out.println(profile);
		System.out.println();

		BrokeredIdentityContext user = new BrokeredIdentityContext(profile.get("response").get("id").asText());
		
		user.setIdpConfig(getConfig());
		user.setUsername(profile.get("response").get("id").asText());
		
		if (profile.get("response").get("email") == null)	{
			user.setEmail("");
		} else {
			user.setEmail(profile.get("response").get("email").asText());
		}

		user.setIdp(this);

		AbstractJsonUserAttributeMapper.storeUserProfileForMapper(user, profile, getConfig().getAlias());

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

	@Override
	protected String getDefaultScopes() {
		return DEFAULT_SCOPE;
	}

}
