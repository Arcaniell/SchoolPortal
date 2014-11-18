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
	  
	  $(".question").click(function(){
		  $("#question").val($("."+$(this).attr('id')).attr("value"));
		  $("#questionNumber").val($(this).attr('id'));
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