package kr.vaiv.recommender.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "user_entity")
// @NamedQueries({
//   @NamedQuery(
//     name = "findRecommenderList", 
//     query = 
//     "SELECT u.id, " +
//            "u.email, " + 
//            "( SELECT a.VALUE FROM Attributes a WHERE a.USER_ID = u.id AND a.NAME = 'nickname' ) AS nickname " + 
//           //  "( SELECT (c.cnt - 1) FROM ( SELECT a.USER_ID, a.VALUE, count(a.VALUE) AS cnt FROM Attributes a WHERE a.NAME = 'nickname' GROUP BY a.VALUE ) c WHERE c.value = nickname ) AS recommend_count " + 
//       "FROM User u " + 
//      "WHERE u.ENABLED = 1"
//     )
// })
public class User {
  
  @Id
  @GeneratedValue(generator = "uuid2")
  @Column(columnDefinition = "varchar(36)")
  @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
  private String id;

  // @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
  // @OneToMany(targetEntity = kr.vaiv.recommender.entity.Attributes.class)
  // private Set<Attributes> attributes;
  
  @Column(length = 255)
  private String email;
  @Column(length = 255)
  private String emailConstraint;
  @Column(length = 255)
  private String federationLink;
  @Column(length = 255)
  private String firstName;
  @Column(length = 255)
  private String lastName;
  @Column(length = 255)
  private String realmId;
  @Column(length = 255)
  private String username;
  @Column(length = 255)
  private String serviceAccountClientLink;
  
  @Column(length = 1)
  private Integer emailVerified;
  @Column(length = 1)
  private Integer enabled;
  @Column(length = 11)
  private Integer notBefore;

  @Column(length = 20)
  private Long createdTimestamp;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  // public Set<Attributes> getAttributes() {
  //   return attributes;
  // }

  // public void setAttributes(Set<Attributes> attributes) {
  //   this.attributes = attributes;
  // }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getEmailConstraint() {
    return emailConstraint;
  }

  public void setEmailConstraint(String emailConstraint) {
    this.emailConstraint = emailConstraint;
  }

  public String getFederationLink() {
    return federationLink;
  }

  public void setFederationLink(String federationLink) {
    this.federationLink = federationLink;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getRealmId() {
    return realmId;
  }

  public void setRealmId(String realmId) {
    this.realmId = realmId;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getServiceAccountClientLink() {
    return serviceAccountClientLink;
  }

  public void setServiceAccountClientLink(String serviceAccountClientLink) {
    this.serviceAccountClientLink = serviceAccountClientLink;
  }

  public Integer getEmailVerified() {
    return emailVerified;
  }

  public void setEmailVerified(Integer emailVerified) {
    this.emailVerified = emailVerified;
  }

  public Integer getEnabled() {
    return enabled;
  }

  public void setEnabled(Integer enabled) {
    this.enabled = enabled;
  }

  public Integer getNotBefore() {
    return notBefore;
  }

  public void setNotBefore(Integer notBefore) {
    this.notBefore = notBefore;
  }

  public Long getCreatedTimestamp() {
    return createdTimestamp;
  }

  public void setCreatedTimestamp(Long createdTimestamp) {
    this.createdTimestamp = createdTimestamp;
  }

}
