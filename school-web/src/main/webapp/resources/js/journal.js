$(function() {
	$.ajax({
		url : 'journal-subject',
		type : 'post',
		data : $("#subjectSelect").val(),

		success : function(groupNumbers) {
			var content = " ";
			for (number in groupNumbers) {
				content += "<option value=\"";
				content += groupNumbers[number];
				content += "\">";
				content += groupNumbers[number];
				content += "</option>\n";
			}
			$("#groupNumberSelect").html(content);
			$.ajax({
				url : 'journal-letter',
				type : 'post',
				data : $("#groupNumberSelect").val(),

				success : function(groupLetters) {
					var content = " ";
					for (letter in groupLetters) {
						content += "<option value=\"";
						content += groupLetters[letter];
						content += "\">";
						content += groupLetters[letter];
						content += "</option>\n";
					}
					$("#groupLetterSelect").html(content);
				}
			});
		}
	});
});

$("#groupNumberSelect").change(function() {
	$.ajax({
		url : 'journal-letter',
		type : 'post',
		data : $("#groupNumberSelect").val(),

		success : function(groupLetters) {
			var content = " ";
			for (letter in groupLetters) {
				content += "<option value=\"";
				content += groupLetters[letter];
				content += "\">";
				content += groupLetters[letter];
				content += "</option>\n";
			}
			$("#groupLetterSelect").html(content);
		}
	});
});

$("#subjectSelect").change(function() {
	$.ajax({
		url : 'journal-subject',
		type : 'post',
		data : $("#subjectSelect").val(),

		success : function(groupNumbers) {
			var content = " ";
			for (number in groupNumbers) {
				content += "<option value=\"";
				content += groupNumbers[number];
				content += "\">";
				content += groupNumbers[number];
				content += "</option>\n";
			}
			$("#groupNumberSelect").html(content);
			$.ajax({
				url : 'journal-letter',
				type : 'post',
				data : $("#groupNumberSelect").val(),

				success : function(groupLetters) {
					var content = " ";
					for (letter in groupLetters) {
						content += "<option value=\"";
						content += groupLetters[letter];
						content += "\">";
						content += groupLetters[letter];
						content += "</option>\n";
					}
					$("#groupLetterSelect").html(content);
				}
			});
		}
	});
});

$("#submitSearch")
		.click(
				function() {
					var subject = $("#subjectSelect").val();
					var groupNumber = $("#groupNumberSelect").val();
					var groupLetter = $("#groupLetterSelect").val();
					var quarter = $("#quarterSelect").val();
					var json = {
						"subject" : subject,
						"groupNumber" : groupNumber,
						"groupLetter" : groupLetter,
						"quarter" : quarter
					}
					$
							.ajax({
								url : 'journal-group-marks',
								type : 'POST',
								data : JSON.stringify(json),
								dataType : 'json',
								contentType : 'application/json',
								mimeType : 'application/json',
								success : function(groupMarks) {
									var contentStd = "";
									contentStd += "<tr class=\"info "
											+ "trHeaderRow\">"
											+ "<th> Students </th></tr>";
									for ( var student in groupMarks) {
										contentStd += "<tr class=\"trSize\"><th>";
										var studentWithMark = groupMarks[student];
										contentStd += studentWithMark.studentName
												+ "</th></tr>";
									}
									$("#studentsNamesOfGroup").html(contentStd);
									var dates = groupMarks[0].markList;
									var contentMarks = "";
									contentMarks += "<tr class=\"info "
											+ "trHeaderRow\">";
									for ( var date in dates) {
										contentMarks += "<th data-toggle=\"modal\""
												+ "data-target=\""
												+ ".journal-add-mark-modal\""
												+ "class=\"date "
												+ dates[date].scheduleId
												+ "\" data-value=\""
												+ dates[date].scheduleId
												+ "\">"
										var dateOfMark = new Date(
												dates[date].date);
										var uiDate = (dateOfMark.getDate()
												+ "."
												+ (dateOfMark.getMonth() + 1)
												+ "." + (dateOfMark.getYear() - 100));
										contentMarks += uiDate + "</th>";
									}
									contentMarks += "</tr>";
									for ( var student in groupMarks) {
										contentMarks += "<tr class=\"trSize\">";
										var studentId = groupMarks[student].studentId;
										var marks = groupMarks[student].markList;
										for ( var index in marks) {
											var scheduleId = marks[index].scheduleId;
											if (marks[index].mark == 0) {
												contentMarks += "<td name=\""
														+ "mark"
														+ scheduleId
														+ "\" "
														+ "id=\""
														+ studentId
														+ "j"
														+ scheduleId
														+ "\" data-value=\""
														+ studentId
														+ "j"
														+ scheduleId
														+ "\"class=\"tdCenter addMark\" >"
														+ "<input id=\"dateAndStudent\""
														+ " type=\"hidden\" value=\" \" />"
														+ "<ul class=\"nav nav-pills"
														+ " pillsSizeForMark\">"
														+ "<li role=\"presentation\""
														+ " class=\"dropdown\"><a "
														+ "class=\"btn2 dropdown-toggle"
														+ " markItemCnfg\""
														+ " data-toggle=\"dropdown\""
														+ "> </a>"
														+ "<ul class=\"dropdown-menu\""
														+ " role=\"menu\">"
												for (var i = 1; i <= 12; i++) {
													contentMarks += "<li class=\""
															+ "selectOfMarkCnfg"
															+ " selectedMark\""
															+ " data-value=\""
															+ i
															+ "\">"
															+ " <a class=\""
															+ "selectOfMarkCnfg \">"
															+ i + "</a> </li>"
												}
												contentMarks += "<li class=\"divider\">"
														+ " </li>"
														+ "<li class=\"selectOfMarkCnfg"
														+ " selectedMark\" data-value=\"-1\">"
														+ "<a role=\"menuitem\" "
														+ "class=\"selectOfMarkCnfg"
														+ " selectedMark\""
														+ ">Absent </a> </li>"
														+ "</ul></li></ul></td>";
											} else if (marks[index].mark == (-1)) {
												contentMarks += "<td class=\"tdCenter "
														+ scheduleId
														+ "\">"
														+ "<span class=\"glyphicon"
														+ " glyphicon-remove\">"
														+ "</span> </td>";
											} else {
												contentMarks += "<td class=\"tdCenter "
														+ scheduleId
														+ "\">"
														+ marks[index].mark
														+ "</td>";
											}
										}
										contentMarks += "</tr>";
									}
									$("#journalStudentMarksJS").html(
											contentMarks);
								}
							});
				});

$(document).on("click", ".addMark", function() {
	$("#dateAndStudent").val($(this).data('value'));
});

$(document).on("click", ".date", function() {
	$("#dateEvent").val($(this).data('value'));
});
$(document).on(
		"click",
		"#submitEvent",
		function() {
			// $("#submitEvent").click(
			// function() {
			var scheduleId = $("#dateEvent").val();
			var type = $("#eventTypeSelect").val();
			var description = $("#eventDescriptionSelect").val();

			var event = {
				"scheduleId" : scheduleId,
				"type" : type,
				"description" : description,
			}
			$.ajax({
				url : 'journal-add-event',
				type : 'POST',
				data : JSON.stringify(event),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(event) {

					var name = "mark" + event.scheduleId;
					console.log(this);
					var elements = document.getElementsByName(name);

					for ( var index in elements) {
						if (event.type == 3) {
							addClass(elements[index], "eventTest");
						} else if (event.type == 5) {
							addClass(elements[index], "eventExam");
						}
					}

					function addClass(element, classToAdd) {
						var currentClassValue = element.className;

						if (currentClassValue.indexOf(classToAdd) == -1) {
							if ((currentClassValue == null)
									|| (currentClassValue === "")) {
								element.className = classToAdd;
							} else {
								element.className += " " + classToAdd;
							}
						}
					}

					function removeClass(element, classToRemove) {
						var currentClassValue = element.className;

						if (currentClassValue == classToRemove) {
							element.className = "";
							return;
						}

						var classValues = currentClassValue.split(" ");
						var filteredList = [];

						for (var i = 0; i < classValues.length; i++) {
							if (classToRemove != classValues[i]) {
								filteredList.push(classValues[i]);
							}
						}

						element.className = filteredList.join(" ");
					}
				}
			});
		});

$(document).on(
		"click",
		".selectedMark",
		function() {

			var studentAndSchedule = $("#dateAndStudent").val();
			var mark = $(this).data('value');

			var json = {
				"studentAndSchedule" : studentAndSchedule,
				"mark" : mark,
			}

			$.ajax({
				url : 'journal-add-mark',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(mark) {
					var id = "";
					id += "#" + studentAndSchedule;
					content = "";
					if (mark == (-1)) {
						content += "<table> <tr> <td class=\"tdCenter\">"
								+ " <span class=\"glyphicon glyphicon-remove\""
								+ " aria-hidden=\"true\"></span> "
								+ "</td></tr></table>";
					} else {
						content += "<table> <tr> <td class=\"tdCenter\">"
								+ mark + "</td></tr></table>";
					}
					$(id).html(content);
				}
			});
		});

$("#presentRadio").click(function() {
	$("#markSelectTable").show();
});

$("#absentRadio").click(function() {
	$("#markSelectTable").hide();
});
