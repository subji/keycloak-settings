package com.daumsoft.storage.userStorage.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "T_AUTHORITIES_MAPPING")
public class AuthoritiesMapping {
  
  @EmbeddedId
  private AuthoritiesMapptingKey id;

  @JoinColumn(name = "authority_type_seq", insertable = false, updatable = false)
  @ManyToOne(fetch = FetchType.LAZY)
  private AuthoritiesType authoritiesType;

  @JoinColumn(name = "user_seq", insertable = false, updatable = false)
  @ManyToOne(fetch = FetchType.LAZY)
  private UserInfo userInfo;
  
}