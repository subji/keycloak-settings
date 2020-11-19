package kr.vaiv.recommender.spi;

import java.util.List;

import org.keycloak.provider.Provider;

import kr.vaiv.recommender.dto.RecommenderDTO;

public interface RecommenderService extends Provider {
  
  List<RecommenderDTO> findRecommenderList();

}
