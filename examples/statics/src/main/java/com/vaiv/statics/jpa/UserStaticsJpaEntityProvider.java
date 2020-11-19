package com.vaiv.statics.jpa;

import java.util.Collections;
import java.util.List;

import org.keycloak.connections.jpa.entityprovider.JpaEntityProvider;


public class UserStaticsJpaEntityProvider implements JpaEntityProvider {

    public List<Class<?>> getEntities() {
        return Collections.<Class<?>>singletonList(UserStatics.class);
    }

    public String getChangelogLocation() {
    	return "META-INF/example-changelog.xml";
    }
    
    public void close() {
    }

    public String getFactoryId() {
        return UserStaticsJpaEntityProviderFactory.ID;
    }

}
