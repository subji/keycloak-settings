package kr.vaiv.recommender.rest;

import org.keycloak.Config.Scope;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.services.resource.RealmResourceProvider;
import org.keycloak.services.resource.RealmResourceProviderFactory;

public class RecommenderRealmResourceProviderFactory implements RealmResourceProviderFactory {

  public static final String ID = "recommender";

  @Override
  public RealmResourceProvider create(KeycloakSession session) {
    return new RecommenderRealmResourceProvider(session);
  }

  @Override
  public void init(Scope config) {
  }

  @Override
  public void postInit(KeycloakSessionFactory factory) {
  }

  @Override
  public void close() {
  }

  @Override
  public String getId() {
    return ID;
  }
  
}
