$(document).ready(function() {
	$(".admin_buttons p").click(function() {
		var current_profile_page = $("#admin_page_container").val();
		$("." + current_profile_page).hide();
		current_profile_page = $(this).attr("id");
		$("." + current_profile_page).show();
		$("#admin_page_container").val(current_profile_page);
	});


});