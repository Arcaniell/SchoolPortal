<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="profile-info">Lora Palmer</div>
<img class="logo"
	src="<c:url value="/resources/img/logo.png" />" />
<div class="internal-buttons">
	<ul class="nav nav-sidebar">
		<li class="active"><a href="#">Profile</a></li>
		<li><a href="#">Schedule</a></li>
		<li><a href="journal">Journal</a></li>
		<li><a href='<spring:url value="/inbox.html"></spring:url>'>Message</a></li>
		<li><a href=courses>My courses</a></li>
		<li><a href="course-request">Course request</a></li>
		<li><a href="#">Contacts</a></li>
		<li><a href="#">About Us</a></li>
	</ul>
</div>