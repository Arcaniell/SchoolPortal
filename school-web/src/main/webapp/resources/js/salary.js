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

var input = document.getElementById('txtValue');
input.addEventListener('change', function(e) {
	var num = parseInt(this.value, 10), min = 0, max = 5000;

	if (isNaN(num)) {
		this.value = "";
		return;
	}

	this.value = Math.max(num, min);
	this.value = Math.min(num, max);
});