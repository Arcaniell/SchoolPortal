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
			<li class="first"><a href="home" style="z-index: 9;"><span></span><spring:message code="header.home"/></a></li>
			<c:if test = "${not empty current}">
				<c:if test = "${current == 'courses'}">
					<li class="active"><a href="courses" style="z-index: 8;"><spring:message code="sidebar.course"/></a></li>
				</c:if>
				<c:if test = "${current == 'group'}">
					<li class="active"><a href="groups" style="z-index: 8;"><spring:message code="sidebar.groups"/></a></li>
				</c:if>
				<c:if test = "${current == 'request'}">
					<li class="active"><a href="course-request" style="z-index: 8;"><spring:message code="sidebar.request"/></a></li>
				</c:if>
			</c:if>
		</ul>
		
		<sec:authorize access="isAnonymous()">
		
		<button id="loginButton" class="btn btn-default" data-toggle="modal"
			data-target="#logIn">
			<spring:message code="label.login" />
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
				<li><a href="?lang=en">English</a></li>
				<li><a href="?lang=ua">Українська</a></li>
				<li><a href="?lang=ru">Русский</a></li>
			</ul>
		</div>

		<jsp:include page="/views/home/login.jsp" />
		<jsp:include page="/views/home/registration.jsp" />
		<jsp:include page="/views/home/registration_succes.jsp" />
		<jsp:include page="/views/home/registration_failure.jsp" />
		<jsp:include page="/views/home/forgotapassword.jsp" />
		<jsp:include page="/views/home/forgotapassword_succes.jsp" />
		<jsp:include page="/views/home/forgotapassword_failure.jsp" />
		<input type="hidden" id="root_action" value="${root_action}">
		
		

	</div>