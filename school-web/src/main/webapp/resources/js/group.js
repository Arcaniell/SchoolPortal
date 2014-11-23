$('#select-all').click(function(event) {
	if (this.checked) {
		$(':checkbox').each(function() {
			this.checked = true;
		});
	} else {
		$(':checkbox').each(function() {
			this.checked = false;
		});
	}
});

$("input[name = 'checkboxName']").click(function() {
	var counter = 0;
	$(':checkbox').each(function() {
		if (this.checked == true) {
			counter++;
		}
	});
	if (counter > 1) {
		$(".remove_button").fadeOut();
	} else {
		$(".remove_button").fadeIn();
	}
});

$(".addition_course_checkbox").click(
		function() {
			var transfer={"checked" : 0 };
			if (this.checked == true) {
				transfer={"checked" : 1 };
				$(".th_symbol").fadeOut();
				$("select[name='symbol_value']").fadeOut();
				$(".th_year").attr('colspan', 2);
				$("select[name='year_value']").attr('colspan', 2);
				$(".addition_name_input").fadeIn();
			} else {
				transfer={"checked" : 0 };
				$(".th_symbol").fadeIn();
				$("select[name='symbol_value']").fadeIn();
				$(".th_year").attr('colspan', 1);
				$("select[name='year_value']").attr('colspan', 1);
				$(".addition_name_input").fadeOut();
			}
			$.post("getTeacherSelect", transfer, function(teachers) {
				var content="";
				for (var i = 0; i < teachers.length; i++) {
					content += "<option value=\"";
					content += teachers[i].id;
					content += "\">";
					content += teachers[i].fullName;
					content += "</option>\n";
				}
				$(".teachersSet").html(content);
			}, "json");
		});
