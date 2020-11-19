package com.vaiv.nice;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.keycloak.models.KeycloakSession;
import org.keycloak.services.resource.RealmResourceProvider;

public class NiceIdRestProvider implements RealmResourceProvider {
	@Context
    ServletContext servletContext;
	 
    private KeycloakSession keyClockSession;
    private NiceIdService niceIdService = new NiceIdService();


    public NiceIdRestProvider(KeycloakSession session) {
		this.keyClockSession = session;
	}

	@Override
    public Object getResource() {
        return this;
    }

    @GET
    @Path("verify-ready")
    @Produces("text/plain; charset=utf-8")
//    public Response verify(HttpServletRequest request, HttpSession session) {
	public Response verify(@Context HttpServletRequest request) {
    	
        return Response.ok(niceIdService.setNiceIdtoSession(request.getSession(), request, keyClockSession), MediaType.APPLICATION_JSON).build();
    }
    

    @GET
    @Path("/certification/success")
    @Produces({MediaType.TEXT_HTML})
	public String  success(@Context HttpServletRequest request) {
        return niceIdService.setNiceIdSuccessToSession(request.getSession(), request);
    	
    }
    

    @GET
    @Path("/certification/failed")
    @Produces({MediaType.TEXT_HTML})
	public String  failed(@Context HttpServletRequest request) {
    	StringBuilder sb = new StringBuilder();
    	
    	sb.append("<!DOCTYPE html>");
    	sb.append("<html>");
    	sb.append("<head>");
    	sb.append("</head>");
    	sb.append("<body>");
    	sb.append("	<script>");
    	sb.append("		alert('본인인증에 실패했습니다.')");
    	sb.append("    window.close();");
    	sb.append("  </script>");
    	sb.append("</body>");

    	sb.append("</html>");
    	return sb.toString();
    	
    }
    
    

    @Override
    public void close() {
    }

}
