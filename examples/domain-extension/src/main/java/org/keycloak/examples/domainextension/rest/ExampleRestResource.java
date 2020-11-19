package org.keycloak.examples.domainextension.rest;

import javax.ws.rs.Path;

import org.keycloak.models.KeycloakSession;

public class ExampleRestResource {

	private final KeycloakSession session;
	
	public ExampleRestResource(KeycloakSession session) {
		this.session = session;
	}
	
    @Path("companies")
    public CompanyResource getCompanyResource() {
        return new CompanyResource(session);
    }

    // Same like "companies" endpoint, but REST endpoint is authenticated with Bearer token and user must be in realm role "admin"
    // Just for illustration purposes
    @Path("companies-auth")
    public CompanyResource getCompanyResourceAuthenticated() {
        return new CompanyResource(session);
    }

}
