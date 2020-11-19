package com.github.leroyguillaume.keycloak.bcrypt;

import org.keycloak.credential.hash.PasswordHashProvider;
import org.keycloak.models.PasswordPolicy;
import org.keycloak.models.credential.PasswordCredentialModel;

/**
 * @author <a href="mailto:pro.guillaume.leroy@gmail.com">Guillaume Leroy</a>
 */
public class PlainPasswordHashProvider implements PasswordHashProvider {
	private final int defaultIterations;
	private final String providerId;

	public PlainPasswordHashProvider(String providerId, int defaultIterations) {
		this.providerId = providerId;
		this.defaultIterations = defaultIterations;
	}

	@Override
	public boolean policyCheck(PasswordPolicy policy, PasswordCredentialModel credential) {
		int policyHashIterations = policy.getHashIterations();
		if (policyHashIterations == -1) {
			policyHashIterations = defaultIterations;
		}

		return credential.getPasswordCredentialData().getHashIterations() == policyHashIterations
				&& providerId.equals(credential.getPasswordCredentialData().getAlgorithm());
	}

	@Override
	public PasswordCredentialModel encodedCredential(String rawPassword, int iterations) {
		return PasswordCredentialModel.createFromValues(providerId, new byte[0], iterations, rawPassword);
	}

	@Override
	public String encode(String rawPassword, int iterations) {
		return rawPassword;
	}

	@Override
	public void close() {

	}

	@Override
	public boolean verify(String rawPassword, PasswordCredentialModel credential) {
		return rawPassword.equals(credential.getPasswordSecretData().getValue());
	}

}
