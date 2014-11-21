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
	  
	});