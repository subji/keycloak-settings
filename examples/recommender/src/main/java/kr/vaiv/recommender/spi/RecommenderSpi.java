package kr.vaiv.recommender.spi;

import org.keycloak.provider.Provider;
import org.keycloak.provider.ProviderFactory;
import org.keycloak.provider.Spi;

public class RecommenderSpi implements Spi {

  @Override
  public boolean isInternal() {
    return false;
  }

  @Override
  public String getName() {
    return "recommender";
  }

  @Override
  public Class<? extends Provider> getProviderClass() {
    return RecommenderService.class;
  }

  @Override
  public Class<? extends ProviderFactory> getProviderFactoryClass() {
    return RecommenderServiceProviderFactory.class;
  }
  
}
