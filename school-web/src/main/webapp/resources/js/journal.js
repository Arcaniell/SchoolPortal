$(function() {
	$("#submitSearch").click();
});

$(function() {
	if ($('#exception').val() == "exception") {
		$('#journal-error').modal('show');
	}
});

$(document).on(function() {
	if ($('#exception').val() == "exception") {
		$('#journal-error').modal('show');
	}
});

$(document).on("fadeIn", "#studentsTH");

$("#groupNumberSelect").change(
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
			$.ajax({
				url : 'journal-letter',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(groupLetters) {
					var content = " ";
					for (letter in groupLetters) {
						content += "<option value=\"" + groupLetters[letter]
								+ "\">" + groupLetters[letter] + "</option>\n";
					}
					$("#groupLetterSelect").html(content);
				}
			});
		});

$("#subjectSelect").change(
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
			$.ajax({
				url : 'journal-subject',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(groupNumbers) {
					var content = " ";
					for (number in groupNumbers) {
						content += "<option value=\"" + groupNumbers[number]
								+ "\">" + groupNumbers[number] + "</option>\n";
					}
					$("#groupNumberSelect").html(content);

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
					$.ajax({
						url : 'journal-letter',
						type : 'POST',
						data : JSON.stringify(json),
						dataType : 'json',
						contentType : 'application/json',
						mimeType : 'application/json',
						success : function(groupLetters) {
							var content = " ";
							for (letter in groupLetters) {
								content += "<option value=\""
										+ groupLetters[letter] + "\">"
										+ groupLetters[letter] + "</option>\n";
							}
							$("#groupLetterSelect").html(content);
						}
					});
				}
			});
		});

$(document).on("click", ".panel-title", function() {
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

$(".panel-title").css("cursor", "pointer");
$(".panel-title").css("text-decoration", "underline");
$(".panel-title").css("text-decoration-color", "blue");

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
											+ "<th> Students </th><th class =\"qm\""
											+ " title=\"Quarter mark\">"
											+ "QM</th></tr>";
									for ( var student in groupMarks) {
										contentStd += "<tr class=\"trSize\"><th><a id=\""
												+ groupMarks[student].userId
												+ "\" class=\"panel-title\">";
										var studentWithMark = groupMarks[student];
										contentStd += studentWithMark.studentName
												+ "</a></th><th id=\"qm"
												+ groupMarks[student].studentId
												+ "\">"
										if (groupMarks[student].quarterMark != 0) {
											contentStd += groupMarks[student].quarterMark;
										}
										contentStd += "</th></tr>";
									}
									$("#studentsNamesOfGroup").html(contentStd);
									var dates = groupMarks[0].markList;
									var curDate = new Date(groupMarks[0].date);
									curDate.setHours(0, 0, 0, 0);
									var contentMarks = "<tr class=\"info "
											+ "trHeaderRow\">";
									for ( var date in dates) {
										var scheduleId = dates[date].scheduleId;
										var dateOfMark = new Date(
												dates[date].date);
										contentMarks += "<th name=\"date"
												+ scheduleId + "\" class=\""
												+ scheduleId;
										if (dateOfMark > curDate) {
											if (dates[date].markCoefficient == 3
													|| dates[date].markCoefficient == 5) {
												contentMarks += " hasEvent";
											} else if (dates[date].markCoefficient == 0) {
												contentMarks += " hasNoEvent";
											}
											if (dates[date].homeTask != null) {
												contentMarks += " hasHomeTask";
											} else if (dates[date].homeTask == null) {
												contentMarks += " hasNoHomeTask";
											}

											contentMarks += " futureDate\""
													+ "data-toggle=\"modal\""
													+ "data-target=\""
													+ ".journal-add-mark-modal";
										} else if (dateOfMark < curDate) {
											contentMarks += " previousDate";
										} else {
											contentMarks += " currentDate";
										}
										contentMarks += "\" data-value=\""
												+ scheduleId + "\">"
										dateOfMark = (dateOfMark.getDate()
												+ "."
												+ (dateOfMark.getMonth() + 1)
												+ "." + (dateOfMark.getYear() - 100));
										contentMarks += dateOfMark + "</th>";
									}
									contentMarks += "</tr>";
									for ( var student in groupMarks) {
										contentMarks += "<tr class=\"trSize\">";
										var studentId = groupMarks[student].studentId;
										var marks = groupMarks[student].markList;
										var currentDate = new Date(
												groupMarks[0].date);
										currentDate = (currentDate.getDate()
												+ "."
												+ (currentDate.getMonth() + 1)
												+ "." + (currentDate.getYear() - 100));
										for ( var index in marks) {
											var dateOfMark = new Date(
													marks[index].date);
											dateOfMark = (dateOfMark.getDate()
													+ "."
													+ (dateOfMark.getMonth() + 1)
													+ "." + (dateOfMark
													.getYear() - 100));
											var scheduleId = marks[index].scheduleId;
											if (marks[index].mark == 0
													&& currentDate == dateOfMark) {
												contentMarks += "<td name=\""
														+ "mark"
														+ scheduleId
														+ "\" id=\""
														+ studentId
														+ "j"
														+ scheduleId
														+ "\" data-value=\""
														+ studentId
														+ "j"
														+ scheduleId
														+ "\"class=\"tdCenter addMark";
												if (marks[index].markCoefficient == 3) {
													contentMarks += " eventTest"
												} else if (marks[index].markCoefficient == 5) {
													contentMarks += " eventExam"
												}
												contentMarks += "\" >"
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
														+ "<a class=\"selectOfMarkCnfg\""
														+ ">Absent </a> </li>"
														+ "</ul></li></ul></td>";
											} else if (marks[index].mark == 0
													&& currentDate != dateOfMark) {
												contentMarks += "<td name=\""
														+ "mark"
														+ scheduleId
														+ "\" class=\"tdCenter "
														+ scheduleId;
												if (marks[index].markCoefficient == 3) {
													contentMarks += " eventTest"
												} else if (marks[index].markCoefficient == 5) {
													contentMarks += " eventExam"
												}
												contentMarks += "\"> </td>";
											} else if (marks[index].mark != 0
													&& currentDate != dateOfMark) {
												contentMarks += "<td name=\""
														+ "mark"
														+ scheduleId
														+ "\" class=\"tdCenter "
														+ scheduleId;
												if (marks[index].markCoefficient == 3) {
													contentMarks += " eventTest"
												} else if (marks[index].markCoefficient == 5) {
													contentMarks += " eventExam"
												}
												contentMarks += "\">";
												if (marks[index].mark == (-1)) {
													contentMarks += "n/a";
												} else {
													contentMarks += marks[index].mark;
												}
												contentMarks += "</td>";
											} else if (marks[index].mark != 0
													&& currentDate == dateOfMark) {
												contentMarks += "<td name=\""
														+ "mark"
														+ scheduleId
														+ "\" id=\""
														+ studentId
														+ "j"
														+ scheduleId
														+ "\" data-value=\""
														+ studentId
														+ "j"
														+ scheduleId
														+ "\"class=\"tdCenter addMark";
												if (marks[index].markCoefficient == 3) {
													contentMarks += " eventTest"
												} else if (marks[index].markCoefficient == 5) {
													contentMarks += " eventExam"
												}
												contentMarks += "\" >"
														+ "<input id=\"dateAndStudent\""
														+ " type=\"hidden\" value=\" \" />"
														+ "<ul class=\"nav nav-pills"
														+ " pillsSizeForMark\">"
														+ "<li role=\"presentation\""
														+ " class=\"dropdown\"><a "
														+ "class=\"btn2 dropdown-toggle"
														+ " markItemCnfg\""
														+ " data-toggle=\"dropdown\""
														+ "> ";
												if (marks[index].mark == (-1)) {
													contentMarks += "n/a";
												} else {
													contentMarks += marks[index].mark;
												}
												contentMarks += "</a>"
														+ "<ul class=\"dropdown-menu\""
														+ " role=\"menu\">"
														+ "<li class=\""
														+ "selectOfMarkCnfg"
														+ " deletedMark\""
														+ "\">"
														+ " <a class=\""
														+ "selectOfMarkCnfg \">"
														+ "Delete</a> </li>"
														+ "</ul></li></ul>"
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

$(document).on("click", ".futureDate", function() {
	$("#editedDate").val($(this).data('value'));
});

$(document).on("click", ".hasNoEvent", function() {
	$("#eventCB-Div").fadeIn();
	$("#deleteEventCB-Div").hide();
})

$(document).on("click", ".hasEvent", function() {
	$("#eventCB-Div").hide();
	$("#deleteEventCB-Div").fadeIn();

});

$(document).on("click", "#deleteEventButton", function() {

	var scheduleId = $("#editedDate").val();
	var eventType = $("#eventTypeSelect").val();
	var eventDescription = $("#eventDescriptionSelect").val();
	var homeTask = $("#homeTasksSelect").val();

	var event = {
		"scheduleId" : scheduleId,
		"eventType" : eventType,
		"eventDescription" : eventDescription,
		"homeTask" : homeTask,
	}
	$.ajax({
		url : 'journal-delete-event',
		type : 'POST',
		data : JSON.stringify(event),
		dataType : 'json',
		contentType : 'application/json',
		mimeType : 'application/json',
		success : function(success) {
			$("#eventCB-Div").fadeIn();
			$("#deleteEventCB-Div").hide();
			var markName = "mark" + scheduleId;
			var dateName = "date" + scheduleId;
			var markElements = document.getElementsByName(markName);
			var dateElements = document.getElementsByName(dateName);

			$(dateElements[0]).removeClass("hasEvent");
			$(dateElements[0]).addClass("hasNoEvent");

			for ( var index in markElements) {
				$(markElements[index]).removeClass("eventTest");
				$(markElements[index]).removeClass("eventExam");
			}
		}
	});
});

$(document).on("click", ".hasNoHomeTask", function() {
	$("#homeworkCB-Div").fadeIn();
	$("#deleteHomeworkCB-Div").hide();
});
$(document).on("click", ".hasHomeTask", function() {
	$("#homeworkCB-Div").hide();
	$("#deleteHomeworkCB-Div").fadeIn();
});

$(document).on("click", "#deleteHomeworkButton", function() {

	var scheduleId = $("#editedDate").val();
	var eventType = $("#eventTypeSelect").val();
	var eventDescription = $("#eventDescriptionSelect").val();
	var homeTask = $("#homeTasksSelect").val();

	var event = {
		"scheduleId" : scheduleId,
		"eventType" : eventType,
		"eventDescription" : eventDescription,
		"homeTask" : homeTask,
	}
	$.ajax({
		url : 'journal-delete-hometask',
		type : 'POST',
		data : JSON.stringify(event),
		dataType : 'json',
		contentType : 'application/json',
		mimeType : 'application/json',
		success : function(success) {
			$("#homeworkCB-Div").fadeIn();
			$("#deleteHomeworkCB-Div").hide();
			var dateName = "date" + scheduleId;
			var dateElements = document.getElementsByName(dateName);

			$(dateElements[0]).removeClass("hasHomeTask");
			$(dateElements[0]).addClass("hasNoHomeTask");
		}
	});
});

$(document)
		.on(
				"click",
				".selectedMark",
				function() {

					var studentAndSchedule = $("#dateAndStudent").val();
					var mark = $(this).data('value');
					var quarterMark = 0;
					var studentId = 0;
					var subject = $("#subjectSelect").val();
					var groupNumber = $("#groupNumberSelect").val();
					var groupLetter = $("#groupLetterSelect").val();
					var quarter = $("#quarterSelect").val();

					var json = {
						"studentAndSchedule" : studentAndSchedule,
						"mark" : mark,
						"quarterMark" : quarterMark,
						"studentId" : studentId,
						"searchData" : {
							"subject" : subject,
							"groupNumber" : groupNumber,
							"groupLetter" : groupLetter,
							"quarter" : quarter
						}
					}

					$
							.ajax({
								url : 'journal-edit-mark',
								type : 'POST',
								data : JSON.stringify(json),
								dataType : 'json',
								contentType : 'application/json',
								mimeType : 'application/json',
								success : function(markDTO) {
									var markId = "";
									markId += "#" + studentAndSchedule;
									var qmId = "";
									qmId += "#qm" + markDTO.studentId;
									console.log(qmId);
									contentMarks = "";
									contentMarks += "<input id=\"dateAndStudent\""
											+ " type=\"hidden\" value=\" \" />"
											+ "<ul class=\"nav nav-pills"
											+ " pillsSizeForMark\">"
											+ "<li role=\"presentation\""
											+ " class=\"dropdown\"><a "
											+ "class=\"btn2 dropdown-toggle"
											+ " markItemCnfg\" data-toggle=\"dropdown\""
											+ "> ";
									if (markDTO.mark == (-1)) {
										contentMarks += "n/a";
									} else {
										contentMarks += markDTO.mark;
									}
									contentMarks += "</a><ul class=\"dropdown-menu\""
											+ " role=\"menu\"> <li class=\""
											+ "selectOfMarkCnfg deletedMark\">"
											+ " <a class=\"selectOfMarkCnfg \">"
											+ "Delete</a> </li></ul></li></ul>"
									$(markId).html(contentMarks);
									var qm = "";
									qm += markDTO.quarterMark;
									console.log(qm);
									$(qmId).html(qm);

								}
							});
				});

$(document).on(
		"click",
		".deletedMark",
		function() {

			var studentAndSchedule = $("#dateAndStudent").val();
			var mark = 0;
			var quarterMark = 0;
			var studentId = 0;
			var subject = $("#subjectSelect").val();
			var groupNumber = $("#groupNumberSelect").val();
			var groupLetter = $("#groupLetterSelect").val();
			var quarter = $("#quarterSelect").val();

			var json = {
				"studentAndSchedule" : studentAndSchedule,
				"mark" : mark,
				"quarterMark" : quarterMark,
				"studentId" : studentId,
				"searchData" : {
					"subject" : subject,
					"groupNumber" : groupNumber,
					"groupLetter" : groupLetter,
					"quarter" : quarter
				}
			}

			$.ajax({
				url : 'journal-edit-mark',
				type : 'POST',
				data : JSON.stringify(json),
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(markDTO) {
					var id = "";
					id += "#" + studentAndSchedule;
					var qmId = "";
					qmId += "#qm" + markDTO.studentId;
					contentMarks = "";
					contentMarks += "<input id=\"dateAndStudent\""
							+ " type=\"hidden\" value=\" \" />"
							+ "<ul class=\"nav nav-pills"
							+ " pillsSizeForMark\">"
							+ "<li role=\"presentation\""
							+ " class=\"dropdown\"><a "
							+ "class=\"btn2 dropdown-toggle"
							+ " markItemCnfg\" data-toggle=\"dropdown\">"
							+ "  </a><ul class=\"dropdown-menu\""
							+ " role=\"menu\">"
					for (var i = 1; i <= 12; i++) {
						contentMarks += "<li class=\"" + "selectOfMarkCnfg"
								+ " selectedMark\"" + " data-value=\"" + i
								+ "\">" + " <a class=\""
								+ "selectOfMarkCnfg \">" + i + "</a> </li>"
					}
					contentMarks += "<li class=\"divider\">" + " </li>"
							+ "<li class=\"selectOfMarkCnfg"
							+ " selectedMark\" data-value=\"-1\">"
							+ "<a class=\"selectOfMarkCnfg\""
							+ ">Absent </a></li></ul></li></ul>";
					$(id).html(contentMarks);
					var qm = "";
					qm += markDTO.quarterMark;
					$(qmId).html(qm);
				}
			});
		});

$(document).on("click", "#submitEditDate", function() {

	var scheduleId = $("#editedDate").val();
	var eventType = $("#eventTypeSelect").val();
	var eventDescription = $("#eventDescriptionSelect").val();
	var homeTask = $("#homeTasksSelect").val();

	var event = {
		"scheduleId" : scheduleId,
		"eventType" : eventType,
		"eventDescription" : eventDescription,
		"homeTask" : homeTask,
	}
	$.ajax({
		url : 'journal-edit-date',
		type : 'POST',
		data : JSON.stringify(event),
		dataType : 'json',
		contentType : 'application/json',
		mimeType : 'application/json',
		success : function(editedDate) {
			$("#eventCB").click();
			$("#homeworkCB").click();

			var markName = "mark" + editedDate.scheduleId;
			var dateName = "date" + editedDate.scheduleId;
			var markElements = document.getElementsByName(markName);
			var dateElements = document.getElementsByName(dateName);

			if (editedDate.eventType == 3 || editedDate.eventType == 5) {
				$(dateElements[0]).addClass("hasEvent");
				$(dateElements[0]).removeClass("hasNoEvent");
			}
			if (editedDate.homeTask != "") {
				$(dateElements[0]).addClass("hasHomeTask");
				$(dateElements[0]).removeClass("hasNoHomeTask");
			}

			for ( var index in markElements) {
				if (editedDate.eventType == 3) {
					$(markElements[index]).addClass("eventTest");
				} else if (editedDate.eventType == 5) {
					$(markElements[index]).addClass("eventExam");
				}
			}
		}
	});
});

$("#eventCB").click(function() {
	if (this.checked) {
		$("#eventSelect").fadeIn();
	} else {
		$("#eventTypeSelect").val(0);
		$("#eventDescriptionSelect").val("");
		$("#eventSelect").fadeOut();
	}
});

$("#homeworkCB").click(function() {
	if (this.checked) {
		$("#homeworkSelect").fadeIn();
	} else {
		$("#homeworkSelect").fadeOut();
		$("#homeTasksSelect").val("");
	}
});