package kr.vaiv.recommender.spi.impl;

import org.keycloak.Config.Scope;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;

import kr.vaiv.recommender.spi.RecommenderService;
import kr.vaiv.recommender.spi.RecommenderServiceProviderFactory;

public class RecommenderServiceProviderFactoryImpl implements RecommenderServiceProviderFactory {

  @Override
  public RecommenderService create(KeycloakSession session) {
    // TODO Auto-generated method stub
    return null;
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
    return "recommenderServiceImpl";
  }
  
}
