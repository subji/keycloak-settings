package kr.vaiv.recommender.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "user_attribute")
public class Attributes {
  
  @Id
  @GeneratedValue(generator = "uuid2")
  @Column(columnDefinition = "varchar(36)")
  @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
  private String id;

  // @ManyToOne(targetEntity = kr.vaiv.recommender.entity.User.class)
  // @JoinColumn(name = "user_id")
  // private User user;

  @Column(length = 255)
  private String name;
  @Column(length = 255)
  private String value;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  // public User getUser() {
  //   return user;
  // }

  // public void setUser(User user) {
  //   this.user = user;
  // }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

}
