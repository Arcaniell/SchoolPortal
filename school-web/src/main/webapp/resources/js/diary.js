//$(function() {
//	$('[data-toggle="tooltip"]').tooltip()
//})
//
//$(".subjectToolTip").popover();
//

$(function() {
	var date = $("#weekDate").val();
	var userId = $("#kidSelect").val();
	var weekChange = null;
	var json = {
		"date" : date,
		"userId" : userId,
		"weekChange" : weekChange,
	}
	$
			.ajax({
				url : 'diary-marks',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(diaryMarks) {
					var dayNames = new Array('Sunday', 'Monday', 'Tuesday',
							'Wednesday', 'Thursday', 'Friday', 'Saturday');
					$("#weekDate").val(diaryMarks[0].date);
					var count = 1;
					for ( var i in diaryMarks) {

						var date = new Date(diaryMarks[i].date);

						date = (dayNames[date.getDay()] + " " + date.getDate()
								+ "." + (date.getMonth() + 1) + "." + (date
								.getYear() - 100));
						var dayContent = "<td id=\"noBorder\"><div>"
								+ "<table class=\"table table-striped\">"
								+ "<thead class=\"divHeader\"><tr>"
								+ "<td>" + date + "</td>"
								+ "</tr></thead></table></div>"
								+ "<div class=\"table-responsive\">"
								+ "<table class=\"table\"><tbody>"
								+ "<tr class=\"info\">"
								+ "<th class=\"thSizeN\">№</th>"
								+ "<th class=\"thSizeSubject\">lesson</th>"
								+ "<th>home task</th>"
								+ "<th class=\"thSizeMark\">mark</th>"
								+ "</tr>";
						var markList = diaryMarks[i].markList;
						for ( var index in markList) {

							dayContent += "<tr> <td>"
									+ markList[index].lessonId + "</td> <td>"
									+ markList[index].courseName + "</td> <td>"
							if (markList[index].homeTask == null) {
								dayContent += " ";
							} else {
								dayContent += markList[index].homeTask;

							}
							dayContent += "</td> <td class=\"tdCenter";

							if (markList[index].markCoefficient == 3) {
								dayContent += " eventTest";
							} else if (markList[index].markCoefficient == 5) {
								dayContent += " eventExam";
							}

							dayContent += "\">";

							if (markList[index].mark == 0) {
								dayContent += " ";
							} else {
								dayContent += markList[index].mark;
							}
							dayContent += "</td></tr>";
						}
						dayContent += "</tbody></table></div></td>"
						var id = "#day" + count;
						$(id).html(dayContent);
						count++;
					}
				}
			})
});

$(document).on(
		"click",
		".changeWeek",
		function() {
			console.log("yo");

			var date = $("#weekDate").val();
			var userId = $("#kidSelect").val();
			var weekChange = $(this).val();
			var json = {
				"date" : date,
				"userId" : userId,
				"weekChange" : weekChange,
			}
			$.ajax({
				url : 'diary-marks-change-week',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(diaryMarks) {
					var dayNames = new Array('Sunday', 'Monday', 'Tuesday',
							'Wednesday', 'Thursday', 'Friday', 'Saturday');
					$("#weekDate").val(diaryMarks[0].date);
					var count = 1;
					for ( var i in diaryMarks) {

						var date = new Date(diaryMarks[i].date);

						date = (dayNames[date.getDay()] + " " + date.getDate()
								+ "." + (date.getMonth() + 1) + "." + (date
								.getYear() - 100));
						var dayContent = "<td id=\"noBorder\"><div>"
								+ "<table class=\"table table-striped\">"
								+ "<thead class=\"divHeader\"> <tr>"
								+ "<td>" + date + "</td>"
								+ "</tr></thead></table></div>"
								+ "<div class=\"table-responsive\">"
								+ "<table class=\"table\"> <tbody>"
								+ "<tr class=\"info\">"
								+ "<th class=\"thSizeN\">№</th>"
								+ "<th class=\"thSizeSubject\">lesson</th>"
								+ "<th>home task</th>"
								+ "<th class=\"thSizeMark\">mark</th>"
								+ "</tr>";
						var markList = diaryMarks[i].markList;
						for ( var index in markList) {

							dayContent += "<tr> <td>"
									+ markList[index].lessonId + "</td> <td>"
									+ markList[index].courseName + "</td> <td>"
							if (markList[index].homeTask == null) {
								dayContent += " ";
							} else {
								dayContent += markList[index].homeTask;

							}
							dayContent += "</td> <td class=\"tdCenter";

							if (markList[index].markCoefficient == 3) {
								dayContent += " eventTest";
							} else if (markList[index].markCoefficient == 5) {
								dayContent += " eventExam";
							}

							dayContent += "\">";

							if (markList[index].mark == 0) {
								dayContent += " ";
							} else {
								dayContent += markList[index].mark;
							}
							dayContent += "</td></tr>";
						}
						dayContent += "</tbody></table></div></td>"
						var id = "#day" + count;
						$(id).html(dayContent);
						count++;
					}
				}
			})
		});

$("#kidSelect").change(
		function() {

			var date = $("#weekDate").val();
			var userId = $(this).val();
			var weekChange = null;
			var json = {
				"date" : date,
				"userId" : userId,
				"weekChange" : weekChange,
			}
			$.ajax({
				url : 'diary-marks',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(diaryMarks) {
					var dayNames = new Array('Sunday', 'Monday', 'Tuesday',
							'Wednesday', 'Thursday', 'Friday', 'Saturday');
					$("#weekDate").val(diaryMarks[0].date);
					var count = 1;
					for ( var i in diaryMarks) {

						var date = new Date(diaryMarks[i].date);

						date = (dayNames[date.getDay()] + " " + date.getDate()
								+ "." + (date.getMonth() + 1) + "." + (date
								.getYear() - 100));
						var dayContent = "<td id=\"noBorder\"><div>"
								+ "<table class=\"table table-striped\">"
								+ "<thead class=\"divHeader\"> <tr>"
								+ "<td>" + date + "</td>"
								+ "</tr></thead></table></div>"
								+ "<div class=\"table-responsive\">"
								+ "<table class=\"table\"> <tbody>"
								+ "<tr class=\"info\">"
								+ "<th class=\"thSizeN\">№</th>"
								+ "<th class=\"thSizeSubject\">lesson</th>"
								+ "<th>home task</th>"
								+ "<th class=\"thSizeMark\">mark</th>"
								+ "</tr>";
						var markList = diaryMarks[i].markList;
						for ( var index in markList) {

							dayContent += "<tr> <td>"
									+ markList[index].lessonId + "</td> <td>"
									+ markList[index].courseName + "</td> <td>"
							if (markList[index].homeTask == null) {
								dayContent += " ";
							} else {
								dayContent += markList[index].homeTask;

							}
							dayContent += "</td> <td class=\"tdCenter";

							if (markList[index].markCoefficient == 3) {
								dayContent += " eventTest";
							} else if (markList[index].markCoefficient == 5) {
								dayContent += " eventExam";
							}

							dayContent += "\">";

							if (markList[index].mark == 0) {
								dayContent += " ";
							} else {
								dayContent += markList[index].mark;
							}
							dayContent += "</td></tr>";
						}
						dayContent += "</tbody></table></div></td>"
						var id = "#day" + count;
						$(id).html(dayContent);
						count++;
					}
				}
			})
		});