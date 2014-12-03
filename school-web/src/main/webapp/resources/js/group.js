var additionYearSelect = [];
var yearSelect = [];

$(function() {
	// getYears("getAdditionYearsSelect");
	// getYears("getYearsSelect");
	checkboxCounter();
	var year = $("select[name='year_value']").val();
	renewCourseSelect(year);
	$("select[name='year_value']").change(function() {
		var year = $("select[name='year_value']").val();
		renewCourseSelect(year);
	});
});

var renewCourseSelect = function(year) {
	$.ajax({
		headers : {
			'Accept' : 'application/json',
			'Content-Type' : 'application/json'
		},
		'type' : 'POST',
		'url' : "getCoursesSelect",
		'data' : JSON.stringify(year),
		'dataType' : 'json',
		'success' : function(data) {
			var container = "";
			for (i in data) {
				container += "<option " + "value=\"" + data[i].id + "\">"
						+ data[i].name + "</option>\n";
			}
			$("select[name='course_id']").html(container);
		}
	});
};

var getYears = function(controllerName) {
	$.ajax({
		headers : {
			'Accept' : 'application/json',
			'Content-Type' : 'application/json'
		},
		'type' : 'POST',
		'url' : controllerName,
		'success' : function(data) {
			var container = "";
			for (i in data) {
				container += "<option>" + data[i] + "</option>\n";
			}
			console.log(container);
			$("select[name='year_value']").html(container);
		}
	});
}
// $("select[name='year_value']").change(renewCourseSelect(this.value));
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
	checkboxCounter();
});

var checkboxCounter = function() {
	var counter = 0;
	$(':checkbox').each(function() {
		if (this.checked == true) {
			counter++;
		}
	});
	if (counter > 1 || counter == 0) {
		$(".remove_button").fadeOut();
	} else {
		$(".remove_button").fadeIn();
	}
	if (counter < 1) {
		$(".real_dell_btn").fadeOut();
	} else {
		$(".real_dell_btn").fadeIn();
	}

};

$(".remove_button").click(function() {
	var groupId = "";
	$("input[name = 'checkboxName']").each(function() {
		if (this.checked == true) {
			groupId = this.value;
		}
	});
	document.location.href = "group-edit" + "?groupId=" + groupId;
});
$(".addition_course_checkbox").click(function() {
	var transfer = {
		"checked" : 0
	};
	if (this.checked == true) {
		transfer = {
			"checked" : 1
		};
		$(".th_symbol").fadeOut();
		$("select[name='symbol_value']").fadeOut();
		$(".th_year").attr('colspan', 2);
		$("select[name='year_value']").attr('colspan', 2);
		$(".addition_name_input").fadeIn();
		getYears("getAdditionYearsSelect");
	} else {
		transfer = {
			"checked" : 0
		};
		$(".th_symbol").fadeIn();
		$("select[name='symbol_value']").fadeIn();
		$(".th_year").attr('colspan', 1);
		$("select[name='year_value']").attr('colspan', 1);
		$(".addition_name_input").fadeOut();
		getYears("getYearsSelect");
	}
	$.post("getTeacherSelect", transfer, function(teachers) {
		var content = "";
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
