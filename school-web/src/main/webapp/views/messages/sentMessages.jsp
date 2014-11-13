<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="<c:url value="/resources/css/conversations.css" />"
	rel="stylesheet">
<ul class="nav nav-tabs">
	<li><a href='<c:url value="../inbox"/>'>Inbox<span
			class="badge">${inboxSize}</span>
	</a></li>
	<li class="active"><a href='<c:url value="../sent"/>'>Sent<span class="badge">${sentSize}</span>
	</a></li>
	<li id="compose">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#composeModal">Compose</button>
	</li>
	<jsp:include page="/views/messages/compose.jsp" />
	<li id="delete">
		<button id="delete-button" type="submit" class="btn btn-danger"
			form="mForm">Delete</button>
	</li>
</ul>
<h3>${subject}</h3>
<c:choose>
	<c:when test="${messagesDto.size() > 0}">
		<form id="mForm"
			action="${pageContext.request.contextPath}/delete-messages"
			method="post">
			<c:forEach items="${messagesDto}" var="messageDto">
				<div>
					<div style="display: inline-block;">
						<input type="checkbox" name="selected" value="${messageDto.id}" />
					</div>
					<div style="display: inline-block;" class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">${messageDto.name}</h3>
							<span class="messageDate">${messageDto.dateTime}</span>
						</div>
						<div class="panel-body">${messageDto.text}</div>
					</div>
				</div>
			</c:forEach>
		</form>
		<div class="mform-group">
			<textarea class="form-control" rows="3"
				placeholder="reply to this message..."></textarea>
		</div>
		<button type="submit" value="Reply" class="btn btn-primary">Reply</button>
	</c:when>
	<c:otherwise>
		<p id="empty">Empty conversation</p>
	</c:otherwise>	
</c:choose>