$(document).ready(function(){
	
	
	  $(".profile_modal").click(function(){
		  var id = $(this).attr("id");
		  $.ajax({
				type : "GET",
				url : "profile/information",
				data : "id=" + id,
				headers: {
			        Accept : "text/plain; charset=utf-8",
			        "Content-Type": "text/plain; charset=utf-8"
			    },
				async : false,
				success : function(response) {
					$("#profile_modal_content").html(response);

				},
				error : function(e) {
					alert('Internal Server Error');
				}
			});
		  
		  $("#profileModalButton").click();
		  
	  });
	  
	  $(".chield_and_parent_container td").css("cursor", "pointer");


});