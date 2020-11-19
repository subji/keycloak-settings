package kr.vaiv.recommender.rest;

import org.keycloak.models.KeycloakSession;
import org.keycloak.services.resource.RealmResourceProvider;

public class RecommenderRealmResourceProvider implements RealmResourceProvider {

  private KeycloakSession session;

  public RecommenderRealmResourceProvider(KeycloakSession session) {
    this.session = session;
  }

  @Override
  public void close() {
  }

  @Override
  public Object getResource() {
    return new RecommenderRestResource(session);
  }
  
}
