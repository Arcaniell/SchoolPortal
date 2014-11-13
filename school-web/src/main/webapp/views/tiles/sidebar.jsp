<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="profile-info">Lora Palmer</div>
<img class="logo" src="<c:url value="/resources/img/logo.png" />" />
<div class="internal-buttons">
	<ul class="nav nav-sidebar">
		<li class="active"><a href="#">Profile</a></li>
		<li><a href="#">Schedule</a></li>
		<sec:authorize access="hasRole('ROLE_TEACHER')">
			<li><a href="journal">Journal</a></li>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_TEACHER', 'ROLE_PARENT')">
			<li><a href='<c:url value="/inbox"/>'>Message</a></li>
		</sec:authorize>
		<li><a href=courses>My courses</a></li>
		<li><a href=course-request>Course request</a></li>

		<li><a href="#">Contacts</a></li>
		<li><a href="#">About Us</a></li>
	</ul>
</div>