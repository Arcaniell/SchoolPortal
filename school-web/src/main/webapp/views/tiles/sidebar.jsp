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
	<img class="logo"  src="<c:url value="/photo/${pageContext.request.userPrincipal.name}" />" />	
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<img class="logo"
		src="<c:url value="/resources/img/logos/school-logo.png" />" />
</sec:authorize>
<div class="internal-buttons">
	<ul class="nav nav-sidebar">
		<sec:authorize access="isAuthenticated()">
			<li><a href="profile"><spring:message code="sidebar.profile" /></a></li>
		</sec:authorize>
		<li><a href="#"><spring:message code="sidebar.schedule" /></a></li>
		<sec:authorize access="hasAnyRole('ROLE_STUDENT', 'ROLE_PARENT')">
			<li><a href="diary"><spring:message code="sidebar.diary" /></a></li>
		</sec:authorize>
		<sec:authorize
			access="hasAnyRole('ROLE_HEAD_TEACHER', 'ROLE_TEACHER')">
			<li><a href="journal"><spring:message code="sidebar.journal" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER', 'ROLE_PARENT')">
			<li><a class="sidebarMessage" href='<c:url value="/inbox"/>'><spring:message
						code="sidebar.message" /> </a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_STUDENT')">
			<li><a href=student-courses><spring:message code="sidebar.course" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER')">
			<li><a href=teacher-courses><spring:message code="sidebar.course" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_HEAD_TEACHER')">
			<li><a href=headteacher-courses><spring:message code="sidebar.course" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_STUDENT')">
			<li><a href=student-groups><spring:message code="sidebar.groups" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER')">
			<li><a href=teacher-groups><spring:message code="sidebar.groups" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_HEAD_TEACHER')">
			<li><a href=headteacher-groups><spring:message code="sidebar.groups" /></a></li>
		</sec:authorize>
		<sec:authorize
			access="hasAnyRole('ROLE_HEAD_TEACHER', 'ROLE_STUDENT')">
			<li><a href=course-request><spring:message
						code="sidebar.request" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_TEACHER')">
			<li><a href=salary><spring:message code="sidebar.salary" /></a></li>
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
		}, 200000);
	})();
</script>
