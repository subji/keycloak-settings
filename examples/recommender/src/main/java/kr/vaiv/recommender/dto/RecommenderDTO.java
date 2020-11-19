package kr.vaiv.recommender.dto;

import java.math.BigInteger;

import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.SqlResultSetMapping;

@SqlResultSetMapping(
        name="RecommenderMapping",
        classes = @ConstructorResult(
                targetClass = RecommenderDTO.class,
                columns = {
                        @ColumnResult(name="userId", type = String.class),
                        @ColumnResult(name="email", type = String.class),
                        @ColumnResult(name="nickname", type = String.class),
                        @ColumnResult(name="username", type = String.class),
                        @ColumnResult(name="phone", type = String.class),
                        @ColumnResult(name="recommendCount", type = Long.class)
                })
)
public class RecommenderDTO {
  
  private String userId;
  private String email;
  private String nickname;
  private String username;
  private String phone;
  private BigInteger recommendCount;

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public BigInteger getRecommendCount() {
    return recommendCount;
  }

  public void setRecommendCount(BigInteger recommendCount) {
    this.recommendCount = recommendCount;
  }

}
