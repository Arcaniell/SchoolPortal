<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript">
	$(function() {
		$('#tokenfieldtypeahead').tokenInput(
				"${pageContext.request.contextPath}/emailInput", {
					theme : "facebook",
					queryParam : 'tagName',
					preventDuplicates : true
				});
	});
</script>
<script>
	$(function() {
		$('.animated').autosize();
	});
</script>
<script>
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
</script>



<!-- Modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog"
	aria-labelledby="composeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<spring:message code="conversation.composeMessage" />
				</h4>
			</div>

			<div class="modal-body">
					<!-- <p style="float: left;">Select by:</p> -->
					<select id="mySelectBox" class="selectCompose form-control">
						<option>Name or email</option>
						<option>Group</option>
					</select>

<!-- 				<script>
					$("#mySelectBox")
							.change(
									function() {
										$("select option:selected")
												.each(
														function() {
															alert($(
																	'#mySelectBox option')
																	.filter(
																			':selected')
																	.text());
														});
									}).trigger("change");
				</script> -->
				<form action="${pageContext.request.contextPath}/compose"
					name="composeTable" class="form-horizontal" method="post"
					role="form" id="composeForm">
					<div class="form-group">
						<label for="inputTo" class="col-sm-2 control-label composeText"><spring:message
								code="conversation.to" /></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="to"
								id="tokenfieldtypeahead"
								placeholder="<spring:message code="conversation.toWhom" />" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputSubject"
							class="col-sm-2 control-label composeText"><spring:message
								code="conversation.subject" /></label>
						<div class="col-sm-10">
							<input name="subject" type="text" class="form-control"
								id="subjectArea"
								placeholder="<spring:message code="conversation.writeASubject" />">
						</div>
					</div>
					<div class="form-group">
						<label for="inputMessage"
							class="col-sm-2 control-label composeText"><spring:message
								code="conversation.message" /></label>
						<div class="col-sm-10">
							<textarea
								placeholder="<spring:message code="conversation.writeAMessage" />"
								name="text" class="form-control textInput animated"
								id="textArea" rows="3"></textarea>
							<span id="textUnderC" class="textUnderC" style="display: none;">All
								fields are required!</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" value="Send" id="sendMessageButton"
								class="btn btn-primary">
								<spring:message code="conversation.send" />
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<spring:message code="conversation.close" />
							</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>