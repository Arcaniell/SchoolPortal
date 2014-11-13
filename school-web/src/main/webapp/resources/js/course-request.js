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
});
$(".requests").click(function() {
	$("#exportedVal").val($(this).data('value'));
	console.log(this);
	console.log(event.target);
});