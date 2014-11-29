<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="<c:url value="/resources/css/conversations.css" />"
	rel="stylesheet">

<link href="resources/css/jquery-ui.css" type="text/css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/token-input.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/token-input-facebook.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/jquery.autosize.js" />"></script>
<%-- <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script> --%>
<script src="<c:url value="/resources/js/jquery.tokeninput.js" />"></script>

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

<ul class="nav nav-tabs">
	<li><a href='<c:url value="../inbox"/>'><spring:message code="conversation.inbox" /><span
			class="badge">${inboxSize}</span>
	</a></li>
	<li class="active"><a href='<c:url value="../sent"/>'><spring:message code="conversation.sent" /><span class="badge">${sentSize}</span>
	</a></li>
	<li id="compose">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#composeModal"><spring:message code="conversation.compose" /></button>
	</li>
	<jsp:include page="/views/messages/compose.jsp" />
</ul>
<h3>${subject}</h3>
<c:choose>
	<c:when test="${messagesDto.size() > 0}">
		<form action="${pageContext.request.contextPath}/delete-message"
			method="post">
			<c:forEach items="${messagesDto}" var="messageDto">
				<div>
					<div style="display: inline;">
						<img class="messageLogo"
							src="<c:url value="/resources/img/logos/${messageDto.userId}.png" />" />
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">${messageDto.name}</h3>
							<span class="messageDate">${messageDto.dateTime}</span>
							<button type="submit" value="${messageDto.id}" name="messageId"
								class="closeMessage close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>

						</div>
						<div class="messageText panel-body">${messageDto.text}</div>
					</div>
				</div>
			</c:forEach>
		</form>
		<c:set var="dtos" value="${messagesDto}" />
		<form action="${pageContext.request.contextPath}/reply" method="post">
			<input type="hidden" value="${dtos[0].id}" name="messageId" />
			<div class="mform-group1">
				<textarea name="replyText" class="form-control" rows="3"
					placeholder="<spring:message code="conversation.replyToThisMessage" />"></textarea>
			</div>
			<button type="submit" value="Reply" class="btn btn-primary"><spring:message code="conversation.reply" /></button>
		</form>
	</c:when>
	<c:otherwise>
		<p id="empty"><spring:message code="conversation.emptyConversation" /></p>
	</c:otherwise>
</c:choose>