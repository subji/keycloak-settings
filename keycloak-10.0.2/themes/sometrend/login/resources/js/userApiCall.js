const USER_API = {}


USER_API.findByUserAttributeName = function(attributeName, attributeValue){
	return $.ajax({
        url: ("/auth/realms/"+ realmName +"/user/find-by-user-attribute-name/" + attributeName +"/" + attributeValue),
        type: "GET"
        
    })
}


USER_API.findByEmail = function(email){
	return $.ajax({
        url: ("/auth/realms/"+ realmName +"/user/find-by-email/" + email),
        type: "GET"
    })
}