package kr.vaiv.recommender.spi.impl;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.keycloak.connections.jpa.JpaConnectionProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;

import kr.vaiv.recommender.dto.RecommenderDTO;
import kr.vaiv.recommender.spi.RecommenderService;

public class RecommenderServiceImpl implements RecommenderService {

  private final KeycloakSession session;

  public RecommenderServiceImpl(KeycloakSession session)  {
    this.session = session;

    if (getRealm() == null) {
      throw new IllegalStateException("The service cannot accept a session without a realm in its context.");
    }
  }

  private EntityManager getEntityManager() {
    return session.getProvider(JpaConnectionProvider.class).getEntityManager();
  }

  protected RealmModel getRealm() {
    return session.getContext().getRealm();
  }

  @Override
  public List<RecommenderDTO> findRecommenderList() {
    Query query = getEntityManager().createQuery(
      "SELECT u.id, " +
           "u.email," + 
           "( SELECT a.VALUE FROM Attributes a WHERE a.USER_ID = u.id AND a.NAME = 'nickname') AS nickname," + 
           "( " + 
              "SELECT c.cnt - 1 " + 
                "FROM (" + 
                  "SELECT a.USER_ID, a.VALUE, COUNT(a.VALUE) AS cnt FROM Attributes a WHERE a.NAME = 'nickname' GROUP BY a.value" + 
                ") c " + 
               "WHERE c.value = nickname" + 
           ") AS recommend_count " + 
      "FROM User u " + 
     "WHERE u.ENABLED = 1");

    
    // Query query = getEntityManager().createNamedQuery("findRecommenderList");
    List res = query.getResultList();

    System.out.println("================= adfasdf ======================");
    System.out.println(res);
    System.out.println("================= adfasdf ======================");

    List<RecommenderDTO> result = new LinkedList<>();
    
    // for (Object item : recommenders)  {
    //   System.out.println(item);
    //   result.add(new RecommenderDTO());
    // }

    return result;
  }

  @Override
  public void close() {
  }
  
}
