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
	});