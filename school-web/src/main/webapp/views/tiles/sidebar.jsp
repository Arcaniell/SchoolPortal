<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<sec:authorize access="isAuthenticated()">
	<p class="profile-info"></p>
	<!-- <input name = "userId" type=hidden value="${pageContext.request.userPrincipal.name}"> -->
	<img class="logo"
		src="<c:url value="/resources/img/logos/${pageContext.request.userPrincipal.name}.png" />" />
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<img class="logo"
		src="<c:url value="/resources/img/logos/school-logo.png" />" />
</sec:authorize>
<div class="internal-buttons">
	<ul class="nav nav-sidebar">
		<sec:authorize access="isAuthenticated()">
			<li><a href="#"><spring:message code="sidebar.profile" /></a></li>
		</sec:authorize>
		<li><a href="#"><spring:message code="sidebar.schedule" /></a></li>
		<sec:authorize access="hasRole('ROLE_TEACHER')">
			<li><a href="journal"><spring:message code="sidebar.journal" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER', 'ROLE_PARENT')">
			<li><a href='<c:url value="/inbox"/>'><spring:message
						code="sidebar.message" /></a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER', 'ROLE_STUDENT')">
			<li><a href=courses><spring:message code="sidebar.course" /></a></li>
			<li><a href=course-request><spring:message
						code="sidebar.request" /></a></li>
		</sec:authorize>
		<li><a href="#"><spring:message code="sidebar.contacts" /></a></li>
		<li><a href="#"><spring:message code="sidebar.about" /></a></li>
	</ul>
</div>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script src="<c:url value="/resources/js/course-request.js" />"
	type="text/javascript"></script>