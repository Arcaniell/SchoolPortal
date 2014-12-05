<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<c:url value="/resources/css/conversations.css" />"
	rel="stylesheet">

<link href="resources/css/jquery-ui.css" type="text/css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/token-input.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/token-input-facebook.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/jquery.autosize.js" />"></script>
<script src="<c:url value="/resources/js/jquery.tokeninput.js" />"></script>
<script>
	$(function() {
		$('.animated').autosize();
	});
</script>
<script type="text/javascript">
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

	$(document).ready(function() {
		$("#replyMessageButton").click(function() {
			if (validateText("replyTextArea")) {
				$("form#replyForm").submit();
			} else {
				$('#textUnderS').removeAttr("style");
			}
		});
	});
</script>
<script>
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
		$(".panel-title").css("text-decoration-color", "blue");

	});
</script>

<ul class="nav nav-tabs">

	<li><a href='<c:url value="../messages"/>'><spring:message
				code="conversation.inbox" /><span class="badge">${inboxSize}</span>
	</a></li>
	<li class="active"><a href='<c:url value="../message"/>'><spring:message
				code="conversation.sent" /><span class="badge">${sentSize}</span> </a></li>
	<li id="compose">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#composeModal">
			<spring:message code="conversation.compose" />
		</button>
	</li>
	<jsp:include page="/views/messages/compose.jsp" />
</ul>
<h3>${subject}</h3>
<c:choose>
	<c:when test="${messagesDto.size() > 0}">
		<form action="${pageContext.request.contextPath}/delete-message"
			method="post">
			<c:forEach items="${messagesDto}" var="messageDto">
				<div style="float: left; padding-right: 7px;">
					<img class="messageLogo"
						src="<c:url value="/resources/img/photo/${messageDto.userId}.png" />" />
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 id="${messageDto.userId}" class="panel-title">${messageDto.name}</h3>
						<span class="messageDate">${messageDto.dateTime}</span>
						<button type="submit" value="${messageDto.id}" name="messageId"
							class="closeMessage close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
					</div>
					<div class="messageText panel-body">${messageDto.text}</div>
				</div>
			</c:forEach>
		</form>
		<c:set var="dtos" value="${messagesDto}" />
		<form id="replyForm" action="${pageContext.request.contextPath}/reply"
			method="post">
			<input type="hidden" value="${dtos[0].id}" name="messageId" />
			<div class="mform-group1">
				<span id="textUnderS" class="textUnderS" style="display: none;">Field
					is required!</span>
				<textarea style="resize: none;" name="replyText" id="replyTextArea"
					class="form-control animated" rows="3"
					placeholder="<spring:message code="conversation.replyToThisMessage" />"></textarea>
			</div>
			<button type="button" value="Reply" id="replyMessageButton"
				class="btn btn-primary">
				<spring:message code="conversation.reply" />
			</button>
		</form>
	</c:when>
	<c:otherwise>
		<p id="sentEmpty" class="sentEmpty">
			<spring:message code="conversation.emptyConversation" />
		</p>
	</c:otherwise>
</c:choose>

<script src="<c:url value="/resources/js/messages.js" />"></script>
<jsp:include page="/views/profile/profile_information_runner.jsp" />