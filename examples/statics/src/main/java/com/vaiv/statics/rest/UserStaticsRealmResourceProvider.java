package com.vaiv.statics.rest;


import org.keycloak.models.KeycloakSession;
import org.keycloak.services.resource.RealmResourceProvider;

public class UserStaticsRealmResourceProvider implements RealmResourceProvider {

    private KeycloakSession session;

    public UserStaticsRealmResourceProvider(KeycloakSession session) {
        this.session = session;
    }

    public Object getResource() {
        return new UserStaticsResource(session);
    }

    public void close() {
    }

}
