<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="<c:url value="/resources/css/conversations.css" />"
	rel="stylesheet">

<ul class="nav nav-tabs">
	<li class="active"><a
		href='<c:url value="inbox"/>'>Inbox<span
			class="badge">${conversationsDto.size()}</span>
	</a></li>
	<li><a href='<c:url value="sent"/>'>Sent<span
			class="badge">${sentSize}</span>
	</a></li>
	<li id="compose">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#composeModal">Compose</button>
	</li>
	<jsp:include page="/views/messages/compose.jsp" />
	<li id="delete">
		<button id="delete-button" type="submit" class="btn btn-danger"
			form="cForm">Delete</button>
	</li>
</ul>
<table class="tablem">
	<tbody>
		<c:choose>
			<c:when test="${conversationsDto.size() > 0}">
				<form id="cForm" action="delete-conversations" method="post">
					<c:forEach items="${conversationsDto}" var="conversation"
						varStatus="status">
						<tr>
							<td><input type="checkbox" name="selected"
								value="${conversation.id}" /></td>
							<td class="name"><a
								href='<c:url value="/inbox/${conversation.id}"/>'>${conversation.firstName}
									${conversation.lastName}</a></td>
							<td class="subject"><a
								href='<c:url value="/inbox/${conversation.id}"/>'>${conversation.subject}</a></td>
							<td class="date"><a href='<c:url value="/inbox/${conversation.id}"/>'>${conversation.date}</a></td>
						</tr>
					</c:forEach>
				</form>
			</c:when>
			<c:otherwise>
				<p id="empty">You have no inbox messages</p>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>