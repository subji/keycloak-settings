package com.vaiv.statics.rest;

import javax.ws.rs.ForbiddenException;
import javax.ws.rs.NotAuthorizedException;

import org.keycloak.models.KeycloakSession;
import org.keycloak.services.managers.AuthenticationManager.AuthResult;

/**
 * 이건 어드민 컨트롤러다.
 * @author Daumsoft
 *
 */
public class UserStaticsRestController {

	private final KeycloakSession session;
    private final AuthResult auth;
	
	public UserStaticsRestController(KeycloakSession session, AuthResult auth) {
		this.session = session;
		this.auth = auth;
	}
	

//    @GET
//    @Path("")
//    @NoCache
//    @Produces(MediaType.APPLICATION_JSON)
//    public List<UserStaticsRepresentation> getCompanies() {
////        return session.getProvider(ExampleService.class).listCompanies();
//    }
//
//    @POST
//    @Path("")
//    @NoCache
//    @Consumes(MediaType.APPLICATION_JSON)
//    public Response createCompany(UserStaticsRepresentation rep) {
////        session.getProvider(ExampleService.class).addCompany(rep);
//        return Response.created(session.getContext().getUri().getAbsolutePathBuilder().path(rep.getId()).build()).build();
//    }
//
//    @GET
//    @NoCache
//    @Path("{id}")
//    @Produces(MediaType.APPLICATION_JSON)
//    public UserStaticsRepresentation getCompany(@PathParam("id") final String id) {
//        return session.getProvider(ExampleService.class).findCompany(id);
//    }

}