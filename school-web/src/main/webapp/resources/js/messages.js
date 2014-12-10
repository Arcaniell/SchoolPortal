$("#inboxButton")
		.click(
				function() {

					var json = {
						"button" : "inbox"
					};

					$
							.ajax({
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								url : 'inboxOrSentButton',
								type : 'post',
								data : JSON.stringify(json),

								success : function(ConversationDto) {
									if (ConversationDto[0].id != "null") {
										$("#inboxEmptyDefault").css("display",
												"none");

										if ($("#sentButton").hasClass("active")) {
											$("#sentButton").removeClass(
													"active");
										}
										if (!$("#inboxButton").hasClass(
												"active")) {
											$("#inboxButton")
													.addClass("active");
										}

										$("#inboxCount").html(
												ConversationDto[0].inboxCount);
										$("#sentCount").html(
												ConversationDto[0].sentCount);

										var tableBody = " ";

										if (ConversationDto[0].inboxCount != "0") {
											$("#conversationTable").css(
													"display", "");
											$("#inboxEmptyDefault").css(
													"display", "none");
											$("#inboxEmpty").css("display",
													"none");
											$("#sentEmpty").css("display",
													"none");
											for (dto in ConversationDto) {
												$("#inboxEmpty").css("display",
														"none");
												tableBody += "<tr>";
												tableBody += "<td class=\"checkBox\"><input type=\"checkbox\" name=\"selected\"";
												tableBody += "value=\""
														+ ConversationDto[dto].id
														+ "\" /></td>";

												if (ConversationDto[dto].hasNewMessages == true) {
													tableBody += "<td class=\"name bold\"><a ";
												} else {
													tableBody += "<td class=\"name\"><a ";
												}
												tableBody += "href=\"/school-web/inbox/"
														+ ConversationDto[dto].id
														+ "\">"
														+ ConversationDto[dto].name
														+ "</a></td>";
												if (ConversationDto[dto].hasNewMessages == true) {
													tableBody += "<td class=\"subject bold\"><a ";
												} else {
													tableBody += "<td class=\"subject\"><a ";
												}
												tableBody += "href=\"/school-web/inbox/"
														+ ConversationDto[dto].id
														+ "\">"
														+ ConversationDto[dto].subject
														+ "</a></td>";
												if (ConversationDto[dto].hasNewMessages == true) {
													tableBody += "<td class=\"date bold\"><a ";
												} else {
													tableBody += "<td class=\"date\"><a ";
												}
												tableBody += "href=\"/school-web/inbox/"
														+ ConversationDto[dto].id
														+ "\">"
														+ ConversationDto[dto].date
														+ "</a></td>";
												tableBody += "</tr>";
											}

										} else {
											$("#conversationTable").css(
													"display", "none");
											$("#sentEmpty").css("display",
													"none");
											$("#inboxEmpty").css("display", "");
										}

										$("#conversationBody").html(tableBody);

										if (ConversationDto.length <= 10) {
											document.getElementById("select").value = "10";
											$(".row_count").change();
										} else {
											document.getElementById("select").value = "15";
											$(".row_count").change();
										}

									} else {
										var url = document.URL.split('/');
										var newUrl = "";
										for (var i = 0; i < url.length - 1; i++) {
											newUrl += url[i];
											newUrl += "/";
										}
										newUrl += "signinfailure";
										window.location.href = newUrl;
									}

								}
							});
				});

$("#sentButton")
		.click(
				function() {

					var json = {
						"button" : "sent"
					};

					$
							.ajax({
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								url : 'inboxOrSentButton',
								type : 'post',
								data : JSON.stringify(json),

								success : function(ConversationDto) {
									if (ConversationDto[0].id != "null") {
										$("#inboxEmptyDefault").css("display",
												"none");
										$("#inboxEmpty").css("display", "none");
										$("#sentEmpty").css("display", "none");

										if ($("#inboxButton")
												.hasClass("active")) {
											$("#inboxButton").removeClass(
													"active");
										}
										if (!$("#sentButton")
												.hasClass("active")) {
											$("#sentButton").addClass("active");
										}

										$("#inboxCount").html(
												ConversationDto[0].inboxCount);
										$("#sentCount").html(
												ConversationDto[0].sentCount);

										var tableBody = " ";

										if (ConversationDto[0].sentCount != "0") {
											$("#conversationTable").css(
													"display", "");
											$("#sentEmptyDefault").css(
													"display", "none");
											for (dto in ConversationDto) {
												$("#sentEmpty").css("display",
														"none");
												tableBody += "<tr>";
												tableBody += "<td class=\"checkBox\"><input type=\"checkbox\" name=\"selected\"";
												tableBody += "value=\""
														+ ConversationDto[dto].id
														+ "\" /></td>";

												if (ConversationDto[dto].hasNewMessages == true) {
													tableBody += "<td class=\"name bold\"><a ";
												} else {
													tableBody += "<td class=\"name\"><a ";
												}
												tableBody += "href=\"/school-web/sent/"
														+ ConversationDto[dto].id
														+ "\">"
														+ ConversationDto[dto].name
														+ "</a></td>";
												if (ConversationDto[dto].hasNewMessages == true) {
													tableBody += "<td class=\"subject bold\"><a ";
												} else {
													tableBody += "<td class=\"subject\"><a ";
												}
												tableBody += "href=\"/school-web/sent/"
														+ ConversationDto[dto].id
														+ "\">"
														+ ConversationDto[dto].subject
														+ "</a></td>";
												if (ConversationDto[dto].hasNewMessages == true) {
													tableBody += "<td class=\"date bold\"><a ";
												} else {
													tableBody += "<td class=\"date\"><a ";
												}
												tableBody += "href=\"/school-web/sent/"
														+ ConversationDto[dto].id
														+ "\">"
														+ ConversationDto[dto].date
														+ "</a></td>";
												tableBody += "</tr>";
											}

										} else {
											$("#conversationTable").css(
													"display", "none");
											$("#inboxEmpty").css("display",
													"none");
											$("#sentEmpty").css("display", "");
										}

										$("#conversationBody").html(tableBody);
										if (ConversationDto.length <= 10) {
											document.getElementById("select").value = "10";
											$(".row_count").change();
										} else {
											document.getElementById("select").value = "15";
											$(".row_count").change();
										}
									} else {
										var url = document.URL.split('/');
										var newUrl = "";
										for (var i = 0; i < url.length - 1; i++) {
											newUrl += url[i];
											newUrl += "/";
										}
										newUrl += "signinfailure";
										window.location.href = newUrl;
									}
								}
							});
				});

$(function() {
	$('.animated').autosize();
});

if (window.location.href.indexOf('#') === -1) {
	(function() {
		var scrollTop;

		if ('pageXOffset' in window) {
			scrollTop = window.pageYOffset;
		} else {
			scrollTop = document.documentElement.scrollTop;
		}

		try {
			if ((scrollTop > 0) === false) {
				window.scrollTo(0, 550);
				setTimeout(arguments.callee, 1);
			}
		} catch (e) {
			setTimeout(arguments.callee, 1);
		}
	})();
}

function validateText(id) {
	if ($("#" + id).val() == null || $("#" + id).val() == "") {
		var div = $("#" + id).closest("div");

		div.addClass("has-error");
		return false;
	} else {
		var div = $("#" + id).closest("div");
		div.removeClass("has-error");
		return true;
	}
}

$(document).ready(function() {
	$("#replyMessageButton").click(function() {
		if (validateText("replyTextArea")) {
			$("form#replyForm").submit();
		} else {
			$('#textUnder').removeAttr("style");
		}
	});
});

$(document).ready(function() {

	$(".panel-title").click(function() {
		var id = $(this).attr("id");
		$.ajax({
			type : "GET",
			url : "../profile/information",
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
	$(".panel-title").css("text-decoration-color", "black");

});

$(document).ready(function() {
	$(".btn-primary").click(function() {
		$(".token-input-token-facebook").remove();
		$("#mySelectBox").removeClass("form-control2");
		$("#mySelectBox").addClass("form-control");
	});
}

);
