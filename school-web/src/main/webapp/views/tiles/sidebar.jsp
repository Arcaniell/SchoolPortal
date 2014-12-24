<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ page session="false"%>
<%
	String user_name = (String) request.getSession().getAttribute(
			"user_name");
	if (user_name == null) {
		user_name = "";
	}
%>

<sec:authorize access="isAuthenticated()">
	<div class="profile-info"><%=user_name%></div>
	<img class="logo"
		src="<c:url value="/resources/img/photo/${pageContext.request.userPrincipal.name}.png" />" />
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<img class="logo"
		src="<c:url value="/resources/img/logos/school-logo.jpg" />" />
</sec:authorize>
<div class="internal-buttons">
	<ul class="nav nav-sidebar">
		<sec:authorize access="isAuthenticated()">
			<li><a href="${root_action}profile"><spring:message
						code="sidebar.profile" /></a></li>
		</sec:authorize>

		<li><a href="schedule"><spring:message
					code="sidebar.schedule" /></a></li>
		<sec:authorize access="hasAnyRole('ROLE_STUDENT', 'ROLE_PARENT')">
			<li><a href="${root_action}diary"><spring:message
						code="sidebar.diary" /></a></li>
		</sec:authorize>
		<sec:authorize
			access="hasAnyRole('ROLE_HEAD_TEACHER', 'ROLE_TEACHER')">
			<li><a href="${root_action}journal"><spring:message
						code="sidebar.journal" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER', 'ROLE_PARENT')">
			<li><a class="sidebarMessage"
				href='<c:url value="${root_action}messages"/>'><spring:message
						code="sidebar.message" /> </a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_STUDENT')">
			<li><a href="${root_action}student-courses"><spring:message
						code="sidebar.course.student" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER')">
			<li><a href="${root_action}teacher-courses"><spring:message
						code="sidebar.course.teacher" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_HEAD_TEACHER')">
			<li><a href="${root_action}headteacher-courses"><spring:message
						code="sidebar.course.h.teacher" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_STUDENT')">
			<li><a href="${root_action}student-groups"><spring:message
						code="sidebar.group.student" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER')">
			<li><a href="${root_action}teacher-groups"><spring:message
						code="sidebar.group.teacher" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_HEAD_TEACHER')">
			<li><a href="${root_action}headteacher-groups"><spring:message
						code="sidebar.group.h.teacher" /></a></li>
		</sec:authorize>
		<sec:authorize
			access="hasAnyRole('ROLE_HEAD_TEACHER', 'ROLE_STUDENT')">
			<li><a href="${root_action}course-request"><spring:message
						code="sidebar.request" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_TEACHER')">
			<li><a href="${root_action}salary"><spring:message
						code="sidebar.salary" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="${root_action}admin">Admin Panel</a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_DIRECTOR')">
			<li><a href="${root_action}payroll"><spring:message
						code="sidebar.payroll" /></a></li>
		</sec:authorize>
		<li><a href="#"><spring:message code="sidebar.contacts" /></a></li>
		<li><a href="#"><spring:message code="sidebar.about" /></a></li>
	</ul>
</div>

<div>
	<input id="exception" value="${exception}" type="hidden">
	<c:if test="${exception ne null}">
		
	</c:if>
</div>

<div id="error-modal" class="modal fade journal-error" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Error</h4>
			</div>
			<div id="errorBody" class="modal-body">
				<table class="table">
					<tr style="border: 0;">
						<th>
							<h3 class="errorDisc">Sorry, but there is no data for your
								request</h3>
						</th>
					</tr>
					<tr>
						<td id="RightSideBarJournal" class="submitEditDateButton">
							<button id="errorOK" type="button" class="btn btn-primary"
								data-dismiss="modal" style="margin-left: 190px;">OK</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		if ($('#exception').val() == "exception") {

			$('#error-modal').modal('show');
		}
	});

	(function(poll) {
		var poll = function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/newMessages',
				dataType : 'json',
				type : 'get',
				success : function(data) {
					$("#newMessages").text(data.newMessages);
				},
				error : function() {
					console.log("Error while counting new messages");
				}
			});
		};
		setInterval(function() {
			poll();
		}, 20000);
	})();
</script>
