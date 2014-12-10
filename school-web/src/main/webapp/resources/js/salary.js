$(document).ready(function() {
	$(".teacher-name").click(function() {
		var id = $(this).attr("id");
		$.ajax({
			type : "GET",
			url : "profile/information",
			data : "id=" + id,
			headers : {
				Accept : "text/plain; charset=utf-8",
				"Content-Type" : "text/plain; charset=utf-8"
			},
			async : false,
			success : function(response) {
				$("#profile_modal_content").html(response);
				$("#profileModalButton").click();
			},
			error : function(e) {
				alert('Internal Server Error');
			}
		});
	});
	$(".teacher-name").css("cursor", "pointer");
	$(".teacher-name").css("text-decoration", "underline");
});

$(function() {
	$("#dateFrom").datepicker({
		changeMonth : true,
		numberOfMonths : 1,
		onClose : function(selectedDate) {
			$("#dateUntil").datepicker("option", "minDate", selectedDate);
		}
	});
	$("#dateUntil").datepicker({
		changeMonth : true,
		numberOfMonths : 1,
		onClose : function(selectedDate) {
			$("#dateFrom").datepicker("option", "maxDate", selectedDate);
		}
	});
});

$('#target').scroll(function() {
});


var inputs = document.getElementsByName("inputArray");
for (var int = 0; int < inputs.length; int++) {
inputs[int].addEventListener('change', function(e) {
	var num = parseInt(this.value, 10), min = 0, max = 5000;

	if (isNaN(num)) {
		this.value = "";
		return;
	}

	this.value = Math.max(num, min);
	this.value = Math.min(num, max);
})};