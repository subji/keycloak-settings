package com.vaiv.statics.spi.impl;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.EntityManager;

import org.keycloak.connections.jpa.JpaConnectionProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.utils.KeycloakModelUtils;

import com.vaiv.statics.UserStaticsRepresentation;
import com.vaiv.statics.jpa.UserStatics;
import com.vaiv.statics.spi.UserStaticsService;

public class UserStaticsServiceImpl implements UserStaticsService {

    private final KeycloakSession session;

    public UserStaticsServiceImpl(KeycloakSession session) {
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
    
//    @Override
//    public List<UserStaticsRepresentation> listCompanies() {
//    	List<UserStatics> companyEntities = getEntityManager().createNamedQuery("findByRealm", UserStatics.class)
//                .setParameter("realmId", getRealm().getId())
//                .getResultList();
//
//        List<UserStaticsRepresentation> result = new LinkedList<>();
//        for (UserStatics entity : companyEntities) {
//            result.add(new UserStaticsRepresentation(entity));
//        }
//        return result;
//    }
//    
//    @Override
//    public UserStaticsRepresentation findCompany(String id) {
//    	UserStatics entity = getEntityManager().find(UserStatics.class, id);
//        return entity==null ? null : new UserStaticsRepresentation(entity);
//    }
//    
//    @Override
//    public UserStaticsRepresentation addCompany(UserStaticsRepresentation company) {
//        UserStatics entity = new UserStatics();
//        String id = company.getId()==null ?  KeycloakModelUtils.generateId() : company.getId();
//        entity.setId(id);
//        entity.setName(company.getName());
//        entity.setRealmId(getRealm().getId());
//        getEntityManager().persist(entity);
//
//        company.setId(id);
//        return company;
//    }

    public void close() {
        // Nothing to do.
    }

}
