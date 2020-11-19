package kr.vaiv.recommender.provider;

import java.util.Collections;
import java.util.List;

import org.keycloak.connections.jpa.entityprovider.JpaEntityProvider;

import kr.vaiv.recommender.entity.User;

public class RecommenderJpaEntityProvider implements JpaEntityProvider {

  @Override
  public void close() {
  }

  @Override
  public String getChangelogLocation() {
    return null;
  }

  @Override
  public List<Class<?>> getEntities() {
    return Collections.<Class<?>>singletonList(User.class);
  }

  @Override
  public String getFactoryId() {
    return RecommenderJpaEntityProviderFactory.ID;
  }
  
}
