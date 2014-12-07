<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="<c:url value="/resources/css/conversations.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/token-input.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/token-input-facebook.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/jquery.autosize.js" />"></script>
<script src="<c:url value="/resources/js/jquery.tokeninput.js" />"></script>

<ul class="nav nav-tabs">
	<li id="inboxButton"><a><spring:message
				code="conversation.inbox" /><span id="inboxCount" class="badge">${conversationsDto[0].inboxCount}</span>
	</a></li>
	<li class="active" id="sentButton"><a><spring:message
				code="conversation.sent" /><span id="sentCount" class="badge">${conversationsDto[0].sentCount}</span>
	</a></li>
	<li id="compose">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#composeModal">
			<spring:message code="conversation.compose" />
		</button>
	</li>
	<jsp:include page="/views/messages/compose.jsp" />
	<li id="delete">
		<button id="delete-button" type="submit" class="btn btn-danger"
			form="cForm">
			<spring:message code="conversation.delete" />
		</button>
	</li>
</ul>
<form id="cForm" action="delete-conversations" method="post">
	<table class="table table-hover paginated" id="conversationTable"
		style="display:;">
		<tbody id="conversationBody">
			<c:choose>
				<c:when test="${conversationsDto[0].sentCount != 0}">

					<c:forEach items="${conversationsDto}" var="conversation"
						varStatus="status">
						<tr>
							<td class="checkBox"><input type="checkbox" name="selected"
								value="${conversation.id}" /></td>
							<td
								class="${conversation.hasNewMessages == 'true' ? 'name bold' : 'name'}"><a
								href='<c:url value="/inbox/${conversation.id}"/>'>${conversation.name}</a></td>
							<td
								class="${conversation.hasNewMessages == 'true' ? 'subject bold' : 'subject'}"><a
								href='<c:url value="/inbox/${conversation.id}"/>'>${conversation.subject}</a></td>
							<td
								class="${conversation.hasNewMessages == 'true' ? 'date bold' : 'date'}"><a
								href='<c:url value="/inbox/${conversation.id}"/>'>${conversation.date}</a></td>
						</tr>
					</c:forEach>

				</c:when>
				<c:otherwise>
					<p id="inboxEmptyDefault" class="inboxEmpty" style="display:;">
						<spring:message code="conversation.noSentMessages" />
					</p>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<p id="inboxEmpty" class="inboxEmpty" style="display: none;">
		<spring:message code="conversation.noInboxMessages" />
	</p>
	<p id="sentEmpty" class="sentEmpty" style="display: none;">
		<spring:message code="conversation.noSentMessages" />
	</p>
</form>
<div class="context-footer">
	<select id="select" class="form-control row_count">
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="50">50</option>
	</select>
	<div class="pages"></div>
</div>
<script>
$(document).ready(
		function() {
			$(".btn-success").click(
					function() {
						$(".token-input-token-facebook").remove();
					});
		}

);
</script>
<script src="<c:url value="/resources/js/utils/pagination.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/messages.js" />"></script>