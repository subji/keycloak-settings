
package com.vaiv.statics.spi;

import org.keycloak.provider.Provider;
import org.keycloak.provider.ProviderFactory;
import org.keycloak.provider.Spi;

public class UserStaticsSpi implements Spi {

    public boolean isInternal() {
        return false;
    }

    public String getName() {
        return "user-statics";
    }

    public Class<? extends Provider> getProviderClass() {
        return UserStaticsService.class;
    }

    @SuppressWarnings("rawtypes")
    public Class<? extends ProviderFactory> getProviderFactoryClass() {
        return UserStaticsServiceProviderFactory.class;
    }

}
