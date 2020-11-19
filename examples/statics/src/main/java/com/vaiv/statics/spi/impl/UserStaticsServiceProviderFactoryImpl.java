/*
 * Copyright 2016 Red Hat, Inc. and/or its affiliates
 * and other contributors as indicated by the @author tags.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.vaiv.statics.spi.impl;

import org.keycloak.Config.Scope;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;

import com.vaiv.statics.spi.UserStaticsService;
import com.vaiv.statics.spi.UserStaticsServiceProviderFactory;

public class UserStaticsServiceProviderFactoryImpl implements UserStaticsServiceProviderFactory {

    public UserStaticsService create(KeycloakSession session) {
        return new UserStaticsServiceImpl(session);
    }

    public void init(Scope config) {

    }

    public void postInit(KeycloakSessionFactory factory) {

    }

    public void close() {

    }

    //이건 뭐지??
    public String getId() {
        return "exampleServiceImpl";
    }

}
