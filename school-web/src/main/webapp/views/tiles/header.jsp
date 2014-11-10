<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page session="false"%>
<body>
	<div class="header">

		<ul class="crumbs">
			<li class="first"><a href="home" style="z-index: 9;"><span></span>Home</a></li>
			<li class="active"><a href="#"
				style="z-index: 8;">My profile</a></li>
			<li class="active"><a
				href="journal" style="z-index: 7;">Journal</a></li>
			<li class="active"><a
				href='<spring:url value="/inbox.html"></spring:url>'
				style="z-index: 6;">Messages</a></li>
		</ul>
		
		<sec:authorize access="isAnonymous()">
		
		<button class="btn btn-default" data-toggle="modal"
			data-target="#logIn">
			<spring:message code="label.enter" />
		</button>
		
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<a class="btn btn-default" href="<c:url value="/j_spring_security_logout"/>"><spring:message code="label.logout"/></a>
</sec:authorize>

		

		<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<spring:message code="label.language" />
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="?lang=en">en</a></li>
				<li><a href="?lang=ua">ua</a></li>
				<li><a href="?lang=ru">ru</a></li>
			</ul>
		</div>

		<jsp:include page="/views/home/login.jsp" />
		<jsp:include page="/views/home/registration.jsp" />

	</div>