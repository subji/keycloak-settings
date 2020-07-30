package com.daumsoft.storage;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.ejb.Local;
import javax.ejb.Remove;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.daumsoft.storage.userStorage.adapter.CustomUserAdapter;
import com.daumsoft.storage.userStorage.entity.UserInfo;

import org.keycloak.component.ComponentModel;
import org.keycloak.credential.CredentialInput;
import org.keycloak.credential.CredentialInputUpdater;
import org.keycloak.credential.CredentialInputValidator;
import org.keycloak.models.GroupModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserCredentialModel;
import org.keycloak.models.UserModel;
import org.keycloak.models.credential.OTPCredentialModel;
import org.keycloak.models.credential.PasswordCredentialModel;
import org.keycloak.storage.StorageId;
import org.keycloak.storage.UserStorageProvider;
import org.keycloak.storage.user.UserLookupProvider;
import org.keycloak.storage.user.UserQueryProvider;
import org.keycloak.storage.user.UserRegistrationProvider;
import org.mindrot.jbcrypt.BCrypt;


@Stateful
@Local(CustomUserStorageProvider.class)
public class CustomUserStorageProvider implements UserStorageProvider, 
                                                  UserLookupProvider, 
                                                  UserQueryProvider, 
                                                  UserRegistrationProvider, 
                                                  CredentialInputValidator, 
                                                  CredentialInputUpdater {

  protected ComponentModel model;
  protected KeycloakSession session;

  @PersistenceContext
  protected EntityManager entityManager;

  // 이건 왜 해줘야 되는지 모르지만 해줘야 된다.
  public CustomUserStorageProvider() {}

  public CustomUserStorageProvider(KeycloakSession session, ComponentModel model) {
    this.model = model;
    this.session = session;
  }
  
  @Remove
  @Override
  public void close() {}

  /**
   * When login -> get userId
   */
  @Override
  public UserModel getUserById(String keycloakId, RealmModel realm) {
    System.out.println("\n\ngetUserById\n\n");

    String userId = StorageId.externalId(keycloakId);
    UserInfo userInfo = entityManager.createNamedQuery("findByUserId", UserInfo.class)
    .setParameter("userId", userId)
    .getResultList().stream().findFirst().orElse(null);
    
    return new CustomUserAdapter(session, realm, model, userInfo);
  }
  /**
   * First login -> get username
   */
  @Override
  public UserModel getUserByUsername(String username, RealmModel realm) {
    System.out.println("\ngetUserByUsername : " + username + "\n");
    
    UserInfo userInfo = entityManager.createNamedQuery("findByUserId", UserInfo.class)
    .setParameter("userId", username)
    .getResultList().stream().findFirst().orElse(null);

    return userInfo == null ? null : new CustomUserAdapter(session, realm, model, userInfo);
  }

  @Override
  public UserModel getUserByEmail(String email, RealmModel realm) {
    System.out.println("\ngetUserByEmail: " + email + "\n");

    UserInfo userInfo = entityManager.createNamedQuery("findByUserEmail", UserInfo.class)
    .setParameter("userEmail", email)
    .getResultList().stream().findFirst().orElse(null);

    return userInfo == null ? null : new CustomUserAdapter(session, realm, model, userInfo);
  }

  @Override
  public UserModel addUser(RealmModel realm, String username) {
    // System.out.println("\naddUser\n");
    // System.out.println(username);
    // System.out.println("\naddUser\n");
    // UserInfo userInfo = new UserInfo();
    // userInfo.setUserId(username);
    // userInfo.setDelYn("N");
    // entityManager.persist(userInfo);
    // return new CustomUserAdapter(session, realm, model, userInfo);
    return null;
  }

  @Override
  public boolean removeUser(RealmModel realm, UserModel user) {
    return false;
  }

  @Override
  public boolean updateCredential(RealmModel realm, UserModel user, CredentialInput input) {
    System.out.println("updatecredential\n\n");
    System.out.println(user.toString());
    System.out.println(input);
    System.out.println("updatecredential\n\n");
    return true;
  }

  @Override
  public void disableCredentialType(RealmModel realm, UserModel user, String credentialType) {
    System.out.println("disableCredentialType\n\n");
    System.out.println(user.toString());
    System.out.println(credentialType);
    System.out.println("disableCredentialType\n\n");
  }

  /**
   * Disabled credential types 
   */
  @Override
  public Set<String> getDisableableCredentialTypes(RealmModel realm, UserModel user) {
    System.out.println("getDisableableCredentialTypes\n\n");

    Set<String> set = new HashSet<>();
    set.add(OTPCredentialModel.TYPE);

    return set;
  }

  /**
   * Credential Type (password, otp, ...)
   */
  @Override
  public boolean supportsCredentialType(String credentialType) {
    System.out.println("\n\n supportsCredentialType: " + credentialType + "\n\n");

    return PasswordCredentialModel.TYPE.equals(credentialType);
  }

  @Override
  public boolean isConfiguredFor(RealmModel realm, UserModel user, String credentialType) {
    System.out.println("\n\n isConfiguredFor: " + credentialType + "\n\n");
    return false;
  }

  /**
   * Login -> Password validate
   */
  @Override
  public boolean isValid(RealmModel realm, UserModel user, CredentialInput credentialInput) {
    if (!(credentialInput instanceof UserCredentialModel))
      return false;
    if (supportsCredentialType(credentialInput.getType())) {
      UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");

      return BCrypt.checkpw(credentialInput.getChallengeResponse(), userInfo.getUserPassword());
    } else {
      return false; 
    }
  }

  @Override
  public int getUsersCount(RealmModel realm) {
    return 0;
  }

  @Override
  public List<UserModel> getUsers(RealmModel realm) {
    System.out.println("\ngetUsers\n");
    return null;
  }

  @Override
  public List<UserModel> getUsers(RealmModel realm, int firstResult, int maxResults) {
    System.out.println("getUsers\n\n");
    System.out.println(firstResult + ", " + maxResults);
    System.out.println("getUsers\n\n");
    return null;
  }

  @Override
  public List<UserModel> searchForUser(String search, RealmModel realm) {
    System.out.println("\nsearchForUser 1 :" + search + "\n\n");
    return null;
  }

  // Users -> Search...
  @Override
  public List<UserModel> searchForUser(String search, RealmModel realm, int firstResult, int maxResults) {
    System.out.println("\nsearchForUser 2 :" + search + "\n");
    
    List<UserInfo> result = entityManager.createNamedQuery("findByUserIdLike", UserInfo.class).setParameter("userId", search).getResultList();

    // AuthoritiesType authType = result.get(0).getAuthoritiesMapping().get(0).getAuthoritiesType();
    
    // System.out.println("searchForUser 2 Role: ");
    // System.out.println(authType.getAuthorityType());
    // System.out.println("searchForUser 2 end");

    return result
    .stream()
    .map(user -> new CustomUserAdapter(session, realm, model, user))
    .collect(Collectors.toList());
  }

  @Override
  public List<UserModel> searchForUser(Map<String, String> params, RealmModel realm) {
    System.out.println("\nsearchForUser 3 : \n\n");
    return null;
  }

  // Users -> View all users
  @Override
  public List<UserModel> searchForUser(Map<String, String> params, RealmModel realm, int firstResult, int maxResults) {
    System.out.println("\nsearchForUser 4 :\n\n");
    
    List<UserInfo> result = entityManager.createNamedQuery("findAll", UserInfo.class)
    .setFirstResult(firstResult)
    .setMaxResults(20)
    .getResultList();

    return result.stream().map(user -> new CustomUserAdapter(session, realm, model, user))
        .collect(Collectors.toList());
  }

  @Override
  public List<UserModel> getGroupMembers(RealmModel realm, GroupModel group, int firstResult, int maxResults) {
    return null;
  }

  @Override
  public List<UserModel> getGroupMembers(RealmModel realm, GroupModel group) {
    return null;
  }

  @Override
  public List<UserModel> searchForUserByUserAttribute(String attrName, String attrValue, RealmModel realm) {
    return null;
  }

  public void setModel(ComponentModel model) {
    this.model = model;
  }

  public void setSession(KeycloakSession session) {
    this.session = session;
  }
  
}