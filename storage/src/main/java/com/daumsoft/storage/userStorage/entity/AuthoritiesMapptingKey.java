package com.daumsoft.storage.userStorage.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class AuthoritiesMapptingKey implements Serializable {

  private static final long serialVersionUID = 1781936133500624964L;

  @Column(name = "user_seq", insertable = false, updatable = false)
  private Long userSeq;

  @Column(name = "authority_type_seq", insertable = false, updatable = false)
  private Long authorityTypeSeq;

}