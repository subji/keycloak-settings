const MASKING = {
	email : function(email){
		 return email.replace(/^(.{2})(.*)(@.*)$/,function(_, a, b, c) {return a + b.replace(/./g, '*') + c});
	}
}