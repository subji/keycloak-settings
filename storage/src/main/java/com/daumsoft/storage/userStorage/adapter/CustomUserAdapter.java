package com.daumsoft.storage.userStorage.adapter;

import java.util.Optional;

import com.daumsoft.storage.userStorage.entity.AuthoritiesType;
import com.daumsoft.storage.userStorage.entity.UserInfo;

import org.keycloak.component.ComponentModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.RoleModel;
import org.keycloak.storage.StorageId;
import org.keycloak.storage.adapter.AbstractUserAdapterFederatedStorage;

public class CustomUserAdapter extends AbstractUserAdapterFederatedStorage {

  protected UserInfo userInfo;
  protected String keycloakId;

  public CustomUserAdapter(KeycloakSession session, RealmModel realm, ComponentModel model, UserInfo userInfo) {
    super(session, realm, model);

    this.userInfo = userInfo;

    if (userInfo != null) {
      this.keycloakId = StorageId.keycloakId(model, String.valueOf(userInfo.getUserSeq()));
      session.setAttribute("userInfo", userInfo);
    }
  }
  
  @Override
  public String getUsername() {
    return userInfo != null ? userInfo.getUserId() : null;
  }

  @Override
  public void setUsername(String username) {
    userInfo.setUserId(username);
  }

  @Override
  public String getEmail() {
    return userInfo != null ? userInfo.getUserEmail() : null;
  }

  @Override
  public void setEmail(String email) {
    userInfo.setUserEmail(email);
  }

  @Override
  public void grantRole(RoleModel role) {
    AuthoritiesType authType = userInfo.getAuthoritiesMapping().get(0).getAuthoritiesType();

    System.out.println("grantRole\n");
    System.out.println(authType.getAuthorityType());
    System.out.println("\ngrantRole");
  }

  public String getPassword() {
    return this.userInfo.getUserPassword();
  }
  
}