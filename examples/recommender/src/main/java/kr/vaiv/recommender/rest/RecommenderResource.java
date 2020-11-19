package kr.vaiv.recommender.rest;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.jboss.resteasy.annotations.cache.NoCache;
import org.keycloak.connections.jpa.JpaConnectionProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;

import kr.vaiv.recommender.dto.RecommenderDTO;

public class RecommenderResource {

  private final KeycloakSession session;

  public RecommenderResource(KeycloakSession session) {
    this.session = session;
  }

  private EntityManager getEntityManager() {
    return session.getProvider(JpaConnectionProvider.class).getEntityManager();
  }

  protected RealmModel getRealm() {
    return session.getContext().getRealm();
  }

  @GET
  @Path("")
  @NoCache
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.APPLICATION_JSON)
  @SuppressWarnings({ "unchecked" })
  public Map<String, Object> requestRecommendList(@QueryParam("size") Integer size, @QueryParam("page") Integer page)  {
    String limitStr = "";
    String offsetStr = "";

    if (size != null) {
      limitStr += ("LIMIT " + size); 
    }

    Integer currentPage = page;

    if (page != null) {
      page = page > 0 ? page - 1 : page;
      size = size == null ? 10 : size;

      offsetStr += ("OFFSET " + page * size);
    }

    List<Object[]> query = getEntityManager().createNativeQuery(
      "SELECT u.id, " +
           "u.email," + 
           "( SELECT a.VALUE FROM USER_ATTRIBUTE a WHERE a.USER_ID = u.id AND a.NAME = 'nickname') AS nickname," + 
           "IFNULL(( " + 
              "SELECT c.cnt " + 
                "FROM (" + 
                  "SELECT a.USER_ID, a.VALUE, COUNT(a.VALUE) AS cnt FROM USER_ATTRIBUTE a WHERE a.NAME = 'recommender' GROUP BY a.value" + 
                ") c " + 
               "WHERE c.value = nickname" + 
           "), 0) AS recommend_count " + 
       "FROM USER_ENTITY u " + 
      "WHERE u.ENABLED = 1 " + 
      "ORDER BY recommend_count DESC " + 
      limitStr + " " + offsetStr).getResultList();

    Object countQuery = getEntityManager()
    .createNativeQuery("SELECT COUNT(u.id) FROM USER_ENTITY u WHERE u.ENABLED = 1")
    .getSingleResult();

    List<RecommenderDTO> result = new LinkedList<>();

    for (Object[] r : query)  {
      RecommenderDTO recommenderDTO = new RecommenderDTO();
      recommenderDTO.setUserId((String) r[1]);
      recommenderDTO.setEmail((String) r[1]);
      recommenderDTO.setNickname((String) r[2]);
      recommenderDTO.setRecommendCount((BigInteger) r[3]);

      result.add(recommenderDTO);
    }

    Map<String, Object> res = new HashMap<>();
    res.put("item", result);
    res.put("size", size);
    res.put("page", currentPage);
    res.put("totalCnt", countQuery);
    

    // return session.getProvider(RecommenderService.class).findRecommenderList();
    return res;
  }
  
}
