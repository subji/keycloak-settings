1. keycloak 다운로드   ( https://www.keycloak.org/downloads )
2. bin\standalone.sh     ->  실행되는지 확인 
3. keycloak DB 설정 방법
    - jdbc 드라이버 다운 (.jar 파일로 다운)
    - .jar 위치를 modauls\system\layers\keycloak\org\DB명\main\ 넣기
    - 같은 위치에 modual.xml 추가
            <?xml version="1.0" ?>
            <module xmlns="urn:jboss:module:1.3" name="org.mariadb">

                <resources>
                    <resource-root path="mariadb-java-client-2.6.1.jar"/>
                </resources>

                <dependencies>
                    <module name="javax.api"/>
                    <module name="javax.transaction.api"/>
                </dependencies>
            </module>

    - {home}\standalone\configuration\standalone.xml 설정  
        ~ jdbc 드라이버 설정    ( <subsystem xmlns="urn:jboss:domain:datasources:5.0"> 로 검색하면 밑에 있음 )

        <driver name="mariadb" module="{modaul.xml에 설정한 폴더경로}">
            <xa-datasource-class>org.mariadb.jdbc.MariaDbDataSource</xa-datasource-class>
        </driver>


        ~ datasource 설정       ( <subsystem xmlns="urn:jboss:domain:datasources:5.0"> 로 검색하면 밑에 있음 )
        ~ mariadb 또는 mysql 의 경우 utf8mb4 로 되어있는데 이거를 모두 utf8 로 변경해주어야 한다.

        <datasource jndi-name="java:jboss/datasources/KeycloakDS" pool-name="KeycloakDS" enabled="true" use-java-context="true" statistics-enabled="${wildfly.datasources.statistics-enabled:${wildfly.statistics-enabled:false}}">
            <connection-url>{디비 주소}</connection-url>
            <driver>{jdbc 드라이버 설정에서 설정한 드라이버 명}</driver>
            <pool>
                <max-pool-size>20</max-pool-size>
            </pool>
            <security>
                <user-name>{DB 유저명}</user-name>
                <password>{DB 유저 비밀번호}</password>
            </security>
        </datasource>

        ~ 기본 데이터 소스 설정    ( <subsystem xmlns="urn:jboss:domain:ee:5.0"> 로 검색하면 됨.)
        
        <default-bindings context-service="java:jboss/ee/concurrency/context/default" datasource="java:jboss/datasources/{datasource에서 설정한 pool-name으로 세팅}" managed-executor-service="java:jboss/ee/concurrency/executor/default" managed-scheduled-executor-service="java:jboss/ee/concurrency/scheduler/default" managed-thread-factory="java:jboss/ee/concurrency/factory/default"/>

4. keycloak 재실행


여기까지가 기본적인 DB 연동

keycloak 어드민 설정
어드민 RESTApi 기본 주소 : http://localhost:8080/auth/admin/realms/{ realm명 }

1. localhost:8080/ 으로 접속하면 초기 마스터 유저 생성
2. http://localhost:8080/auth/admin/master/console/     에서 마스터 유저로 로그인
3. realm 생성     {서비스 명}-realm    
4. client 생성      {서비스 명}-{profile 명}
5. client 세팅 
    - Access Type : confidential로 변경
    - Service Accounts Enabled : on
    - credentials 탭에서 Secret , token 확인 

6. Roles 에서 role 추가
7. 6번에서 생성한 role에서 composite Roles 를 on   밑에 생긴 client Roles 에서 realm-management 선택 후 view-users 추가
8. Postman 에서 Oauth2.0 토큰 받아지는지 확인  (  http://localhost:8080/auth/realms/{ realm명 }/protocol/openid-connect/token  ) 
9. clients 탭에서 client 선택하고 Service Account Roles 에 6번에서 만든 role 추가
10. Postman으로 API 확인 ( http://localhost:8080/auth/admin/realms/{ realm 명 }/users  )     =>   등록된 유저가 없으면 [] 이게 나옴
11. 
view-users : 이건 유저에 대한 정보 조회
manage-users : 이건 유저에 대한 모든 동작?

## 한국어 설정
--- 
themes/bases/{각폴더}/messages/properties 로 관리(ja 거 복사)

# 회원가입에서 first name, last name 유효성 검사 제외하는 방법
[참고](https://github.com/zonaut/keycloak-extensions/tree/master/spi-registration-profile)

# 각 Identity Provider 및 SPI 모듈은 jar 파일을 이름을 맞추어 deployments 디렉토리 밑에 복사
















