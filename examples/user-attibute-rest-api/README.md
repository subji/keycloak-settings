Example Realm REST Resource provider
====================================

모듈 추가

    $KEYCLOAK_HOME/bin/jboss-cli.sh --command="module add --name=사용 하고 싶은 파일 명 (com.vaiv.user.user-attribute-rest-api) --resources=target/파일명.jar (com.vaiv.user.user-attribute-rest-api.jar) --dependencies=org.keycloak.keycloak-core,org.keycloak.keycloak-server-spi,org.keycloak.keycloak-server-spi-private,javax.ws.rs.api"



META-INF 에 있는 org.keycloak.services.resource.RealmResourceProviderFactory 에 사용하고 싶은 Factory 파일 패키지명 + 파일명 쓰면 로딩이 된다.


UserAttributeResourceProviderFactory.java 에  ID가 http://localhost:8181/auth/realms/{realm}/{ID}  로 변환된다.
