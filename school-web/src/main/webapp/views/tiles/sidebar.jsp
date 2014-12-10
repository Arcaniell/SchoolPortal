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
		src="<c:url value="/photo/${pageContext.request.userPrincipal.name}" />" />
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
		
		<li><a href="schedule"><spring:message code="sidebar.schedule" /></a></li>
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
		<sec:authorize
			access="hasRole('ROLE_TEACHER')">
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
<script>
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
		}, 2000);
	})();
</script>
