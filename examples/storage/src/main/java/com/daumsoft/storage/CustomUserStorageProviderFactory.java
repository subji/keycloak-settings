package com.daumsoft.storage;

import javax.naming.InitialContext;

import org.keycloak.component.ComponentModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.storage.UserStorageProviderFactory;

public class CustomUserStorageProviderFactory implements UserStorageProviderFactory<CustomUserStorageProvider> {

  @Override
  public CustomUserStorageProvider create(KeycloakSession session, ComponentModel model) {
    try {
      InitialContext ctx = new InitialContext();
      // java:global/{jar 파일명}/Provider 클래스명
      CustomUserStorageProvider provider = (CustomUserStorageProvider) ctx.lookup("java:global/custom-user-storage-jpa/" + CustomUserStorageProvider.class.getSimpleName());
      provider.setModel(model);
      provider.setSession(session);

      return provider;
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public String getId() {
    // <spi name="{이부분}">
    return "custom-user-storage";
  }

}