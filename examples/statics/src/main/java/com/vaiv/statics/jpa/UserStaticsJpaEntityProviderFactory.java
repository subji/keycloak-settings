
package com.vaiv.statics.jpa;

import org.keycloak.Config.Scope;
import org.keycloak.connections.jpa.entityprovider.JpaEntityProvider;
import org.keycloak.connections.jpa.entityprovider.JpaEntityProviderFactory;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;

public class UserStaticsJpaEntityProviderFactory implements JpaEntityProviderFactory {

	//이게 뭐지??
	protected static final String ID = "user-statics-provider";
	
    public JpaEntityProvider create(KeycloakSession session) {
        return new UserStaticsJpaEntityProvider();
    }

    public String getId() {
        return ID;
    }

    public void init(Scope config) {
    }

    public void postInit(KeycloakSessionFactory factory) {
    }

    public void close() {
    }

}
