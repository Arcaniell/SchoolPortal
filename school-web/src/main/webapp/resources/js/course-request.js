function hideRemoveButton() {
	var counter = 0;
	$(':checkbox').each(function() {
		if (this.checked == true) {
			counter++;
		}
	});
	if (counter == 0) {
		$(".remove_button").fadeOut();
	} else {
		$(".remove_button").fadeIn();
	}
}

$(':checkbox').click(function(){
	hideRemoveButton();
});
/*$(document).ready(function() {
	var currentName = 0;
	$.post("getUserNameController",function(data){
		$(".profile-info").text(data.name);
	}, "json");
	if (currentName != 0) {
		$(".profile-info").text(currentName);
	}
});*/
$('#select-all').click(function(event) {
	if (this.checked) {
		// Iterate each checkbox
		$(':checkbox').each(function() {
			this.checked = true;
		});
	} else {
		// Iterate each checkbox
		$(':checkbox').each(function() {
			this.checked = false;
		});
	}
	hideRemoveButton();
});
$(".requests").click(function() {
	$("#exportedVal").val($(this).data('value'));
	console.log(this);
	console.log(event.target);
});
$(".name_value").change(function(){
	alert(this.value);
});