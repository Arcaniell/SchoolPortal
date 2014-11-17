$(document).ready(function(){
	
	$.validator.addMethod("regexName",
	           function(value, element) {
	                   return /^[a-zA-Z]+$/.test(value);
	           },
	   "Only letters are allowed!"
	   );
	
	$.validator.addMethod("uniqueEmail", function(value, element) {
	    var result=false;
	    $.ajax({
	        type: "GET",
	        url: "email/check",
	        data:"email="+value,
	        dataType: 'json', 
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        async:false,
	        success : function(response) {
	        	if (response == 0){
	        		result = false;
	        	}
	        	else{
	        		result = true;
	        	}

	           },  
	           error : function(e) {  
	            alert('Internal server error');   
	           }  
	    });
	   return result;
	}, "Email is Already Taken! Please, enter another email!");
	
	 $('#signup_from').validate(
	 {
		rules: {
		  firstName:{
				required:true,
				minlength: 2,
				maxlength: 15, 
				regexName:true
		  },
			lastName:{
				required:true,
				minlength: 2,
				maxlength: 15, 
				regexName:true 
		  },
		    email: {
		      required: true,
		      email: true,
		      uniqueEmail: true
		    },
		    password: {
		    	required: true,
		    	minlength: 4,
		    	maxlength: 15
		    },

		  },
	  messages: {
		  firstname: {
              required: "Please enter first name!",
          },
          lastname: {
              required: "Please enter last name!",
          },
          email: {
              required: "Please enter email!",
              email: "This is not a valid email!",
          },
          password: {
	  	    	required: "Please enter password!",
	  	    	minlength: "Too weak password!",
	  	    	maxlength: "Too long password!",
          },

      },success: function(element) {
    	    element.addClass('valid');
    	  }
	 });
	 
	}); 