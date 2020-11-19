package com.vaiv.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.keycloak.models.KeycloakSession;
import org.keycloak.models.utils.ModelToRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.services.resource.RealmResourceProvider;

public class UserAttributeResourceProvider implements RealmResourceProvider {

    private KeycloakSession session;

    public UserAttributeResourceProvider(KeycloakSession session) {
        this.session = session;
    }

    @Override
    public Object getResource() {
        return this;
    }

    @GET
    @Path("find-by-user-attribute-name/{userAttributeName}/{userAttributeValue}")
    @Produces("text/plain; charset=utf-8")
    public Response findByUserAttributeName(@PathParam("userAttributeName") String userAttributeName, @PathParam("userAttributeValue") String userAttributeValue) {
        List<UserRepresentation> result =  session
    	        .users()
    	        .searchForUserByUserAttribute(userAttributeName, userAttributeValue, session.getContext().getRealm())		//유저 속성에서 찾기
                .stream()  
                .map(userModel -> ModelToRepresentation.toRepresentation(session, session.getContext().getRealm(), userModel))
                .collect(Collectors.toList());
        
        return Response.ok(result, MediaType.APPLICATION_JSON).build();
    }
    
    
    /**
     * 유저 이메일로 유저 찾기
     * 이메일인데 실제로는 username이다
     * @param userAttributeName
     * @param userAttributeValue
     * @return
     */
    @GET
    @Path("find-by-email/{email}")
    @Produces("text/plain; charset=utf-8")
    public Response findByEmail(@PathParam("email") String email) {
        Map<String, String > params = new HashMap<>();
        params.put("username", email);
        List<UserRepresentation> result =  session
    	        .users()
    	        .searchForUser(params, session.getContext().getRealm())
                .stream()  
                .map(userModel -> ModelToRepresentation.toRepresentation(session, session.getContext().getRealm(), userModel))
                .collect(Collectors.toList());
        
        return Response.ok(result, MediaType.APPLICATION_JSON).build();
    }

    @Override
    public void close() {
    }

}
