$(document).ready(function(){
	  $(".hidehomeinfo").click(function(){
	    $(".home_info table").hide(1000);
	    $(".hidehomeinfo").hide();
	    $(".showhomeinfo").show();
	  });
	  $(".showhomeinfo").click(function(){
		    $(".home_info table").show(1000);
		    $(".showhomeinfo").hide();
		    $(".hidehomeinfo").show();
		  });
	  $("#signup_button").click(function(){
		  var firstname = $("#firstname").val();
		  var lastname = $("#lastname").val();
		  var email = $("#email").val();
		  var password = $("#createapassword").val();
		  var sex = $( "input:radio[name=sex]:checked" ).val();
		  var role = $( "input:radio[name=role]:checked" ).val();
		  $.ajax({
				type : "POST",
				url : "registration/check",
				data : "firstname=" + firstname + "&lastname=" + lastname + 
				"&email=" + email + "&password=" + password + "&sex=" + sex + 
				"&role=" + role,
		        success : function(responce) {
		        		$("#signUpSuccesButton").click();
		           },
             error: function() {
                 alert("eee");
             }
          });
	
		  
		  });
	  $("#forgotAPasswordButton").click(function(){
		  var email = $("#forgot_email").val();
		  alert(email);
		  $.ajax({
				type : "GET",
				url : "forgotemail/check",
				data : "email=" + email,
				dataType: 'json', 
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        async:false,
		        success : function(response) {
		        	if (response == 0){
		        		alert('send');
		        	}
		        	else{
		        		alert('no');
		        	}

		           },  
		           error : function(e) {  
		            alert('Internal server error');   
		           }  
          });
	
		  
		  });
	});