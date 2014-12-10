	$(function() {
		$('#tokenfieldtypeahead').tokenInput(
				"${pageContext.request.contextPath}/emailInput", {
					theme : "facebook",
					queryParam : 'tagName',
					preventDuplicates : true
				});
	});

	$(function() {
		$('.animated').autosize();
	});

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

	function validateEmail(id) {
		if ($("#" + id).val() == null || $("#" + id).val() == "") {
			var ul = $("#" + id).prev();
			ul.addClass("has-errorUl");
			return false;
		} else {
			var ul = $("#" + id).prev();
			ul.removeClass("has-errorUl");
			return true;
		}
	}

	$(document).ready(
			function() {
				$("#sendMessageButton").click(
						function() {
							if (validateText("textArea")
									&& validateText("subjectArea")
									&& validateEmail("tokenfieldtypeahead")) {
								$("form#composeForm").submit();
							} else {
								$('#textUnderC').removeAttr("style");
							}
						});
			}

	);
	
	$(document).ready(function() {
		var count = 0;
		$(".col-sm-10 ul").each(function() {
			if (count == 0) {
				count++;
			} else {
				$(this).remove();
			}
		});
	});
