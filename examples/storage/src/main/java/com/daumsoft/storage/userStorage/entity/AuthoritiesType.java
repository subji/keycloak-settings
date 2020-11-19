package com.daumsoft.storage.userStorage.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "T_AUTHORITIES_TYPE")
public class AuthoritiesType {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "authority_type_seq")
  private Long authorityTypeSeq;
  @Column(name = "authority_type")
  private String authorityType;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "authoritiesType")
  List<AuthoritiesMapping> authoritiesMapping;

}