package com.daumsoft.storage.userStorage.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.daumsoft.storage.userStorage.entity.UserInfo;

public class CustomUserStorageRepository {

	// UserInfo findByUserSeq(Long id);
	// UserInfo findByUserId(String username);
	// List<UserInfo> findByUserIdLike(String search);

  @PersistenceContext
  private EntityManager entityManager;

  // public CustomUserStorageRepository(EntityManager entityManager) {
  //   this.entityManager = entityManager;
  // }

  public List<UserInfo> findByUserIdLike(String userId) {
    List<UserInfo> result = entityManager.createNamedQuery("SELECT u.* FROM UserInfo u WHERE u.userId like :userId",UserInfo.class).setParameter("userId", userId).getResultList();
    System.out.println("\n\n");
    System.out.println(result);
    System.out.println(result.size());
    System.out.println("\n\n");
    return result;
  }

}