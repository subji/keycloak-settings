package com.vaiv.statics.rest;

import org.keycloak.Config.Scope;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.services.resource.RealmResourceProvider;
import org.keycloak.services.resource.RealmResourceProviderFactory;

public class UserStaticsRealmResourceProviderFactory implements RealmResourceProviderFactory {
	
	//이건 url 중간에 들어갈 주소
    public static final String ID = "users-statics";

    public String getId() {
        return ID;	
    }

    public RealmResourceProvider create(KeycloakSession session) {
        return new UserStaticsRealmResourceProvider(session);
    }

    public void init(Scope config) {
    }

    public void postInit(KeycloakSessionFactory factory) {
    }

    public void close() {
    }

}
