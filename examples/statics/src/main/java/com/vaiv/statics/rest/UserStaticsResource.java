package com.vaiv.statics.rest;

import org.keycloak.models.KeycloakSession;

public class UserStaticsResource {

	private final KeycloakSession session;
	
	public UserStaticsResource(KeycloakSession session) {
		this.session = session;
	}

//    @GET
//    @Path("")
//    @NoCache
//    @Produces(MediaType.APPLICATION_JSON)
//    public List<UserStaticsRepresentation> getCompanies() {
//        return session.getProvider(UserStaticsService.class).listCompanies();
//    }
//
//    @POST
//    @Path("")
//    @NoCache
//    @Consumes(MediaType.APPLICATION_JSON)
//    public Response createCompany(UserStaticsRepresentation rep) {
//        session.getProvider(UserStaticsService.class).addCompany(rep);
//        return Response.created(session.getContext().getUri().getAbsolutePathBuilder().path(rep.getId()).build()).build();
//    }
//
//    @GET
//    @NoCache
//    @Path("{id}")
//    @Produces(MediaType.APPLICATION_JSON)
//    public CompanyRepresentation getCompany(@PathParam("id") final String id) {
//        return session.getProvider(ExampleService.class).findCompany(id);
//    }

}