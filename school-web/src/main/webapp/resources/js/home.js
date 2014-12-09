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
	  
	  $(".rquestion").click(function(){
		  $("#questionNumber").val($(this).attr('id'));
		  });
	  $(".for_registration_group_select").click(function(){
		  $.ajax({
				type : "GET",
				url : "registration/groups",
				headers: {
			        Accept : "text/plain; charset=utf-8",
			        "Content-Type": "text/plain; charset=utf-8"
			    },
				async : false,
				success : function(response) {
					$("#registration_group_select").html(response);
				},
				error : function(e) {
					alert('Internal Server Error');
				}
			});
	  });
	  $(".fquestion").click(function(){
		  $("#forgotQuestionNumber").val($(this).attr('id'));
		  });
	  $("#hide_groups_action_true").click(function(){
		  $("#hide_groups_action").hide();
		  $("#groupNumber").val(0);
		  });
	  $("#hide_groups_action_false1").click(function(){
		  $("#hide_groups_action").show();
		  });
	  $("#hide_groups_action_false2").click(function(){
		  $("#hide_groups_action").show();
		  });
	  
});
function setGroupNumber(id){
	  $("#groupNumber").val(id);
}