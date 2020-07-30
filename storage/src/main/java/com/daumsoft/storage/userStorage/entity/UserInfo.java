package com.daumsoft.storage.userStorage.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "T_USER")
@NamedQueries({
  @NamedQuery(name = "findAll", query = "FROM UserInfo u WHERE u.delYn = 'N'"),
  @NamedQuery(name = "findByUserIdLike", query = "FROM UserInfo u WHERE u.userId LIKE CONCAT('%', :userId, '%')"),
  @NamedQuery(name = "findByUserId", query = "FROM UserInfo u WHERE u.userId = :userId"),
  @NamedQuery(name = "findByUserEmail", query = "FROM UserInfo u WHERE u.userEmail = :userEmail")
})
public class UserInfo {
  
  @Id
  @Column(name = "user_seq")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long userSeq;
  @Column(name = "user_id")
  private String userId;
  @Column(name = "user_email")
  private String userEmail;
  @Column(name = "user_password")
  private String userPassword;

  @Column(name = "del_yn")
  private String delYn;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "userInfo")
  private List<AuthoritiesMapping> authoritiesMapping;

}