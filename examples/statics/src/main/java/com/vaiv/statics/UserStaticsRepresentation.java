package com.vaiv.statics;

import com.vaiv.statics.jpa.UserStatics;

public class UserStaticsRepresentation {

    private String id;	//이건 뭐지??
    private String name;	//이건 뭐지??

    public UserStaticsRepresentation() {
    }

    public UserStaticsRepresentation(UserStatics userStatics) {
        id = userStatics.getId();
        name = userStatics.getName();
    }
    
    public String getId() {
		return id;
	}
    
    public String getName() {
		return name;
	}

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
}
