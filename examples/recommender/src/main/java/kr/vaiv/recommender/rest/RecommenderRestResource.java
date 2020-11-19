package kr.vaiv.recommender.rest;

import javax.ws.rs.Path;

import org.keycloak.models.KeycloakSession;

public class RecommenderRestResource {
  
  private final KeycloakSession session;

  public RecommenderRestResource(KeycloakSession session) {
    this.session = session;
  }

  @Path("")
  public RecommenderResource getRecommenderResource() {
    return new RecommenderResource(session);
  }

}
